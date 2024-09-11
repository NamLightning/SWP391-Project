package Controller;

import Dao.PetsDAO;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageServlet extends javax.servlet.http.HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int petID = Integer.parseInt(request.getParameter("petID")); // Lấy petID từ tham số request

        try {
            InputStream imageStream = PetsDAO.getImage(petID); // Gọi phương thức getImage

            if (imageStream != null) {
                response.setContentType("image/jpeg"); // Đặt loại nội dung hình ảnh (hoặc loại khác tùy vào loại hình ảnh)
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = imageStream.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
                imageStream.close();
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // Nếu không tìm thấy hình ảnh
            }
        } catch (Exception e) {
            Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Xử lý lỗi
        }
    }
}