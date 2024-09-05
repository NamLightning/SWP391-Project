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
public class Sales {
    private int saleID;
    private int productID;
    private int quantitySold;
    private Date saleDate;
    private double totalRevenue;

    public Sales(int productID, int quantitySold, double totalRevenue) {
        this.productID = productID;
        this.quantitySold = quantitySold;
        this.totalRevenue = totalRevenue;
    }

    public Sales(int productID, int quantitySold, Date saleDate, double totalRevenue) {
        this.productID = productID;
        this.quantitySold = quantitySold;
        this.saleDate = saleDate;
        this.totalRevenue = totalRevenue;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "Sales{" + "saleID=" + saleID + ", productID=" + productID + ", quantitySold=" + quantitySold + ", saleDate=" + saleDate + ", totalRevenue=" + totalRevenue + '}';
    }
}
