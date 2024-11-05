<section class="shopping-cart">
  <header class="cart-popup-header">
    Shopping Cart <span class="cart-count">(02)</span>
  </header>
  
  <div class="product-popup-list">
    <article class="product-popup-item">
        <img src="${pageContext.request.contextPath}/images/food7.jpg" alt="Sajo Pet Food - 20kg" class="product-popup-image" />
      <div class="product-popup-details">
        <h3 class="product-popup-name">Sajo Pet Food - 20kg</h3>
        <div class="product-popup-price">
            <span class="quantity-popup">2</span><span>x</span>
          <span class="price-popup">$1,500</span>
        </div>
      </div>
      <button class="remove-item" aria-label="Remove Canon EOS 1500D from cart">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/c91e37402f51849aa5fb805e073a5241b50541d17ba1bfd5a828b560ec357a1f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="remove-icon" />
      </button>
    </article>
    
    <article class="product-popup-item">
      <img src="${pageContext.request.contextPath}/images/accessory2.jpg" alt="Dog Leash - Size M - Vani" class="product-popup-image" />
      <div class="product-popup-details">
        <h3 class="product-popup-name">Dog Leash - Size M - Vani </h3>
        <div class="product-popup-price">
          <span class="quantity-popup">1</span><span>x</span>
          <span class="price-popup">$269</span>
        </div>
      </div>
      <button class="remove-item">
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/c91e37402f51849aa5fb805e073a5241b50541d17ba1bfd5a828b560ec357a1f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="remove-icon" />
      </button>
    </article>
  </div>
  
  <div class="divider-popup" role="separator"></div>
  
  <div class="subtotal-popup">
    <span class="subtotal-popup-label">Sub-Total:</span>
    <span class="subtotal-popup-amount">$2038.00 USD</span>
  </div>
  
  <div class="cart-actions-popup">
    <button class="btn btn-primary">
      Checkout now
      <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0bfd7ef916026eff87b43b560d5575f85e58e7b5c3fa9b0f3710711f43901ee6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" aria-hidden="true" />
    </button>
    <button class="btn btn-secondary" onclick="window.location.href='../cart.jsp'">View Cart</button>
  </div>
</section>