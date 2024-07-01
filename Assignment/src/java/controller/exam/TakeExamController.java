/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.exam;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.ExamDBContext;
import dal.GradeDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import model.Exam;
import model.Grade;
import model.Lecturer;
import model.Student;
import model.User;

/**
 *
 * @author Vanxuan
 */
public class TakeExamController extends BaseRequiredLecturerAuthenticationController {
   
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,User user, Lecturer lecturer)
    throws ServletException, IOException {
        StudentDBContext stuDB = new StudentDBContext();
        ExamDBContext examDB = new ExamDBContext();
        GradeDBContext graDB = new GradeDBContext();
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Student> students = stuDB.getStudentsByCourse(cid);
        
        String[] raw_eids = request.getParameterValues("eid");
        ArrayList<Integer> eids = new ArrayList<>();
        for (String raw_eid : raw_eids) {
            eids.add(Integer.parseInt(raw_eid));
        }
        
        ArrayList<Exam> exams = examDB.getExamsByExamIds(eids);
        ArrayList<Grade> grades = graDB.getGradesFromExamIds(eids);
        
        request.setAttribute("students", students);
        request.setAttribute("exams", exams);
        request.setAttribute("grades",grades);
        
        request.getRequestDispatcher("../view/exam/take.jsp").forward(request, response);
        
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer)
    throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        HashSet<Integer> eids = new HashSet<>();
        
        String[] raw_gradeids = request.getParameterValues("gradeid");
        ArrayList<Grade> grades = new ArrayList<>();
        ArrayList<String> errors = new ArrayList<>();

        for (String raw_gradeid : raw_gradeids) {
            int sid = Integer.parseInt(raw_gradeid.split("_")[0]);
            int eid = Integer.parseInt(raw_gradeid.split("_")[1]);
            
            eids.add(eid);
            
            String raw_score = request.getParameter("score" + sid + "_" + eid);
            if(raw_score != null && !raw_score.trim().isEmpty()) {
                try {
                    float score = Float.parseFloat(raw_score);
                    if (score >= 0 && score <= 10) {
                        Grade g = new Grade();
                        Exam e = new Exam();
                        e.setId(eid);
                        
                        Student s = new Student();
                        s.setId(sid);
                        
                        g.setExam(e);
                        g.setStudent(s);
                        g.setScore(score);
                        
                        grades.add(g);
                    } else {
                        errors.add("Điểm không hợp lệ cho học sinh " + sid + " trong bài kiểm tra " + eid + ": " + raw_score + ". Điểm phải từ 0 đến 10.");
                    }
                } catch (NumberFormatException e) {
                    errors.add("Định dạng điểm không hợp lệ cho học sinh " + sid + " trong bài kiểm tra " + eid + ": " + raw_score);
                }
            }
        }
        
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            doGet(request, response, user, lecturer);
            return;
        }

        GradeDBContext db = new GradeDBContext();
        db.insertGradesForCourse(cid, grades);
        
        String url_param = "";
        for (Integer eid : eids) {
            url_param += "&eid=" + eid;
        }
        response.sendRedirect("take?cid=" + cid + url_param);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
