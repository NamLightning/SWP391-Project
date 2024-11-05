<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment by QR</title>
        <script>
            let countdown = 120;

            function startCountdown() {
                let countdownElement = document.getElementById("countdown");
                let interval = setInterval(() => {
                    let minutes = Math.floor(countdown / 60);
                    let seconds = countdown % 60;
                    countdownElement.innerText = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

                    if (countdown <= 0) {
                        clearInterval(interval);
                        document.getElementById("paymentStatus").innerText = "Payment time expired.";
                    }
                    countdown--;
                }, 1000);
            }

            function checkPaymentStatus() {
                fetch("checkPaymentStatus")
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === "paid") {
                                document.getElementById("paymentStatus").innerText = "Payment Successful!";
                            } else {
                                document.getElementById("paymentStatus").innerText = "Not finished payment yet.";
                            }
                        });
            }

            window.onload = function () {
                startCountdown();
            };
        </script>
    </head>
    <body>
    <center>
        <h2>Payment by VietQR</h2>
        <img loading="lazy" src="https://img.vietqr.io/image/VCB-1024180772-qr_only.png?amount=1000&addInfo=TNHchuyentien" alt="QR Code">
        <p>Time remain: <span id="countdown">2:00</span></p>
        <p id="paymentStatus">Waiting for payment...</p>
    </center>
</body>
</html>

<style>
    img{
        width: 200px;
        height: 200px;
    }
</style>