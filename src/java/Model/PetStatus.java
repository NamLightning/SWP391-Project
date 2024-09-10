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
    private int employeeID;
    private int customerPetID;
    private String healthStatus;

    public PetStatus(int customerPetID, String healthStatus) {
        this.customerPetID = customerPetID;
        this.healthStatus = healthStatus;
    }

    public PetStatus(int employeeID, int customerPetID, String healthStatus) {
        this.employeeID = employeeID;
        this.customerPetID = customerPetID;
        this.healthStatus = healthStatus;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
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
        return "PetStatus{" + "employeeID=" + employeeID + ", customerPetID=" + customerPetID + ", healthStatus=" + healthStatus + '}';
    }
}
