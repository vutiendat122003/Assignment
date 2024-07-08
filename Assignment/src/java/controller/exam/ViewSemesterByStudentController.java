/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.exam;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.GradeDBContext;
import dal.SemesterDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Grade;
import model.Semester;
import model.Student;
import model.Subject;
import model.User;

/**
 *
 * @author Vanxuan
 */
public class ViewSemesterByStudentController extends BaseRequiredStudentAuthenticationController {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("getMark".equals(action)) {
            int sid = student.getId();
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            GradeDBContext gdb = new GradeDBContext();
            ArrayList<Grade> grades = new ArrayList<>();
            grades = gdb.getGradesBySubjectAndStudent(subjectId, sid);
            request.setAttribute("grades", grades);
            
            request.getRequestDispatcher("../view/student/grade_detail.jsp").forward(request, response);

        }

        SemesterDBContext db = new SemesterDBContext();
        int sid = student.getId();
        ArrayList<Semester> semesters = db.getSemesterBySid(sid);
        request.setAttribute("semesters", semesters);

        request.getRequestDispatcher("../view/student/student.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student)
            throws ServletException, IOException {
        String semid_raw = request.getParameter("semid");
        int semid;
        int sid = student.getId();
        try {
            semid = Integer.parseInt(semid_raw);
            SubjectDBContext sdb = new SubjectDBContext();
            ArrayList<Subject> subjects = sdb.getSubjectBySemidAndSid(semid, sid);
            request.setAttribute("subjects", subjects);

            // Lưu lại danh sách kỳ học và kỳ học đã chọn
            SemesterDBContext db = new SemesterDBContext();
            ArrayList<Semester> semesters = db.getSemesterBySid(sid);
            request.setAttribute("semesters", semesters);
            request.setAttribute("selectedSemId", semid);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("../view/student/student.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
