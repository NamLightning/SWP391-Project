<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="/css/chatbox.css"/>">
    </head>

    <body>
        <button class="chat-btn">
            <img src="<c:url value="/images/chat.svg"/>" width="30" alt="">
        </button>
        <div class="chat-container">
            <div class="chat-header">
                <div class="chat-header-left">
                    <div class="chat-icon">
                        <img src="<c:url value="/images/chat.svg"/>" width="30" alt="">
                    </div>
                    <div class="chat-info">
                        <div class="chat-title">Customer Support</div>
                        <div class="chat-onl">Online</div>
                    </div>
                </div>
                <div>
                    <button class="close-btn"><img src="<c:url value="/images/close.svg"/>" width="15" alt=""></button>

                </div>
            </div>
            <div class="chat-body">
                <!--                <div class="chat-message-container">
                                    <div class="chat-user">User</div>
                                    <div class="chat-message-us">Message from us</div>
                                </div>
                                <div class="chat-message-container-other">
                                    <div class="chat-supporter">Supporter</div>
                                    <div class="chat-message-them">Message from them</div>
                                </div>-->

            </div>
            <div class="chat-input">
                <input id="textMessage" type="text">
                <button id="sendButton" onclick="sendMessage()"><img src="<c:url value="/images/send.svg"/>" width="25"></button>
            </div>        
        </div>

        <!--<textarea id="textAreaMessage" rows="10" cols="50"></textarea>-->

        <script>
            let tabId = sessionStorage.getItem("tabId");

            if (!tabId) {
                tabId = "tab_" + Math.random().toString(36).substr(2, 9);
                sessionStorage.setItem("tabId", tabId);
            }

            var chatHistory = [];
            var websocket = new WebSocket("ws://localhost:8080/SWP_PetHub/chatRoomServer");
            websocket.onopen = function (message) {
                processOpen(message);
            };
            websocket.onmessage = function (message) {
                processMessage(message);
            };
            websocket.onclose = function (message) {
                processClose(message);
            };
            websocket.onerror = function (message) {
                processError(message);
            };

            function processOpen(message) {
            }
            function processMessage(message) {
                const messageTextElement = document.createElement('div');
                let messageHtml = '';
                console.log(message);
                const [senderTabId, text] = message.data.split(':', 2);
                if (senderTabId === tabId) {
                    chatHistory.push({
                        sender: 1,
                        message: text
                    });
                    messageHtml = `
            <div class="chat-message-container">
                <div class="chat-supporter">User</div>
                <div class="chat-message-us">` + text.trim() + `</div>
            </div>`;
                    console.log(chatHistory);
                } else {
                    chatHistory.push({
                        sender: 2,
                        message: text
                    });
                    messageHtml = `
            <div class="chat-message-container-other">
                <div class="chat-supporter">Supporter</div>
                <div class="chat-message-them">` + text.trim() + `</div>
            </div>`
                            ;
                }
                document.querySelector('.chat-body').innerHTML += messageHtml;

            }
            function processClose(message) {
            }
            function processError(message) {
            }

            function sendMessage() {
                if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
                    const sendButton = document.getElementById("sendButton");
                    const messageText = textMessage.value;
                    const message = tabId + ':' + messageText;
                    if (messageText !== "") {
                        websocket.send(message);
                        textMessage.value = "";
                    } else {
                        sendButton.disabled = input.value.trim() === "";
                    }
                }
            }

            document.getElementById("textMessage").addEventListener("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    sendMessage();
                }
            });

            const chatBtn = document.querySelector('.chat-btn');
            const closeBtn = document.querySelector('.close-btn');

            const chatContainer = document.querySelector('.chat-container');
            chatBtn.addEventListener('click', () => {
                chatContainer.classList.toggle('show'); // Toggle the show class
            });

            closeBtn.addEventListener('click', () => {
                chatContainer.classList.remove('show');
            })
        </script>
    </body>

</html>