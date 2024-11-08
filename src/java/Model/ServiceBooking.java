package Model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ServiceBooking {
    
    private int serviceBookedID;
    private int serviceID;
    private int customerID;
    private LocalDateTime serviceDate;
    private String status;

    public ServiceBooking(int serviceID, int customerID, LocalDateTime serviceDate, String status) {
        this.serviceID = serviceID;
        this.customerID = customerID;
        this.serviceDate = serviceDate;
        this.status = status;
    }

    public ServiceBooking(int serviceID, int customerID, LocalDateTime serviceDate) {
        this.serviceID = serviceID;
        this.customerID = customerID;
        this.serviceDate = serviceDate;
    }

    public ServiceBooking(int serviceBookedID, int serviceID, int customerID, LocalDateTime serviceDate, String status) {
        this.serviceBookedID = serviceBookedID;
        this.serviceID = serviceID;
        this.customerID = customerID;
        this.serviceDate = serviceDate;
        this.status = status;
    }
    
    public ServiceBooking(int serviceID, int customerID) {
        this.serviceID = serviceID;
        this.customerID = customerID;
    }

    public ServiceBooking() {
    }

    public int getServiceBookedID() {
        return serviceBookedID;
    }

    public void setServiceBookedID(int serviceBookedID) {
        this.serviceBookedID = serviceBookedID;
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

    public LocalDateTime ServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(LocalDateTime serviceDate) {
        this.serviceDate = serviceDate;
    }

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    public String getServiceDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        return sdf.format(this.serviceDate);
    }

    public void setServiceDate(String serviceDate) {
        this.serviceDate = LocalDateTime.parse(serviceDate, DATE_TIME_FORMATTER);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ServiceBooking{" + "serviceBookedID=" + serviceBookedID + ", serviceID=" + serviceID + ", customerID=" + customerID + ", serviceDate=" + serviceDate + ", status=" + status + '}';
    }

}
