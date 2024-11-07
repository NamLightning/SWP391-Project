package Model;

public class GetRequestServices {
    private int serviceID;
    private int managerID;

    public GetRequestServices(int serviceID, int managerID) {
        this.serviceID = serviceID;
        this.managerID = managerID;
    }

    public GetRequestServices() {
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    @Override
    public String toString() {
        return "GetRequestServices{" + "serviceID=" + serviceID + ", managerID=" + managerID + '}';
    }
    
}
