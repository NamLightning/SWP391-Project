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
public class CustomerSupport {
    private int requestID;
    private String subject;
    private String message;
    private Date requestDate;
    private String status;
    private int assignTo;
    
    private int supportID;
    private int employeeID;
    private int contactID;
    private String response;

    public CustomerSupport(String subject, String message, int assignTo) {
        this.subject = subject;
        this.message = message;
        this.assignTo = assignTo;
    }

    public CustomerSupport(int employeeID, int contactID, String response) {
        this.employeeID = employeeID;
        this.contactID = contactID;
        this.response = response;
    }

    public CustomerSupport(String subject, String message, Date requestDate, String status, int assignTo) {
        this.subject = subject;
        this.message = message;
        this.requestDate = requestDate;
        this.status = status;
        this.assignTo = assignTo;
    }

    public int getSupportID() {
        return supportID;
    }

    public void setSupportID(int supportID) {
        this.supportID = supportID;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getContactID() {
        return contactID;
    }

    public void setContactID(int contactID) {
        this.contactID = contactID;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
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
        return "CustomerSupport{" + "requestID=" + requestID + ", subject=" + subject + ", message=" + message + ", requestDate=" + requestDate + ", status=" + status + ", assignTo=" + assignTo + ", supportID=" + supportID + ", employeeID=" + employeeID + ", contactID=" + contactID + ", response=" + response + '}';
    }
}
