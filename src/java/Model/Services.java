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
public class Services {
    private int serviceID;
    private int customerID;
    private String serviceName;
    private Date serviceDate;
    private String status;

    public Services(int customerID, String serviceName, Date serviceDate) {
        this.customerID = customerID;
        this.serviceName = serviceName;
        this.serviceDate = serviceDate;
    }

    public Services(int serviceID, int customerID, String serviceName, Date serviceDate, String status) {
        this.serviceID = serviceID;
        this.customerID = customerID;
        this.serviceName = serviceName;
        this.serviceDate = serviceDate;
        this.status = status;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Services{" + "serviceID=" + serviceID + ", customerID=" + customerID + ", serviceName=" + serviceName + ", serviceDate=" + serviceDate + ", status=" + status + '}';
    }
}
