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
public class Order {
    private int orderID;
    private int customerID;
    private double totalAmount;
    private Date orderDate;
    private String addInfo;
    private String orderStatus;

    public Order(int customerID, double totalAmount) {
        this.customerID = customerID;
        this.totalAmount = totalAmount;
    }

    public Order(int orderID, int customerID, double totalAmount, Date orderDate, String orderStatus) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
    }

    public Order(int customerID, double totalAmount, Date orderDate, String orderStatus) {
        this.customerID = customerID;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
    }

    public Order(int orderID, int customerID, double totalAmount, Date orderDate, String addInfo, String orderStatus) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.addInfo = addInfo;
        this.orderStatus = orderStatus;
    }

    public Order(int customerID, double totalAmount, Date orderDate, String addInfo, String orderStatus) {
        this.customerID = customerID;
        this.totalAmount = totalAmount;
        this.orderDate = orderDate;
        this.addInfo = addInfo;
        this.orderStatus = orderStatus;
    }

    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getAddInfo() {
        return addInfo;
    }

    public void setAddInfo(String addInfo) {
        this.addInfo = addInfo;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", customerID=" + customerID + ", totalAmount=" + totalAmount + ", orderDate=" + orderDate + ", addInfo=" + addInfo + ", orderStatus=" + orderStatus + '}';
    }

    
   

}