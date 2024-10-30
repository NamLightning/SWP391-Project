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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="container">
            <div class="left-sidebar" style="background-color: #ffffff; width:290px; height: 1224px;"></div>
            <div class="main-content">
                <!--item-->
                <div data-layername="itemDetail" class="item-detail">
                    <div data-layername="itemPreview" class="item-preview">
                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/f1c837f9249f1b85a2ccfc655313bcdd79f2ad1ed65c270f2189244d2d2dad1c?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Item preview" />
                    </div>
                    <div data-layername="itemDetail" class="item-detail-2">
                        <div data-layername="itemContent" class="item-content">
                            <div data-layername="heading" class="heading">
                                <div data-layername="stars" class="stars">
                                    <div data-layername="star" class="star">
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-2" alt="Star rating" />
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-3" alt="Star rating" />
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-4" alt="Star rating" />
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-5" alt="Star rating" />
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-6" alt="Star rating" />
                                    </div>
                                    <div data-layername="47StarRating" class="star-rating">4.7 Star Rating</div>
                                </div>
                                <div data-layername="petBackPackForDogCatSpaceGray" class="pet-back-pack-for-dog-cat-space-gray">
                                    Pet BackPack For Dog & Cat - Space Gray
                                </div>
                            </div>
                            <div data-layername="funFact" class="fun-fact">
                                <div data-layername="row" class="row">
                                    <div data-layername="skuA264671" class="sku">
                                        <span style="font-family: Public Sans, -apple-system, Roboto, Helvetica, sans-serif; color: rgba(95, 108, 114, 1);">
                                            Sku:
                                        </span>
                                        <span style="font-family: Public Sans, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 600; color: rgba(25, 28, 31, 1);">
                                            A264671
                                        </span>
                                    </div>
                                    <div data-layername="availabilityInStock" class="availability-in-stock">
                                        <span style="font-family: Public Sans, -apple-system, Roboto, Helvetica, sans-serif; color: rgba(95, 108, 114, 1);">
                                            Availability:
                                        </span>
                                        <span style="font-family: Public Sans, -apple-system, Roboto, Helvetica, sans-serif; font-weight: 600; color: rgba(45, 178, 36, 1);">
                                            In Stock
                                        </span>
                                    </div>
                                </div>
                                <div data-layername="row" class="row-2">
                                    <div data-layername="brandKorePack" class="brand-kore-pack">Brand: KorePack</div>
                                    <div data-layername="categoryPetAccessories" class="category-pet-accessories">
                                        Category: Pet Accessories
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-layername="prices" class="prices">
                            <div data-layername="price" class="price">319.000₫</div>
                        </div>
                        <div data-layername="devider" class="devider"></div>
                        <div data-layername="form" class="form">
                            <div data-layername="row" class="row-3">
                                <div data-layername="color" class="color">
                                    <div data-layername="color" class="color-2">Color</div>
                                    <div data-layername="color" class="color-3">
                                        <div data-layername="color" class="color-4">
                                            <div data-layername="02" class="color-02"></div>
                                        </div>
                                    </div>
                                </div>
                                <div data-layername="size" class="size">
                                    <div data-layername="size" class="size-2">Size</div>
                                    <select data-layername="dropdown" class="dropdown">
                                        <option value="s">S</option>
                                        <option value="m">M</option>
                                        <option value="l">L</option>
                                        <option value="xl">XL</option>
                                        <option value="xxl">XXL</option>
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/8e3b5e0d925b162b1fedc1da4770082312089e8a1dd9e17e8885a209d8290377?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-7" alt="Dropdown arrow" />
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div data-layername="buttons" class="buttons">
                            <div data-layername="button" class="button-1">
                                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/ba388e0eabad954235024ee887707edd5d6e5c8af2f51cf95d84f47e8d6d2fd9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-8" alt="Decrease quantity" />
                                <div data-layername="01" class="quantity-01">01</div>
                                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/c4ef0281caf6e16bf01681ba248222d77473d0422e9e910a1484d63287f291cf?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-9" alt="Increase quantity" />
                            </div>
                            <div data-layername="button" class="button-2">
                                <div data-layername="label" class="label">Add to card</div>
                                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/d9af30ce1a36a775b4f5729bdd83ffc8c0a0ad06905d325ab867481971ba7e00?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-10" alt="Add to card icon" />
                            </div>
                            <div data-layername="button" class="button-3">Buy now</div>
                        </div>
                        <div data-layername="content" class="content">
                            <div data-layername="100GuaranteeSafeCHeckout" class="guarantee-safe-checkout-100">
                                100% Guarantee Safe Checkout
                            </div>
                            <div data-layername="shareItem" class="share-item">
                                <div data-layername="shareItem" class="share-item-2">Share item:</div>
                                <div data-layername="socialIcon" class="social-icon">
                                    <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/bb1f241da910ae5b69f1d2a9e6e27c1ab21c163c8c64f82812af96aa675d5d8a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-12" alt="Social media icon" />
                                    <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/6566c625e4f3432f409fde4355028ff9350085d0079c00a500a18a2c37ec0c62?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-13" alt="Social media icon" />
                                    <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/edbc9734bdde143dd7f6bc7723d083b91b6e87f1fa0200ae4bdffc135bb8b945?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-14" alt="Social media icon" />
                                    <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/f108ee3304be9e00319f5d50d7bf1eee621454189c3cd5a1d6a28e93e8c63fc6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-15" alt="Social media icon" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--description-->
                <!--related item-->
                <div class="item-container" style="flex: 1;width: 1296px; height: 700px">
                    <div class="related-item" id="best_seller">
                        <h1>Related Item</h1>
                        <div class="related-item-menu">
                            <div class="related-item-container">
                                <div class="related-item-card">
                                    <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/fur1.jpg" alt="Dog House" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog House</h3>
                                                <p class="product-price">599.000₫</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="related-item-card">
                                    <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/fur1.jpg" alt="Dog House" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog House</h3>
                                                <p class="product-price">599.000₫</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="related-item-card">
                                    <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/fur1.jpg" alt="Dog House" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog House</h3>
                                                <p class="product-price">599.000₫</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>    
                                <div class="related-item-card">
                                    <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/fur1.jpg" alt="Dog House" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog House</h3>
                                                <p class="product-price">599.000₫</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>  
                                <div class="related-item-card">
                                    <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/fur1.jpg" alt="Dog House" class="product-image">
                                        <div class="product-info">
                                            <div class="product-details">
                                                <h3 class="product-name">Dog House</h3>
                                                <p class="product-price">599.000₫</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff;width:290px;height: 1224px;"></div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>

<style>

</style>