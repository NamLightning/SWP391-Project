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
public class CustomerPet {
    private int customerPetID;
    private int customerID;
    private int assignTo;
    private String healthStatus;
    private String avatar_name;
    private byte[] avatar_img;

    public CustomerPet(int customerID, int assignTo) {
        this.customerID = customerID;
        this.assignTo = assignTo;
    }

    public CustomerPet(int customerID, int assignTo, String healthStatus) {
        this.customerID = customerID;
        this.assignTo = assignTo;
        this.healthStatus = healthStatus;
    }

    public CustomerPet(int customerID, int assignTo, String avatar_name, byte[] avatar_img) {
        this.customerID = customerID;
        this.assignTo = assignTo;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public CustomerPet(int customerID, int assignTo, String healthStatus, String avatar_name, byte[] avatar_img) {
        this.customerID = customerID;
        this.assignTo = assignTo;
        this.healthStatus = healthStatus;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public CustomerPet(int customerPetID, int customerID, int assignTo, String healthStatus, String avatar_name, byte[] avatar_img) {
        this.customerPetID = customerPetID;
        this.customerID = customerID;
        this.assignTo = assignTo;
        this.healthStatus = healthStatus;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public String getAvatar_name() {
        return avatar_name;
    }

    public void setAvatar_name(String avatar_name) {
        this.avatar_name = avatar_name;
    }

    public byte[] getAvatar_img() {
        return avatar_img;
    }

    public void setAvatar_img(byte[] avatar_img) {
        this.avatar_img = avatar_img;
    }

    public int getCustomerPetID() {
        return customerPetID;
    }

    public void setCustomerPetID(int customerPetID) {
        this.customerPetID = customerPetID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getAssignTo() {
        return assignTo;
    }

    public void setAssignTo(int assignTo) {
        this.assignTo = assignTo;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    @Override
    public String toString() {
        return "CustomerPet{" + "customerPetID=" + customerPetID + ", customerID=" + customerID + ", assignTo=" + assignTo + ", healthStatus=" + healthStatus + '}';
    }
    
}
