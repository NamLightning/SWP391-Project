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
public class Inventory {
    private int inventoryID;
    private int productID;
    private int quantity;

    public Inventory(int inventoryID, int productID, int quantity) {
        this.inventoryID = inventoryID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public Inventory() {
    }

    public Inventory(int productID, int quantity) {
        this.productID = productID;
        this.quantity = quantity;
    }


    public int getInventoryID() {
        return inventoryID;
    }

    public void setInventoryID(int inventoryID) {
        this.inventoryID = inventoryID;
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
        return "Inventory{" + "inventoryID=" + inventoryID + ", productID=" + productID + ", quantity=" + quantity + '}';
    }


}
