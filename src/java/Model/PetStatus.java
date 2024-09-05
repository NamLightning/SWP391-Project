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
public class PetStatus {
    private int doctorID;
    private int customerPetID;
    private String healthStatus;

    public PetStatus(int doctorID, int customerPetID) {
        this.doctorID = doctorID;
        this.customerPetID = customerPetID;
    }

    public PetStatus(int doctorID, int customerPetID, String healthStatus) {
        this.doctorID = doctorID;
        this.customerPetID = customerPetID;
        this.healthStatus = healthStatus;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public int getCustomerPetID() {
        return customerPetID;
    }

    public void setCustomerPetID(int customerPetID) {
        this.customerPetID = customerPetID;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    @Override
    public String toString() {
        return "PetStatus{" + "doctorID=" + doctorID + ", customerPetID=" + customerPetID + ", healthStatus=" + healthStatus + '}';
    }
}
