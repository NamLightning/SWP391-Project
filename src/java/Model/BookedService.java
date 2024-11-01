package Model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BookedService {

    private int serviceId;
    private int cusId;
    private LocalDateTime serviceDate;
    private String status;

    public BookedService(int serviceId, int cusId, LocalDateTime serviceDate, String status) {
        this.serviceId = serviceId;
        this.cusId = cusId;
        this.serviceDate = serviceDate;
        this.status = status;
    }

    public BookedService() {
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
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
        return "BookedService{" + "serviceId=" + serviceId + ", cusId=" + cusId + ", serviceDate=" + serviceDate + ", status=" + status + '}';
    }

}
