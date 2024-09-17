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
public class RevenueReport {
    private int revenueReportID;
    private int managerID;
    private double totalRevenue;

    public RevenueReport(int managerID, double totalRevenue) {
        this.managerID = managerID;
        this.totalRevenue = totalRevenue;
    }

    public RevenueReport(int revenueReportID, int managerID, double totalRevenue) {
        this.revenueReportID = revenueReportID;
        this.managerID = managerID;
        this.totalRevenue = totalRevenue;
    }

    public int getRevenueReportID() {
        return revenueReportID;
    }

    public void setRevenueReportID(int revenueReportID) {
        this.revenueReportID = revenueReportID;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "RevenueReport{" + "revenueReportID=" + revenueReportID + ", managerID=" + managerID + ", totalRevenue=" + totalRevenue + '}';
    }
    
}
