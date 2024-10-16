<%@page import="java.util.List"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%@page import="Dao.CustomerDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="../css/sidebar.css">
        <link rel="stylesheet" href="../css/manageIndex.css">
    </head>
    <body>

        <section class="manage-container">
            <div class="layout-container">
                <%@include file="../includes/sidebar.jsp"%>
                <main class="main-content">
                    <header class="header">
                        <h2 class="greeting">Hello Admin 👋🏼,</h2>

                    </header>
                    <section class="stats-container">
                        <div class="stat-card">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9ec7d05a46ccde9ccb5f9fc272047901ce874e51d77cba0f4ff3d680b2aec654?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="stat-icon">
                            <div class="stat-info">
                                <h3 class="stat-title">Total Customers</h3>
                                <p class="stat-value">150</p>
                                <p class="stat-change positive-change">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/cce45859924f456ea8384800fdc9eefa68e95228506c1fefd96599f03aa65d4e?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="change-icon">
                                    <span>16% this month</span>
                                </p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0891f45d77b45371128215970071ddeb9a989aeb56bde614d3f47956a5ec7fe4?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="stat-icon">
                            <div class="stat-info">
                                <h3 class="stat-title">Members</h3>
                                <p class="stat-value">63</p>
                                <p class="stat-change negative-change">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/2a79006c34d61b9b2dd68bdbfdcf266a14b40e236067f637198a56e2e0df9a26?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="change-icon">
                                    <span>1% this month</span>
                                </p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/23afe41930e43bacbb073f829e444ff254dd8a50d8f85481527ec196dd02a850?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="stat-icon">
                            <div class="stat-info">
                                <h3 class="stat-title">Active Now</h3>
                                <p class="stat-value">23</p>
                            </div>
                        </div>
                    </section>
                    <section class="customer-table">
                        <div class="table-header">
                            <h2 class="table-title">All Customers</h2>
                            <div class="table-actions">
                                <form class="search-bar" role="search" style="margin:0;">
                                    <label for="main-search" class="visually-hidden">Search</label>
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/8b2dc3ba60109a9eda2de58d621c4511e56b2afbb7f63680d7c89a1dc900c24a?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="search-icon">
                                    <input type="search" id="main-search" class="search-input" placeholder="Search">
                                </form>
                                <select name="sort-cus">
                                    <option name="newest" selected>Newest</option>
                                    <option name="oldest">Oldest</option>
                                </select>
                            </div>
                        </div>
                        <table class="table-content">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Gender</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                </tr>
                            </thead>

                        </table>
                        <div class="table-footer">
                            <p class="table-info">Showing data 1 to 8 of 256K entries</p>
                            <nav class="pagination" aria-label="Customer table pagination">
                                <a href="#" class="pagination-item" aria-label="Previous page">&lt;</a>
                                <a href="#" class="pagination-item">1</a>
                                <a href="#" class="pagination-item">2</a>
                                <a href="#" class="pagination-item">3</a>
                                <a href="#" class="pagination-item">4</a>
                                <span class="pagination-item">...</span>
                                <!--<a href="#" class="pagination-item"></a>-->
                                <a href="#" class="pagination-item" aria-label="Next page">&gt;</a>
                            </nav>
                        </div>
                    </section>
                </main>
            </div>
        </section>
    </body>
</html>
