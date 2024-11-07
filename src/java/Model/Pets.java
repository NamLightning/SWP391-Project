
package Model;

public class Pets {

    private int petID;
    private String petName;
    private String petType;
    private int customerID;

    public Pets(int petID, String petName, String petType, int customerID) {
        this.petID = petID;
        this.petName = petName;
        this.petType = petType;
        this.customerID = customerID;
    }

    public Pets() {
    }

    public Pets(String petName, String petType, int customerID) {
        this.petName = petName;
        this.petType = petType;
        this.customerID = customerID;
    }

    public int getPetID() {
        return petID;
    }

    public void setPetID(int petID) {
        this.petID = petID;
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

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "Pets{" + "petID=" + petID + ", petName=" + petName + ", petType=" + petType + ", customerID=" + customerID + '}';
    }
    
}