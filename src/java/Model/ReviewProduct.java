package Model;

public class ReviewProduct {
    private int reviewProductID;
    private int customerID;
    private int productID;
    private double totalAmount;
    private int rating;
    private String comment;

    public ReviewProduct(int reviewProductID, int customerID, int productID, double totalAmount, int rating, String comment) {
        this.reviewProductID = reviewProductID;
        this.customerID = customerID;
        this.productID = productID;
        this.totalAmount = totalAmount;
        this.rating = rating;
        this.comment = comment;
    }

    public ReviewProduct() {
    }

    public int getReviewProductID() {
        return reviewProductID;
    }

    public void setReviewProductID(int reviewProductID) {
        this.reviewProductID = reviewProductID;
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

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "ReviewProduct{" + "reviewProductID=" + reviewProductID + ", customerID=" + customerID + ", productID=" + productID + ", totalAmount=" + totalAmount + ", rating=" + rating + ", comment=" + comment + '}';
    }
    
    
}