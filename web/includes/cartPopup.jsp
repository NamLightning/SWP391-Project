<style>
.shopping-cart {
  padding: 0 0 24px;
  border-radius: 4px;
  border: 1px solid #e4e7e9;
  background: #fff;
  box-shadow: 0 8px 40px rgba(0, 0, 0, 0.12);
  max-width: 376px;
  width: 100%;
  font: 14px Public Sans, sans-serif;
}

.cart-popup-header {
  width: auto;
  background: #fff;
  box-shadow: 0 -1px 0 0 #e4e7e9 inset;
  font-size: 16px;
  color: #5f6c72;
  font-weight: 500;
  line-height: 24px;
  padding: 16px 24px;
}

.cart-count {
  font-weight: 400;
  color: #5f6c72;
}

.product-popup-list {
  display: flex;
  margin-top: 20px;
  flex-direction: column;
}

.product-popup-item {
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 3px;
  background: #fff;
  gap: 16px;
  margin-top: 16px;
}

.product-popup-image {
  aspect-ratio: 1;
  object-fit: contain;
  width: 80px;
}

.product-popup-details {
  display: flex;
  flex-direction: column;
  width: 200px;
}

.product-popup-name {
  color: #191c1f;
  font-weight: 400;
  line-height: 20px;
}

.product-popup-price {
  display: flex;
  margin-top: 8px;
  align-items: start;
  gap: 4px;
  line-height: 1;
}

.quantity-popup {
  color: #5f6c72;
  font-weight: 400;
}

.price-popup {
  color: #2da5f3;
  font-weight: 600;
}

.remove-icon {
  width: 16px;
}

.divider-popup {
  background-color: #e4e7e9;
  height: 1px;
  margin-top: 20px;
  width: 100%;
}

.subtotal-popup {
  display: flex;
  margin-top: 20px;
  justify-content: space-between;
  padding: 0 24px;
}

.subtotal-label-popup {
  color: #475156;
  font-weight: 400;
}

.subtotal-amount-popup {
  color: #191c1f;
  font-weight: 500;
}

.cart-actions-popup {
  display: flex;
  margin-top: 20px;
  padding: 0 24px;
  flex-direction: column;
  gap: 12px;
}

.btn {
  border-radius: 2px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.17px;
  line-height: 48px;
  text-align: center;
  cursor: pointer;
}

.btn-primary {
  background-color: #fd7e14;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  border-style: hidden;
}

.btn-secondary {
  color: #fd7e14;
  background-color: #ffffff;
  border: 2px solid #fa8232;
}

</style>

<section class="shopping-cart">
  <header class="cart-popup-header">
    Shopping Cart <span class="cart-count">(02)</span>
  </header>
  
  <div class="product-popup-list">
    <article class="product-popup-item">
      <img src="../images/food7.jpg" alt="Sajo Pet Food - 20kg" class="product-popup-image" />
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
      <img src="../images/accessory2.jpg" alt="Dog Leash - Size M - Vani" class="product-popup-image" />
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