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
public class EmployeePetAssignment {
    private int assignmentID;
    private int employeeID;
    private int customerPetID;
    private Date assignmentDate;
    private String status;

    public EmployeePetAssignment(int employeeID, int customerPetID) {
        this.employeeID = employeeID;
        this.customerPetID = customerPetID;
    }

    public EmployeePetAssignment(int assignmentID, int employeeID, int customerPetID, Date assignmentDate, String status) {
        this.assignmentID = assignmentID;
        this.employeeID = employeeID;
        this.customerPetID = customerPetID;
        this.assignmentDate = assignmentDate;
        this.status = status;
    }

    public int getAssignmentID() {
        return assignmentID;
    }

    public void setAssignmentID(int assignmentID) {
        this.assignmentID = assignmentID;
    }

    public int getDoctorID() {
        return employeeID;
    }

    public void setDoctorID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getCustomerPetID() {
        return customerPetID;
    }

    public void setCustomerPetID(int customerPetID) {
        this.customerPetID = customerPetID;
    }

    public Date getAssignmentDate() {
        return assignmentDate;
    }

    public void setAssignmentDate(Date assignmentDate) {
        this.assignmentDate = assignmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "EmployeePetAssignment{" + "assignmentID=" + assignmentID + ", employeeID=" + employeeID + ", customerPetID=" + customerPetID + ", assignmentDate=" + assignmentDate + ", status=" + status + '}';
    }
}
