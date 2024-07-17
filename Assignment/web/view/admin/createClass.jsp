<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/file/text/createClass.css" rel="stylesheet" type="text/css"/>
    <title>Create Class and Add Students</title>
</head>
<body>
    <h1>Create Class and Add Students</h1>
    <form action="create" method="post">
        <label for="cid">Class ID:</label>
        <input type="text" id="cid" name="cid" value="${lastCid}" required><br><br>
        
        <label for="className">Class Name:</label>
        <input type="text" id="className" name="className" value="${lastClassName}" required><br><br>
        
        <c:if test="${not empty errMsg}">
            <div style="color: red;">
                ${errMsg}
            </div>
        </c:if>
        <br/> 
        
        <label for="lecturer">Lecturer:</label>
        <select id="lecturer" name="lecturer" required>
            <c:forEach var="lecturer" items="${lecturers}">
                <option value="${lecturer.id}" ${lecturer.id == lastLecturerId ? 'selected' : ''}>${lecturer.name}</option>
            </c:forEach>
        </select><br><br>
        
        <label for="subject">Subject:</label>
        <select id="subject" name="subject" required>
            <c:forEach var="subject" items="${subjects}">
                <option value="${subject.id}" ${subject.id == lastSubjectId ? 'selected' : ''}>${subject.name}</option>
            </c:forEach>
        </select><br><br>
        
        <label for="semester">Semester:</label>
        <select id="semester" name="semester" required>
            <c:forEach var="semester" items="${semesters}">
                <option value="${semester.semid}" ${semester.semid == lastSemesterId ? 'selected' : ''}>${semester.year} - ${semester.season}</option>
            </c:forEach>
        </select><br><br>
        
        <h2>Add Students</h2>
        <div id="studentList">
            <c:choose>
                <c:when test="${not empty lastStudentIds}">
                    <c:forEach var="studentId" items="${lastStudentIds}">
                        <input type="text" name="student[]" value="${studentId}" placeholder="Student ID" required>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <input type="text" name="student[]" placeholder="Student ID" required>
                </c:otherwise>
            </c:choose>
        </div>
        <button type="button" onclick="addStudentField()">Add Student</button><br><br>
        
        <input type="submit" value="Create Class">
        <button type="button" onclick="clearForm()">Create New Class</button>
    </form>
    
    <c:if test="${not empty success}">
        <div style="color: green;">
            ${success}
        </div>
    </c:if>
         <button onclick="toggleCourseList()">View Courses</button>

    <div id="courseList">
        <h2>Course List</h2>
        <table border="1px" >
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Lecturer</th>
                <th>Subject</th>
                <th>Semester</th>
            </tr>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <td>${course.id}</td>
                    <td>${course.name}</td>
                    <td>${course.lecturer.name}</td>
                    <td>${course.subject.name}</td>
                    <td>${course.semester.year} - ${course.semester.season}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
         <a href="javascript:history.back()" class="back-btn">Quay lại</a>
    
    <script>
        function addStudentField() {
            var studentList = document.getElementById("studentList");
            var newStudent = document.createElement("div");
            newStudent.innerHTML = '<input type="text" name="student[]" placeholder="Student ID" required>';
            studentList.appendChild(newStudent);
        }

        function clearForm() {
            document.getElementById("cid").value = "";
            document.getElementById("className").value = "";
            document.getElementById("lecturer").selectedIndex = 0;
            document.getElementById("subject").selectedIndex = 0;
            document.getElementById("semester").selectedIndex = 0;
            var studentList = document.getElementById("studentList");
            studentList.innerHTML = '<input type="text" name="student[]" placeholder="Student ID" required>';
        }
        function toggleCourseList() {
            var courseList = document.getElementById("courseList");
            if (courseList.style.display === "none") {
                courseList.style.display = "block";
            } else {
                courseList.style.display = "none";
            }
        }
    </script>
</body>
</html>