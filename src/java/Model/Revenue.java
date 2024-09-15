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
public class Revenue {
    private int revenueID;
    private int saleID;
    private double totalRevenue;
    private Date revenueDate;

    public Revenue(int saleID, double totalRevenue) {
        this.saleID = saleID;
        this.totalRevenue = totalRevenue;
    }

    public Revenue(int revenueID, int saleID, double totalRevenue, Date revenueDate) {
        this.revenueID = revenueID;
        this.saleID = saleID;
        this.totalRevenue = totalRevenue;
        this.revenueDate = revenueDate;
    }

    public int getRevenueID() {
        return revenueID;
    }

    public void setRevenueID(int revenueID) {
        this.revenueID = revenueID;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public Date getRevenueDate() {
        return revenueDate;
    }

    public void setRevenueDate(Date revenueDate) {
        this.revenueDate = revenueDate;
    }

    @Override
    public String toString() {
        return "Revenue{" + "revenueID=" + revenueID + ", saleID=" + saleID + ", totalRevenue=" + totalRevenue + ", revenueDate=" + revenueDate + '}';
    }
    
}
