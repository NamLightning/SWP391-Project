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
public class RequestSupport {
    private int requestID;
    private int customerID;
    private String subject;
    private String message;
    private Date requestDate;
    private String status;
    private int assignTo;

    public RequestSupport(String subject, String message) {
        this.subject = subject;
        this.message = message;
    }

    public RequestSupport(String subject, String message, int assignTo) {
        this.subject = subject;
        this.message = message;
        this.assignTo = assignTo;
    }

    public RequestSupport(int customerID, String subject, String message, int assignTo) {
        this.customerID = customerID;
        this.subject = subject;
        this.message = message;
        this.assignTo = assignTo;
    }

    public RequestSupport(int requestID, int customerID, String subject, String message, Date requestDate, String status, int assignTo) {
        this.requestID = requestID;
        this.customerID = customerID;
        this.subject = subject;
        this.message = message;
        this.requestDate = requestDate;
        this.status = status;
        this.assignTo = assignTo;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAssignTo() {
        return assignTo;
    }

    public void setAssignTo(int assignTo) {
        this.assignTo = assignTo;
    }

    @Override
    public String toString() {
        return "RequestSupport{" + "requestID=" + requestID + ", customerID=" + customerID + ", subject=" + subject + ", message=" + message + ", requestDate=" + requestDate + ", status=" + status + ", assignTo=" + assignTo + '}';
    }
}
