<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VNPay</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>

    <body>

        <div class="container">
            <div class="header clearfix">

                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3>Create New Order</h3>
            <div class="table-responsive">
                <form action="vnpayajax" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount">Amount</label>
                        <input data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${amount}"/>
                    </div>
                    <h4>Choose payment method</h4>
                    <!--                    <div class="form-group">
                                            <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                                           <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                                           <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>
                                           
                                           <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                                           <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                                           <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>
                                           
                                           <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                                           <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>
                                           
                                           <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                                           <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>
                                           
                                        </div>-->
                    <!--                    <div class="form-group">
                                            <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                                             <input type="radio" id="language" Checked="True" name="language" value="vn">
                                             <label for="language">Tiếng việt</label><br>
                                             <input type="radio" id="language" name="language" value="en">
                                             <label for="language">Tiếng anh</label><br>
                                             
                                        </div>-->
                    <button type="submit" class="btn btn-default">Payment</button>
                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>


<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 0;
    }

    .header, .footer {
        text-align: center;
        padding: 15px;
        background-color: #007bff;
        color: #fff;
    }

    .header h3, .footer p {
        margin: 0;
        font-size: 1.5em;
        font-weight: 300;
    }

    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
    }

    .form-container {
        background-color: #ffffff;
        border-radius: 8px;
        padding: 25px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    }

    h3, h4, h5 {
        color: #333;
        text-align: center;
    }

    h4 {
        margin-top: 20px;
        font-weight: 600;
    }

    h5 {
        margin-top: 15px;
        font-size: 1.1em;
        font-weight: 500;
    }

    label {
        font-weight: 500;
        font-size: 1rem;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-control {
        border-radius: 5px;
        height: 45px;
        padding: 10px;
        font-size: 1rem;
    }

    .form-check-label {
        font-weight: 500;
        font-size: 1.1rem;
        margin-left: 5px;
    }

    .payment-option-label {
        font-size: 1.05rem;
    }

    .btn-primary {
        width: 100%;
        background-color: #007bff;
        border-color: #007bff;
        padding: 10px;
        font-size: 1.1em;
        font-weight: 600;
        color: #fff;
        transition: background-color 0.3s ease;
        border-radius: 5px;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .footer p {
        color: #fff;
        font-size: 0.9em;
        margin-top: 20px;
    }

    /* Radio Button Customization */
    .form-check-input {
        width: 20px;
        height: 20px;
        cursor: pointer;
    }

    .form-check {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    @media (max-width: 576px) {
        .container {
            padding: 15px;
        }
        .header h3, .footer p {
            font-size: 1.2em;
        }
        h4 {
            font-size: 1.3em;
        }
        h5 {
            font-size: 1.1em;
        }
        label {
            font-size: 0.95rem;
        }
    }
</style>