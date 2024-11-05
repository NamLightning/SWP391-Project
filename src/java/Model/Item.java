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
public class Item {
    private int productID;
    private String productName;
    private String description;
    private double price;
    private int stockQuantity;
    private int categoryID;
    private String avatar_name;
    private byte[] avatar_img;

    public Item(String avatar_name, byte[] avatar_img) {
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public Item(String productName, double price, int stockQuantity, int categoryID) {
        this.productName = productName;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
    }

    public Item(String productName, String description, double price, int stockQuantity, int categoryID) {
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
    }

    public Item(String productName, double price, int stockQuantity, int categoryID, String avatar_name, byte[] avatar_img) {
        this.productName = productName;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public Item(String productName, String description, double price, int stockQuantity, int categoryID, String avatar_name, byte[] avatar_img) {
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public Item(int productID, String productName, String description, double price, int stockQuantity, int categoryID, String avatar_name, byte[] avatar_img) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.categoryID = categoryID;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public String getAvatar_name() {
        return avatar_name;
    }

    public void setAvatar_name(String avatar_name) {
        this.avatar_name = avatar_name;
    }

    public byte[] getAvatar_img() {
        return avatar_img;
    }

    public void setAvatar_img(byte[] avatar_img) {
        this.avatar_img = avatar_img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
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
        return "Products{" + "productID=" + productID + ", productName=" + productName + ", description=" + description + ", price=" + price + ", stockQuantity=" + stockQuantity + ", categoryID=" + categoryID + ", avatar_name=" + avatar_name + ", avatar_img=" + avatar_img + '}';
    }
}
