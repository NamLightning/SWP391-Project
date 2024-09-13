var websocket;
function openSocketEmployee() {
    var username = document.getElementById("username").value;
    websocket = new WebSocket("ws://" + window.location.host + "/PetStore/chatserver/" + username + "/employee");
    document.getElementById("employeeChatWindow").value += "Connected as : " + document.getElementById("username").value + "\n";
    websocket.onmessage = function (event) {
        document.getElementById("employeeChatWindow").value += event.data + "\n";
    };
}

function openSocketCustomer() {
    var username = document.getElementById("username").value;
    websocket = new WebSocket("ws://" + window.location.host + "/PetStore/chatserver/" + username + "/customer");
    document.getElementById("customerChatWindow").value += "Connected as : " + document.getElementById("username").value + "\n";
    websocket.onmessage = function (event) {
        document.getElementById("customerChatWindow").value += event.data + "\n";
    };
}

function sendMessage() {
    var message = document.getElementById("message").value;
    websocket.send(message);
    document.getElementById("message").value = "";
}