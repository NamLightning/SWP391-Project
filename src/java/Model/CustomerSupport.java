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
public class CustomerSupport {
    private int supportID;
    private int employeeID;
    private int requestID;
    private String response;

    public CustomerSupport(int requestID, String response) {
        this.requestID = requestID;
        this.response = response;
    }

    public CustomerSupport(int employeeID, int requestID, String response) {
        this.employeeID = employeeID;
        this.requestID = requestID;
        this.response = response;
    }

    public CustomerSupport(int supportID, int employeeID, int requestID, String response) {
        this.supportID = supportID;
        this.employeeID = employeeID;
        this.requestID = requestID;
        this.response = response;
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

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "CustomerSupport{" + "supportID=" + supportID + ", employeeID=" + employeeID + ", requestID=" + requestID + ", response=" + response + '}';
    }
}
