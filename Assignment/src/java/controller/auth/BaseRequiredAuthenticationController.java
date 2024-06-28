/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feature;
import model.Role;
import model.User;

/**
 *
 * @author sonng
 */
public abstract class BaseRequiredAuthenticationController extends HttpServlet {
   
    private boolean isAuthenticated(HttpServletRequest request)
    {
       User user = (User)request.getSession().getAttribute("user");
       if(user ==null)
           return false;
       String current_url = request.getServletPath();
        for (Role role : user.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if(feature.getUrl().equals(current_url))
                    return true;
            }
        }
       
       return false;
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("user");
        if(isAuthenticated(request))
        {
            doGet(request, response, user);
        }
        else
        {
            response.getWriter().println("access denied!");
        }
        
    } 
    
    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user)
    throws ServletException, IOException;
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user)
    throws ServletException, IOException;

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("user");
        if(isAuthenticated(request))
        {
            doPost(request, response, user);
        }
        else
        {
            response.getWriter().println("access denied!");
        }
    }

  

}
