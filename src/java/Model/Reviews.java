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
public class Reviews {
    private int reviewID;
    private int customerID;
    private int serviceID;
    private int ratingID;
    private String comments;

    public Reviews(int customerID, int serviceID, int ratingID) {
        this.customerID = customerID;
        this.serviceID = serviceID;
        this.ratingID = ratingID;
    }

    public Reviews(int customerID, int serviceID, int ratingID, String comments) {
        this.customerID = customerID;
        this.serviceID = serviceID;
        this.ratingID = ratingID;
        this.comments = comments;
    }

    public Reviews(int reviewID, int customerID, int serviceID, int ratingID, String comments) {
        this.reviewID = reviewID;
        this.customerID = customerID;
        this.serviceID = serviceID;
        this.ratingID = ratingID;
        this.comments = comments;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getRatingID() {
        return ratingID;
    }

    public void setRatingID(int ratingID) {
        this.ratingID = ratingID;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Reviews{" + "reviewID=" + reviewID + ", customerID=" + customerID + ", serviceID=" + serviceID + ", ratingID=" + ratingID + ", comments=" + comments + '}';
    }
}
