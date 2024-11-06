/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Administrator
 */
public class Promotions {

    private int promotionID;
    private String promotionName;
    private int discountPercent;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String Descriptions;

    public Promotions(int promotionID, String promotionName, int discountPercent, LocalDateTime startDate, LocalDateTime endDate, String Descriptions) {
        this.promotionID = promotionID;
        this.promotionName = promotionName;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.Descriptions = Descriptions;
    }

    public Promotions(String promotionName, int discountPercent, LocalDateTime startDate, LocalDateTime endDate, String Descriptions) {
        this.promotionName = promotionName;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.Descriptions = Descriptions;
    }

    public Promotions() {
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

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public LocalDateTime StartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime EndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public String getDescriptions() {
        return Descriptions;
    }

    public void setDescriptions(String Descriptions) {
        this.Descriptions = Descriptions;
    }

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public String getStartDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        return sdf.format(this.startDate);
    }

    public void setStartDate(String startDate) {
        this.startDate = LocalDateTime.parse(startDate, DATE_TIME_FORMATTER);
    }

    public String getEndDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        return sdf.format(this.endDate);
    }

    public void setEndDate(String endDate) {
        this.endDate = LocalDateTime.parse(endDate, DATE_TIME_FORMATTER);
    }

    @Override
    public String toString() {
        return "Promotions{" + "promotionID=" + promotionID + ", promotionName=" + promotionName + ", discountPercent=" + discountPercent + ", startDate=" + startDate + ", endDate=" + endDate + ", Descriptions=" + Descriptions + '}';
    }

}