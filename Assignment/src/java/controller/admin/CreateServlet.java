package controller.admin;

import dal.CourseDAO;
import dal.LecturerDBContext;
import dal.SemesterDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.Lecturer;
import model.Semester;
import model.Subject;

public class CreateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LecturerDBContext ldb = new LecturerDBContext();
        SubjectDBContext subdb = new SubjectDBContext();
        SemesterDBContext semdb = new SemesterDBContext();

        List<Lecturer> lecturers = ldb.getAll();
        List<Subject> subjects = subdb.getAll();
        List<Semester> semesters = semdb.getAll();

        request.setAttribute("lecturers", lecturers);
        request.setAttribute("subjects", subjects);
        request.setAttribute("semesters", semesters);
        
        CourseDAO courseDAO = new CourseDAO();
        List<Course> courses = courseDAO.getAll();
        request.setAttribute("courses", courses);

        request.getRequestDispatcher("view/admin/createClass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cidStr = request.getParameter("cid");
        String cname = request.getParameter("className");
        String lecturerIdStr = request.getParameter("lecturer");
        String subjectIdStr = request.getParameter("subject");
        String semesterIdStr = request.getParameter("semester");
        String[] studentIds = request.getParameterValues("student[]");

        try {
            int cid = Integer.parseInt(cidStr);
            int lecturerId = Integer.parseInt(lecturerIdStr);
            int subjectId = Integer.parseInt(subjectIdStr);
            int semesterId = Integer.parseInt(semesterIdStr);

            CourseDAO courseDAO = new CourseDAO();
            if (courseDAO.courseExists(cid, cname)) {
                request.setAttribute("errMsg", "Class already exists!");
                setLastInputs(request, cidStr, cname, lecturerIdStr, subjectIdStr, semesterIdStr, studentIds);
                doGet(request, response);
                return;
            }

            Lecturer lecturer = new Lecturer();
            lecturer.setId(lecturerId);
            Subject subject = new Subject();
            subject.setId(subjectId);
            Semester semester = new Semester();
            semester.setSemid(semesterId);

            Course course = new Course();
            course.setId(cid);
            course.setName(cname);
            course.setLecturer(lecturer);
            course.setSubject(subject);
            course.setSemester(semester);

            // Insert the new course
            courseDAO.insertCourse(course);

            for (String studentId : studentIds) {
                // Add students to the course
                courseDAO.addStudentToCourse(cid, Integer.parseInt(studentId));
            }

            request.setAttribute("success", "Tạo thành công");
            setLastInputs(request, cidStr, cname, lecturerIdStr, subjectIdStr, semesterIdStr, studentIds);
        } catch (NumberFormatException e) {
            request.setAttribute("errMsg", "Invalid input data");
            System.out.println(e);
        }
         // Sau khi xử lý POST, lấy lại danh sách khóa học
        CourseDAO courseDAO = new CourseDAO();
        List<Course> courses = courseDAO.getAll();
        request.setAttribute("courses", courses);

        doGet(request, response);
    }

    private void setLastInputs(HttpServletRequest request, String cidStr, String cname,
            String lecturerIdStr, String subjectIdStr, String semesterIdStr,
            String[] studentIds) {
        request.setAttribute("lastCid", cidStr);
        request.setAttribute("lastClassName", cname);
        request.setAttribute("lastLecturerId", lecturerIdStr);
        request.setAttribute("lastSubjectId", subjectIdStr);
        request.setAttribute("lastSemesterId", semesterIdStr);
        request.setAttribute("lastStudentIds", studentIds);
    }
}
