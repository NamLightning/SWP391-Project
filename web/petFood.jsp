<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/items.css">
    </head>
    <body>
    <center>
        <div class="left-sidebar"></div>
        <%@include file="includes/header.jsp" %>
        <div class="right-sidebar"></div>
        <section class="filters-cards">
            <aside class="filters">
                <div class="filter-category">
                    <h2 class="filter-title">Filter by categories</h2>
                    <ul class="category-list">
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="petFurniture.jsp">
                                Furniture
                            </label>
                            <span class="category-count" data-count="furniture"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="petAccessories.jsp">
                                Accessories
                            </label>
                            <span class="category-count" data-count="accessories"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="petClothing.jsp">
                                Clothes
                            </label>
                            <span class="category-count" data-count="clothes"></span>
                        </li>
                        <li class="category-item">
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox" data-url="petFood.jsp" checked>
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
                    <input type="range" id="priceRange" class="price-range-slider" min="50000" max="1000000" step="10000" value="525000" aria-label="Price range slider">
                    <div class="price-range-controls">
                        <p style="margin:0;">Price: </p>
                        <p id="priceDisplay" class="price-range-text">525.000₫</p>
                        <button class="apply-button" aria-label="Apply price filter">Apply</button>
                    </div>
                </section>
            </aside>
            <main class="product-section">
                <header class="product-header">
                    <p class="results-count">Showing 12 of 12 results</p>
                    <div class="sort-dropdown">
                        <span class="sort-text">Sort by latest</span>
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1882270c236b22b80043636c84381434c2ab08777c5cbbf7effae57b09c2e254?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Dropdown icon" class="dropdown-icon">
                    </div>
                </header>
                <div class="product-grid">
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/d619b14574a9c931df4b715f58d9012fc5d94b3107d0eec2323d10bbabbd8657?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Premium Dog Food" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Premium Dog Food</h3>
                                <p class="product-price">479.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/69b8e5b0af167cc3f1d689592dbf2d31494d4b0182b391b057907e8c8658276a?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Premium Cat Food" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Premium Cat Food</h3>
                                <p class="product-price">439.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/ea319e275d827b55f396c0d7bf7e33c60fccccd43649d32ae9bf9755e65a13b6?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Dog Food - Size M" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Dog Food - Size M</h3>
                                <p class="product-price">299.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/dd8b8567c6bcddc608b852c98edd966545950fab547cc981cfdeb1d14142ac71?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Pedigree" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Pedigree</h3>
                                <p class="product-price">699.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/d73c5cea9b9e730c285c60d22f6ccca4cd602c5f162dc065b2e0a33d47af8296?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Brit Care" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Brit Care</h3>
                                <p class="product-price">365.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a5ee623681f54d502b3adff05d151d617da6f4d8806473c2dec67438c5622f96?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Sajo Pet Food" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Sajo Pet Food</h3>
                                <p class="product-price">345.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/4a677381e5270117ad340c66e647271f8603fc836065d1b4d03f27aa81088af4?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Royal Canin" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Royal Canin</h3>
                                <p class="product-price">370.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e88cf5c0c632038a2ec84c3402411a6870087a2d20a2bc7d50a6508a9bef91f9?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Nature's Gift" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Nature's Gift</h3>
                                <p class="product-price">355.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/4d72893c70f3afc6f2f5bd2e06d0ad727ef91f3ce28a6102f44d4bc65a7b4b9d?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Whiskas" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Whiskas</h3>
                                <p class="product-price">1.299.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="images/food10.jpg" alt="Bil Jac" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Bil Jac</h3>
                                <p class="product-price">298.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="images/food11.jpg" alt="Golden Gatos" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Golden Gatos</h3>
                                <p class="product-price">339.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                    <article class="product-card">
                        <img src="images/food12.jpg" alt="Nulo" class="product-image">
                        <div class="product-info">
                            <div class="product-details">
                                <h3 class="product-name">Nulo</h3>
                                <p class="product-price">375.000₫</p>
                            </div>
                            <button class="favorite-button" aria-label="Add to favorites">
                                <span class="heart-icon"></span>
                            </button>
                        </div>
                    </article>
                </div>
                <nav class="pagination" aria-label="Product page navigation">
                    <div class="page-numbers">
                        <a href="#" class="page-number active-page" aria-current="page">1</a>
                        <a href="#" class="page-number inactive-page">2</a>
                    </div>
                    <a href="#" class="next-button">
                        <span>Next</span>
                    </a>
                </nav>
            </main>
        </section>
        <%@include file="includes/footer.jsp"%>
    </center>
    <script src="js/price-sort.js"></script>
</body>
</html>
