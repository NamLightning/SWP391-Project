/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class WholeSaleOrders {
    private int wholeSaleOrderID;
    private int customerID;
    private int productID;
    private int quantity;
    private Date orderDate;

    public WholeSaleOrders(int customerID, int productID, int quantity) {
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public WholeSaleOrders(int wholeSaleOrderID, int customerID, int productID, int quantity, Date orderDate) {
        this.wholeSaleOrderID = wholeSaleOrderID;
        this.customerID = customerID;
        this.productID = productID;
        this.quantity = quantity;
        this.orderDate = orderDate;
    }

    public int getWholeSaleOrderID() {
        return wholeSaleOrderID;
    }

    public void setWholeSaleOrderID(int wholeSaleOrderID) {
        this.wholeSaleOrderID = wholeSaleOrderID;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "WholeSaleOrders{" + "wholeSaleOrderID=" + wholeSaleOrderID + ", customerID=" + customerID + ", productID=" + productID + ", quantity=" + quantity + ", orderDate=" + orderDate + '}';
    }
}
