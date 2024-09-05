package com.example.servlet;

import medicine.PatientDAO;
import medicine.Patient;
import medicine.Medication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/medi")
public class medi extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = "johndoe"; // In a real app, get from session
        Patient patient = PatientDAO.getPatient(username);
        
        String medicationName = request.getParameter("medicationName");
        
        for (Medication med : patient.getMedications()) {
            if (med.getName().equals(medicationName)) {
                med.setTaken(true);
                break;
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}