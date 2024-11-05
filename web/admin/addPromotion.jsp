<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="../css/createPro.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>

    <body>
        <!--navbar-->
        <div class="container">
            <%@include file="../includes/sidebar.jsp"%>
            <!--home-->
            <div class="main">
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <div class="user">
                        <img src="#" alt="">
                    </div>

                </div>
                
                
                
                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2 style="font-size: 30px;">Add Promotion</h2>
                        </div>

                        <div class="search" style="justify-self: center;">

                            <label class="property">
                                <p>Promotion name:</p>
                                <input id="promotionName " name="promotionName" type="text" placeholder="Promotion Name"
                                       value="">
                            </label>

                            <label class="property">
                                <p>Promotion description:</p>
                                <input id="promotionDesc" name="promotionDesc" type="text"
                                       placeholder="Promotion description" value="">
                            </label>

                            <label class="property">
                                <p>Discount Percent :</p>
                                <input id="discount" name="discount" type="number" placeholder="Discount Percent" value="" min="0" max="100">
                            </label>                        

                            <label class="property">
                                <p>Start Date:</p>
                                <input id="startDate " name="startDate" type="datetime-local" placeholder="Start Date" value="">
                            </label>

                            <label class="property">
                                <p>End Date:</p>
                                <input id="endDate" name="endDate" type="datetime-local" placeholder="End Date" value="">
                            </label>


                            <div style="justify-self: center;">
                                <input name="submit" class="btn-add" type="submit" value="Add">

                            </div>
                        </div>


                    </div>

                </div>

            </div>
        </div>


        <script src="../js/sidebar.js"></script>


        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>