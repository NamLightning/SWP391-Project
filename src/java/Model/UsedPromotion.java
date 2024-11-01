/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class UsedPromotion {
    private int promotionID;
    private int customerID;

    public UsedPromotion(int promotionID, int customerID) {
        this.promotionID = promotionID;
        this.customerID = customerID;
    }

    public UsedPromotion() {
    }

    public int getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(int promotionID) {
        this.promotionID = promotionID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "UsedPromotion{" + "promotionID=" + promotionID + ", customerID=" + customerID + '}';
    }
    
    
}
