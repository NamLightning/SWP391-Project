<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/items.css">
    </head>
    <body>
    <center>
        <div class="left-sidebar"></div>
        <%@include file="includes/header.jsp" %>
        <link rel="stylesheet" href="css/items.css">
        <div class="right-sidebar"></div>
        <section class="filters-cards">
            <aside class="filters">
                <div class="filter-category">
                    <h2 class="filter-title">Filter by categories</h2>
                    <ul class="category-list">
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl?action=furniture">
                                Furniture
                            </label>
                            <span class="category-count" data-count="furniture"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl?action=accessory">
                                Accessories
                            </label>
                            <span class="category-count" data-count="accessories"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl?action=cloth">
                                Clothes
                            </label>
                            <span class="category-count" data-count="clothes"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl" checked disabled>
                                Food
                            </label>
                            <span class="category-count" data-count="food"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="error.jsp">
                                Sale
                            </label>
                            <span class="category-count" data-count="sale"></span>
                        </li>
                    </ul>
                    <script src="js/checkbox.js"></script>
                </div>
                <section class="filter-price-container">
                    <h2 class="filter-price-title">Filter by Price</h2>
                    <input type="range" id="priceRange" class="price-range-slider" min="50000" max="1000000" step="10000" value="500000" aria-label="Price range slider">
                    <div class="price-range-controls">
                        <p style="margin:0;">Price: </p>
                        <p id="priceDisplay" class="price-range-text">500.000₫</p>
                        <button class="apply-button" aria-label="Apply price filter">Apply</button>
                    </div>
                </section>
            </aside>
            <main class="product-section">
<!--                <header class="product-header">
                    <p class="results-count">Showing 12 of 12 results</p>
                    <select class="sort-drop" style="padding: 5px; border-radius: 10px;">
                        <option value="latest">Sort by latest</option>
                        <option value="ascendant">Sort by price ascendant</option>
                        <option value="descendant">Sort by price descendant</option>
                    </select>
                </header>-->
                <div class="product-grid">
                    <c:forEach var="p" items="${products}">
                        <article class="product-card">
                            <a href="itemDetails.jsp" style="text-decoration: none">
                            <c:url var="cartLink" value="CartControl">
                                <c:param name="pageSize" value="${pageSize}"></c:param>
                                <c:param name="pageNumber" value="${currentPage}"></c:param>
                                <c:param name="action" value="add"></c:param>
                                <c:param name="id" value="${p.getProductID()}"></c:param>
                            </c:url>
                            <img src="${reuse.loadImage(p.getAvatar_img())}" alt="..." class="product-image">
                            <div class="product-info">
                                <div class="product-details">
                                    <h3 class="product-name">${p.getProductName()}</h3>
                                    <p class="product-price">${p.getPrice()}₫</p>
                                </div>
                            </a>
                                <button class="add-to-cart" aria-label="Add to cart" type="button" <c:if test="${not empty us}">onclick="window.location.href = '${cartLink}'"</c:if>>
                                        <ion-icon name="cart-outline"></ion-icon>
                                    </button>
                                </div>
                            </article>
                                        
                    </c:forEach>
                </div>
                <nav class="pagination" aria-label="Product page navigation">
                    <div class="page-numbers">

                        <c:if test="${currentPage > 1}">
                            <a href="CategoriesControl?page=${currentPage - 1}&size=${pageSize}" class="next-button">Previous</a>
                        </c:if>

                        <c:if test="${currentPage > 3}">
                            <span class="ellipsis">...</span>
                        </c:if>

                        <c:forEach begin="${startPage}" end="${endPage}" var="page">
                            <c:choose>
                                <c:when test="${page == currentPage}">
                                    <strong class="page-number active-page">${page}</strong>
                                </c:when>
                                <c:otherwise>
                                    <a href="CategoriesControl?page=${page}&size=${pageSize}" class="page-number inactive-page">${page}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>


                        <c:if test="${currentPage < totalPages - 2}">
                            <span class="ellipsis">...</span>
                        </c:if>

                        <c:if test="${currentPage < totalPages}">
                            <a href="CategoriesControl?page=${currentPage + 1}&size=${pageSize}" class="next-button">Next</a>
                        </c:if>
                    </div>
                </nav>
            </main>
        </section>
        <%@include file="includes/footer.jsp"%>
    </center>
    <script src="js/price-sort.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>