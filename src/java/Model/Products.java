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
public class Products {
    private int productID;
    private String productName;
    private String description;
    private int price;
    private int stockQuantity;
    private int categoryID;

    public Products(String productName, int price, int stockQuantity, int categoryID) {
        this.productName = productName;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
    }

    public Products(String productName, String description, int price, int stockQuantity, int categoryID) {
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
    }

    public Products(int productID, String productName, String description, int price, int stockQuantity, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", productName=" + productName + ", description=" + description + ", stockQuantity=" + stockQuantity + ", categoryID=" + categoryID + '}';
    }
}
