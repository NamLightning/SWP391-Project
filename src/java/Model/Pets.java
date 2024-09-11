/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private String avatar_name;
    private byte[] avatar_img;

    public Pets(int managerID, String petName, String petType, String avatar_name, byte[] avatar_img) {
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public Pets(int managerID, String petName, String petType, String healthStatus, Date lastCheckedDate, int employeeID) {
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.employeeID = employeeID;
    }
    
    public Pets(int petID, String petName, String petType, String healthStatus, Date lastCheckedDate, String avatar_name, byte[] avatar_img) {
        this.petID = petID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public Pets(int petID, int managerID, String petName, String petType, String healthStatus, Date lastCheckedDate, int employeeID, String avatar_name, byte[] avatar_img) {
        this.petID = petID;
        this.managerID = managerID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.employeeID = employeeID;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }
    
    public Pets(int petID, String petName, String petType, String healthStatus, Date lastCheckedDate, int employeeID, String avatar_name, byte[] avatar_img) {
        this.petID = petID;
        this.petName = petName;
        this.petType = petType;
        this.healthStatus = healthStatus;
        this.lastCheckedDate = lastCheckedDate;
        this.employeeID = employeeID;
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

    public Date lastCheckedDate() {
        return lastCheckedDate;
    }

    public void setLastCheckedDate(Date lastCheckedDate) {
        this.lastCheckedDate = lastCheckedDate;
    }
    
    public String getLastCheckedDate() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        return sd.format(lastCheckedDate);
    }

    public void setLastCheckedDate(String lastCheckedDate) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Date.valueOf(sd.format(lastCheckedDate));
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
