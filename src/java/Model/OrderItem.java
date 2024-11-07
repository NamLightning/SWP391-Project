
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
public class OrderItem {
    private int orderItemID;
    private int orderID;
    private int productID;
    private int quantity;
    private String addInfo;
    private double price;

    public OrderItem(int orderID, int productID, int quantity, double price) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderItem(int orderItemID, int orderID, int productID, int quantity, double price) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderItem(int orderItemID, int orderID, int productID, int quantity, String addInfo, double price) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.addInfo = addInfo;
        this.price = price;
    }

    public OrderItem(int orderID, int productID, int quantity, String addInfo, double price) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.addInfo = addInfo;
        this.price = price;
    }

    
    public int getOrderItemID() {
        return orderItemID;
    }

    public void setOrderItemID(int orderItemID) {
        this.orderItemID = orderItemID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "orderItemID=" + orderItemID + ", orderID=" + orderID + ", productID=" + productID + ", quantity=" + quantity + ", addInfo=" + addInfo + ", price=" + price + '}';
    }


}
