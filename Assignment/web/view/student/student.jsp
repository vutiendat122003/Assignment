<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link href="${pageContext.request.contextPath}/file/text/student.css" rel="stylesheet" type="text/css"/>
        <title>Student Mark Report</title>
    </head>
    <body>
        <div class="container">
            <form action="../semester/student" method="POST">
            <select name="semid" id="semesterSelect">
                <c:forEach items="${requestScope.semesters}" var="c">
                    <option value="${c.semid}" ${c.semid == selectedSemId ? 'selected' : ''}>
                        ${c.season} ${c.year}
                    </option>
                </c:forEach>
            </select>
            <input type="submit" value="View Report">
        </form>
        <c:if test="${not empty requestScope.subjects}">
            <h2>Subjects for Selected Semester</h2>
            
            <ul>
                <c:forEach items="${requestScope.subjects}" var="subject">
                    <li><a href="../semester/student?action=getMark&subjectId=${subject.id}">${subject.name}</a></li>
                    </c:forEach>
            </ul>
        </c:if>
        <c:if test="${not empty requestScope.mark}">
            <h3>Mark for ${requestScope.subjectName}: ${requestScope.mark}</h3>
        </c:if>
        </div>
        
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
        
    </body>
</html>