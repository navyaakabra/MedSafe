package medicine;

import medicine.PatientDAO;
import medicine.Patient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings({ "unused", "serial" })
@WebServlet("/dashboard")
public class dashboard extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // In a real application, you'd get the username from the session
        String username = "johndoe";
        Patient patient = PatientDAO.getPatient(username);
        
        request.setAttribute("patient", patient);
        request.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(request, response);
    }
}