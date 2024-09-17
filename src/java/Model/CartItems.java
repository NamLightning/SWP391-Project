/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Administrator
 */
public class CartItems {
    private int cartItemID;
    private int customerID;
    private int productID;
    private int quantity;

    public CartItems(int customerID, int productID, int quantity) {
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public CartItems(int cartItemID, int customerID, int productID, int quantity) {
        this.cartItemID = cartItemID;
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartItems{" + "cartItemID=" + cartItemID + ", customerID=" + customerID + ", productID=" + productID + ", quantity=" + quantity + '}';
    }
    
}
