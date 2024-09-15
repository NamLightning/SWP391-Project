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
public class Promotions {
    private int promotionID;
    private String promotionName;
    private double discountPercent;
    private Date startDate;
    private Date endDate;
    private int productID;
    private int managerID;

    public Promotions(String promotionName, double discountPercent, Date startDate, Date endDate) {
        this.promotionName = promotionName;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Promotions(String promotionName, double discountPercent, Date startDate, Date endDate, int productID, int managerID) {
        this.promotionName = promotionName;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.productID = productID;
        this.managerID = managerID;
    }

    public Promotions(int promotionID, String promotionName, double discountPercent, Date startDate, Date endDate, int productID, int managerID) {
        this.promotionID = promotionID;
        this.promotionName = promotionName;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.productID = productID;
        this.managerID = managerID;
    }

    public int getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(int promotionID) {
        this.promotionID = promotionID;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    @Override
    public String toString() {
        return "Promotions{" + "promotionID=" + promotionID + ", promotionName=" + promotionName + ", discountPercent=" + discountPercent + ", startDate=" + startDate + ", endDate=" + endDate + ", productID=" + productID + ", managerID=" + managerID + '}';
    }
}
