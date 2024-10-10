<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="../css/sidebar.css">
        <link rel="stylesheet" href="../css/manageUser.css">
    </head>
    <body>
        <section class="manage-customer">
            <div class="layout-container">
                <%@include file="../includes/sidebar.jsp"%>
                <main class="main-content">
                    <header class="header">
                        <h2 class="greeting">Hello Admin 👋🏼,</h2>
                        <form class="search-bar" role="search">
                            <label for="main-search" class="visually-hidden">Search</label>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/8b2dc3ba60109a9eda2de58d621c4511e56b2afbb7f63680d7c89a1dc900c24a?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="search-icon">
                            <input type="search" id="main-search" class="search-input" placeholder="Search">
                        </form>
                    </header>
                    <section class="stats-container">
                        <div class="stat-card">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9ec7d05a46ccde9ccb5f9fc272047901ce874e51d77cba0f4ff3d680b2aec654?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="stat-icon">
                            <div class="stat-info">
                                <h3 class="stat-title">Total Customers</h3>
                                <p class="stat-value">5,423</p>
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
                                <p class="stat-value">1,893</p>
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
                                <p class="stat-value">189</p>
                            </div>
                        </div>
                    </section>
                    <section class="customer-table">
                        <div class="table-header">
                            <h2 class="table-title">All Customers</h2>
                            <div class="table-actions">
                                <form class="table-search" role="search">
                                    <label for="customer-search" class="visually-hidden">Search customers</label>
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/65263591b0f45e5220030603df0ea3e9c43382a3c6df449ba200932096e3a061?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="search-icon">
                                    <input type="search" id="customer-search" class="search-input" placeholder="Search">
                                </form>
                                <div class="table-sort">
                                    <span>Short by : <strong>Newest</strong></span>
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/6b382f9ba832b07585a55f3843e020134649284cfc7a763f63cc98597d07ddd8?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Sort icon" class="menu-icon">
                                </div>
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
                            <tbody>
                                <tr>
                                    <td>Nguyen Thanh Phi</td>
                                    <td>Male</td>
                                    <td>(84) 255-27319</td>
                                    <td>phinguyen@gmail.com</td>
                                    <td>14 Phan Dang Luu</td>
                                    <td><span class="status-active">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Tran Manh</td>
                                    <td>Male</td>
                                    <td>(84) 345-12383</td>
                                    <td>manh12@gmail.com</td>
                                    <td>25 Nui Thanh</td>
                                    <td><span class="status-inactive">Inactive</span></td>
                                </tr>
                                <tr>
                                    <td>Le Thi Lien</td>
                                    <td>Female</td>
                                    <td>(84) 255-27319</td>
                                    <td>liennt@gmail.com</td>
                                    <td>176 Chan Thi Vinh Te</td>
                                    <td><span class="status-inactive">Inactive</span></td>
                                </tr>
                                <tr>
                                    <td>Phung Van Quy</td>
                                    <td>Male</td>
                                    <td>(84) 255-27319</td>
                                    <td>mrquy@outlook.com</td>
                                    <td>13 Le Hien</td>
                                    <td><span class="status-active">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Nguyen Dieu Linh</td>
                                    <td>Female</td>
                                    <td>(84) 255-27319</td>
                                    <td>diulinhne@gmail.com</td>
                                    <td>65 Le Dai Hanh</td>
                                    <td><span class="status-active">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Phan Kha Nhu</td>
                                    <td>Female</td>
                                    <td>(84) 255-27319</td>
                                    <td>nhunhobe@gmail.com</td>
                                    <td>02 Mai Hac De</td>
                                    <td><span class="status-active">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Cao Thanh Nga</td>
                                    <td>Female</td>
                                    <td>(84) 255-27319</td>
                                    <td>ngathanhcao@outlook.com</td>
                                    <td>213 Nguyen Tat Thanh</td>
                                    <td><span class="status-active">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Pham Thanh Duong</td>
                                    <td>Male</td>
                                    <td>(84) 255-27319</td>
                                    <td>phDuong99@gmail.com</td>
                                    <td>100 Quang Trung</td>
                                    <td><span class="status-inactive">Inactive</span></td>           
                                </tr>
                            </tbody>
                        </table>
                        <div class="table-footer">
                            <p class="table-info">Showing data 1 to 8 of 256K entries</p>
                            <nav class="pagination" aria-label="Customer table pagination">
                                <a href="#" class="pagination-item" aria-label="Previous page">&lt;</a>
                                <!--<a href="#" class="pagination-item active" aria-current="page">1</a>-->
                                <a href="#" class="pagination-item">1</a>
                                <a href="#" class="pagination-item">2</a>
                                <a href="#" class="pagination-item">3</a>
                                <a href="#" class="pagination-item">4</a>
                                <span class="pagination-item">...</span>
                                <a href="#" class="pagination-item">40</a>
                                <a href="#" class="pagination-item" aria-label="Next page">&gt;</a>
                            </nav>
                        </div>
                    </section>
                </main>
            </div>
        </section>
    </body>
</html>
