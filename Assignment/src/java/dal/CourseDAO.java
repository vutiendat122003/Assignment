/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import model.Course;
import model.Lecturer;
import model.Semester;
import model.Subject;

/**
 *
 * @author Vanxuan
 */
public class CourseDAO extends DBContext<Course> {

    
    public boolean courseExists(int cid, String cname) {
        String sql = "SELECT COUNT(*) FROM courses WHERE cid = ? ";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, cid);            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error checking course existence: " + e.getMessage());
        }
        return false;
    }
    
     public void insertCourse(Course course) {
        String sql = "INSERT INTO courses (cid, cname, lid, subid, semid) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, course.getId());
            stmt.setString(2, course.getName());
            stmt.setInt(3, course.getLecturer().getId());
            stmt.setInt(4, course.getSubject().getId());
            stmt.setInt(5, course.getSemester().getSemid());
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating course failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting course: " + e.getMessage());
        }
    }
     public void addStudentToCourse(int cid, int studentId) {
    String sql = "INSERT INTO students_courses (sid, cid) VALUES (?, ?)";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, studentId);
        stmt.setInt(2, cid);
        
        stmt.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Error adding student to course: " + e.getMessage());
    }
}
     public ArrayList<Course> getAll() {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT c.cid, c.cname, l.lid, l.lname, s.subid, s.subname, sem.semid, sem.year, sem.season " +
                     "FROM courses c " +
                     "JOIN lecturers l ON c.lid = l.lid " +
                     "JOIN subjects s ON c.subid = s.subid " +
                     "JOIN semester sem ON c.semid = sem.semid";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("cid"));
                course.setName(rs.getString("cname"));
                
                Lecturer lecturer = new Lecturer();
                lecturer.setId(rs.getInt("lid"));
                lecturer.setName(rs.getString("lname"));
                course.setLecturer(lecturer);
                
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("subname"));
                course.setSubject(subject);
                
                Semester semester = new Semester();
                semester.setSemid(rs.getInt("semid"));
                semester.setYear(rs.getInt("year"));
                semester.setSeason(rs.getString("season"));
                course.setSemester(semester);
                
                
                
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    @Override
    public Course get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Course> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
