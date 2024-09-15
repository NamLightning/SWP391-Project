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
public class Pets {
    private int petID;
    private int managerID;
    private String petName;
    private String petType;
    private String healthStatus;
    private Date lastCheckedDate;
    private int employeeID;

    public Pets(int managerID, String petName, String petType) {
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
    }

    public Pets(int managerID, String petName, String petType, String healthStatus, Date lastCheckedDate, int employeeID) {
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.employeeID = employeeID;
    }

    public Pets(int petID, int managerID, String petName, String petType, String healthStatus, Date lastCheckedDate, int employeeID) {
        this.petID = petID;
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.employeeID = employeeID;
    }

    public int getPetID() {
        return petID;
    }

    public void setPetID(int petID) {
        this.petID = petID;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public Date getLastCheckedDate() {
        return lastCheckedDate;
    }

    public void setLastCheckedDate(Date lastCheckedDate) {
        this.lastCheckedDate = lastCheckedDate;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    @Override
    public String toString() {
        return "Pets{" + "petID=" + petID + ", managerID=" + managerID + ", petName=" + petName + ", petType=" + petType + ", healthStatus=" + healthStatus + ", lastCheckedDate=" + lastCheckedDate + ", employeeID=" + employeeID + '}';
    }
    
}
