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
    private String serviceName;
    private double price;
    private String serviceDesc;
    private String avatar_name;
    private byte[] avatar_img;

    public Services() {
    }

    public Services(int serviceID, String serviceName, double price, String serviceDesc, String avatar_name, byte[] avatar_img) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.price = price;
        this.serviceDesc = serviceDesc;
        this.avatar_name = avatar_name;
        this.avatar_img = avatar_img;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
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

    @Override
    public String toString() {
        return "Services{" + "serviceID=" + serviceID + ", serviceName=" + serviceName + ", price=" + price + ", serviceDesc=" + serviceDesc + ", avatar_name=" + avatar_name + ", avatar_img=" + avatar_img + '}';
    }
    
    

}
