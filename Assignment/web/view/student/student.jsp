<%-- 
    Document   : student
    Created on : Jul 4, 2024, 11:29:45 AM
    Author     : Vanxuan
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Mark Report</title>
    </head>
    <body>
        <form action="../semester/student" method="POST">
            <select name="semid" id="semesterSelect">
                <c:forEach items="${requestScope.semesters}" var="c">
                    <option value="${c.semid}">
                        ${c.season} ${c.year}
                    </option>
                </c:forEach>
            </select>
            <input type="submit" value="View Report">
        </form>
        <c:if test="${not empty requestScope.subjects}">
            <h2>Subjects for Selected Semester</h2>
            <p>Number of subjects: ${requestScope.subjects.size()}</p>
            <c:forEach items="${requestScope.subjects}" var="subject">
            <li>${subject.name}</li>
            </c:forEach>

    </c:if>

</body>
</html>