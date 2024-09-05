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
public class OrderPet {
    private int orderPetID;
    private int orderID;
    private int productID;
    private double price;

    public OrderPet(int orderID, int productID, double price) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
    }

    public int getOrderPetID() {
        return orderPetID;
    }

    public void setOrderPetID(int orderPetID) {
        this.orderPetID = orderPetID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderPet{" + "orderPetID=" + orderPetID + ", orderID=" + orderID + ", productID=" + productID + ", price=" + price + '}';
    }
}
