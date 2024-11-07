
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Promotions" %>
<%@ page import="Dao.PromotionsDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>My Coupons</title>
        <link rel="stylesheet" href="../css/checkOut.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/footer.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <style>
            /* Modal Styling */
            .modal {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(8px); /* Blurred background */
                z-index: 1000;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Modal Content */
            .modal-content {
                background: white;
                border-radius: 8px;
                padding: 20px;
                max-width: 500px;
                width: 90%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                position: relative;
            }

            /* Close Button */
            .close-button {
                position: absolute;
                top: 0px;
                right: 5px;
                font-size: 24px;
                color: #333;
                cursor: pointer;
            }

            /* Button to open the modal */
            .open-coupon-button {
                margin: 20px;
                padding: 10px 20px;
                background-color: #fd7e14;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .coupon-container {
                /*border-radius: 5px;*/
                background-color: #fff;
                display: flex;
                max-width: 456px;
                flex-direction: column;
                overflow: hidden;
                font-family: Poppins, sans-serif;
                /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
            }

            .coupon-title {
                background-color: #fd7e14;
                color: #fff;
                width: 100%;
                height: 50px;
                margin: 0;
                font-size: 24px;
                font-weight: 600;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .coupon-list {
                display: flex;
                margin: 4%;
                width: 92%;
                flex-direction: column;
                font-weight: 500;
                overflow-y: scroll;
            }

            .coupon-card {
                border-radius: 5px;
                background-color: #fff;
                display: flex;
                margin-top: 25px;
                width: 100%;
                padding-right: 25px;
                gap: 20px;
                flex-wrap: wrap;
                justify-content: space-between;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Disabled (out-of-stock) style */
            .coupon-card.disabled {
                opacity: 0.5;
                filter: grayscale(100%);
                pointer-events: none;
            }

            .coupon-content {
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .coupon-icon {
                aspect-ratio: 1.01;
                object-fit: contain;
                object-position: center;
                width: 100px;
            }

            .coupon-details {
                align-self: start;
                display: flex;
                margin-top: 25px;
                flex-direction: column;
            }

            .coupon-sale {
                color: #333;
                font-size: 15px;
                font-weight: 600;
                line-height: 2;
                margin: 0;
            }

            .coupon-remain {
                color: #fd7e14;
                font-size: 12px;
                margin-top: 1%;
            }

            .real-checkbox {
                width: 20px;
                height: 20px;
                margin-right: 8px;
                accent-color: #fd7e14;
            }

            .confirm-button {
                border-radius: 5px;
                background-color: #fd7e14;
                border-style: hidden;
                align-self: end;
                margin-top: 50px;
                font-size: 15px;
                color: #fff;
                font-weight: 600;
                white-space: nowrap;
                text-align: center;
                padding: 10px 50px;
            }
        </style>

    </head>
    <body>
        <div id="couponModal" class="modal">
            <div class="modal-content">
                <span class="close-button" onclick="closeModal()">&times;</span>
                <center>
                    <div class="coupon-container">
                        <h2 class="coupon-title">My Coupons</h2>
                        <div class="coupon-list">
                            <c:forEach var="coupon" items="${promotions}">
                                <div class="coupon-card ${coupon.remaining == 0 ? 'disabled' : ''}">
                                <!--<div class="coupon-card ${coupon.remaining == 0 ? 'disabled' : ''}">-->
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1a9057ae39e6040c08355c03c9ebc9dfb89a917ef468dc6307299edb7317bbfe?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="coupon-icon"/>
                                    <div class="coupon-details">
                                        <p class="coupon-sale">${promotions.getPromotionName()}</p>
                                    </div>
                                    <input type="radio" name="coupon" class="radio-icon" ${coupon.remaining == 0 ? 'disabled' : ''}/>
                                </div>
                            </c:forEach>
                            <div class="coupon-card">
                                <div class="coupon-content">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1a9057ae39e6040c08355c03c9ebc9dfb89a917ef468dc6307299edb7317bbfe?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Sale 20% coupon icon" class="coupon-icon" />
                                    <div class="coupon-details">
                                        <p class="coupon-sale">Sale 20%</p>
                                        <p class="coupon-remain">Remain: 2</p>
                                    </div>
                                </div>
                                <input type="radio" class="radio-icon">
                            </div>
                            <div class="coupon-card">
                                <div class="coupon-content">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1a9057ae39e6040c08355c03c9ebc9dfb89a917ef468dc6307299edb7317bbfe?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Sale 5% coupon icon" class="coupon-icon" />
                                    <div class="coupon-details">
                                        <p class="coupon-sale">Sale 5%</p>
                                        <p class="coupon-remain">Remain: 2</p>
                                    </div> 
                                </div>   
                                <input type="radio" class="radio-icon">
                            </div>
                            <div class="coupon-card">
                                <div class="coupon-content">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1a9057ae39e6040c08355c03c9ebc9dfb89a917ef468dc6307299edb7317bbfe?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Sale 5% coupon icon" class="coupon-icon" />
                                    <div class="coupon-details">
                                        <p class="coupon-sale">Sale 5%</p>
                                        <p class="coupon-remain">Remain: 2</p>
                                    </div>
                                </div>
                                <input type="radio" class="radio-icon" disabled>
                            </div>
                        </div>
                        <button class="confirm-button" type="submit" onclick="closeModal()">Confirm</button>
                    </div>
                </center>
            </div>
        </div>

        <!-- Button to Open Modal -->
        <%@include file="../checkOut.jsp" %>
    </body>
</html>

<script>
    // Function to open the modal
    function openModal() {
        document.getElementById("couponModal").style.display = "flex";
        document.body.classList.add("modal-open");
    }

    // Function to close the modal
    function closeModal() {
        document.getElementById("couponModal").style.display = "none";
        document.body.classList.remove("modal-open");
    }

    // Close modal when clicking outside of it
    window.onclick = function (event) {
        const modal = document.getElementById("couponModal");
        if (event.target == modal) {
            closeModal();
        }
    }

    // Event listeners for buttons
    document.getElementById("openModalButton").addEventListener("click", openModal);
    document.querySelector(".close-button").addEventListener("click", closeModal);
</script>
