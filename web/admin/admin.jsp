<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
                    document.addEventListener('DOMContentLoaded', function() {
                    const ctx = document.getElementById('myChart').getContext('2d');
                            const myChart = new Chart(ctx, {
                            type: 'line',
                                    data: {
                                    labels: [],
                                            datasets: [{
                                            label: 'Real-Time Data',
                                                    data: [],
                                                    borderColor: 'rgba(75, 192, 192, 1)',
                                                    borderWidth: 1,
                                                    fill: false,
                                            }]
                                    },
                                    options: {
                                    responsive: true, // Enable responsive resizing
                                            maintainAspectRatio: true, // Allows custom aspect ratio
                                            scales: {
                                            y: { beginAtZero: true }
                                            }
                                    }
                            });
                            const maxDataPoints = 10;
                            function fetchData() {
                            const xhr = new XMLHttpRequest();
                                    xhr.open('GET', '/PetStore/DataServlet', true);
                                    xhr.onload = function() {
                                    if (xhr.status === 200) {
                                    // Inject the returned HTML into the page
                                    document.getElementById('data-container').innerHTML = xhr.responseText;
                                            // Parse the HTML to get the value
                                            const parser = new DOMParser();
                                            const doc = parser.parseFromString(xhr.responseText, 'text/html');
                                            const label = doc.querySelector('p').innerText.split(': ')[2]; // Get label
                                            const value = parseInt(doc.querySelectorAll('p')[1].innerText.split(': ')[1]); // Get value

                                            // Update the chart
                                            if (myChart.data.labels.length > maxDataPoints) {
                                    myChart.data.labels.shift(); // Remove the first label
                                            myChart.data.datasets[0].data.shift(); // Remove the first data point
                                    }
                                    myChart.data.labels.push(label);
                                            myChart.data.datasets[0].data.push(value);
                                            myChart.update();
                                    }
                                    };
                                    xhr.send();
                            }

                    // Call fetchData at regular intervals
                    setInterval(fetchData, 30000); // Fetch data every 30 seconds
                    }); // This closes the DOMContentLoaded event listener
        </script>
    </head>
    <body>
        <div class="container">
            <%@include file="../includes/sidebar.jsp"%>
            <div class="main">
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <div class="user hover-item" id="hoverItem">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                    </div>
                    <%@include file="adminMenu.jsp"%>
                </div>

                <div class="details ">
                    <div class="recentOrders ">
                        <div class="cardHeader" style="margin-left: 20px;">
                            <h2>Item Analytic Report</h2>
                            <a href="#" class="btn">View Statistic</a>
                        </div>
                        <div id="data-container" hidden></div>
                        <div id="chart">
                            <canvas id="myChart" width="400" height="200"></canvas>
                        </div>
                    </div>


                    <div class="recentCustomers">
                        <div class="cardHeader" style="justify-content: center;">
                            <h2>Quick Stats</h2>
                        </div>
                        <div class="cardBox">
                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Daily Views</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="eye-outline"></ion-icon>
                                </div>
                            </div>
                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Orders</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="cart-outline"></ion-icon>
                                </div>
                            </div>

                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Comment</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="chatbubble-outline"></ion-icon>
                                </div>
                            </div>

                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Earning</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="card-outline"></ion-icon>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="../js/lineChart.js"></script>
            <script src="../js/sidebar.js"></script>
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>
