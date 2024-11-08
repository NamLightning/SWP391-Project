<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl?action=accessory" checked disabled>
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
                                <input type="checkbox" class="checkbox" data-url="CategoriesControl">
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
                    <a href="itemDetails.jsp" style="text-decoration: none">
                    <c:forEach var="p" items="${products}">
                        <article class="product-card">
                            <c:url var="itemDetailLink" value="itemDetails.jsp">
                                <c:param name="pageSize" value="${pageSize}"></c:param>
                                <c:param name="pageNumber" value="${currentPage}"></c:param>
                                <c:param name="page" value="accessory"></c:param>
                                <c:param name="id" value="${p.getProductID()}"></c:param>
                            </c:url>
                            <a href="${itemDetailLink}" style="text-decoration: none">
                            <c:url var="cartLink" value="CartControl">
                                <c:param name="pageSize" value="${pageSize}"></c:param>
                                <c:param name="pageNumber" value="${currentPage}"></c:param>
                                <c:param name="action" value="add"></c:param>
                                <c:param name="page" value="accessory"></c:param>
                                <c:param name="id" value="${p.getProductID()}"></c:param>
                            </c:url>
                            <img src="${reuse.loadImage(p.getAvatar_img())}" alt="..." class="product-image">
                            <div class="product-info">
                                <div class="product-details">
                                    <h3 class="product-name">${p.getProductName()}</h3>
                                    <p class="product-price">${p.getPrice()}₫</p>
                                </div></a>
                                <button class="add-to-cart" aria-label="Add to cart" type="button" <c:if test="${not empty us}">onclick="window.location.href = '${cartLink}'"</c:if>>
                                        <ion-icon name="cart-outline"></ion-icon>
                                    </button>
                                </div>
                                <!--</a>-->
                            </article>
                    </c:forEach>
                    </a>
                </div>
                <!--                    <article class="product-card">
                                        <img src="images/leash2.jpg" alt="Pet Collar" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Collar</h3>
                                                <p class="product-price">339.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory1.jpg" alt="Pet Backpack" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Backpack</h3>
                                                <p class="product-price">299.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory2.jpg" alt="White Dog Leash" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name"> White Dog Leash</h3>
                                                <p class="product-price">699.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory3.jpg" alt="Pet Chain" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Chain</h3>
                                                <p class="product-price">365.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory4.jpg" alt="Cat Hat" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Cat Hat</h3>
                                                <p class="product-price">345.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory5.jpg" alt="Dog Scarf" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog Scarf</h3>
                                                <p class="product-price">370.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory6.jpg" alt="Pet Collar" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Collar</h3>
                                                <p class="product-price">355.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory7.jpg" alt="Cat Scarf" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Cat Scarf</h3>
                                                <p class="product-price">1.299.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory8.jpg" alt="Pet Ribbon" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Ribbon</h3>
                                                <p class="product-price">298.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory9.jpg" alt="Cat Collections" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Cat Collections</h3>
                                                <p class="product-price">339.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                    <article class="product-card">
                                        <img src="images/accessory10.jpg" alt="Pet Headband" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Pet Headband</h3>
                                                <p class="product-price">375.000₫</p>
                                            </div>
                                            <button class="favorite-button" aria-label="Add to favorites">
                                                <span class="heart-icon"></span>
                                            </button>
                                        </div>
                                    </article>
                                </div>-->
                <nav class="pagination" aria-label="Product page navigation">
                    <div class="page-numbers">

                        <c:if test="${currentPage > 1}">
                            <a href="CategoriesControl?action=accessory&page=${currentPage - 1}&size=${pageSize}" class="next-button">Previous</a>
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
                                    <a href="CategoriesControl?action=accessory&page=${page}&size=${pageSize}" class="page-number inactive-page">${page}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages - 2}">
                            <span class="ellipsis">...</span>
                        </c:if>

                        <c:if test="${currentPage < totalPages}">
                            <a href="CategoriesControl?action=accessory&page=${currentPage + 1}&size=${pageSize}" class="next-button">Next</a>
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