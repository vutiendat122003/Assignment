/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.exam;

import controller.auth.BaseRequiredAdminAuthenticationController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;
import model.User;

/**
 *
 * @author Vanxuan
 */
public class ViewAdmin extends BaseRequiredAdminAuthenticationController {  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Admin admin) throws ServletException, IOException {
        request.getRequestDispatcher("../view/admin/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Admin admin) throws ServletException, IOException {
        
    }

}
