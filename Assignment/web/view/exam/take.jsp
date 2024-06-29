<%-- 
    Document   : take
    Created on : Jun 24, 2024, 2:01:09 PM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/file/text/take.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <form action="take" method="POST">
        <table>
            <tr>
                <td></td>
                <c:forEach items="${requestScope.exams}" var="e">
                    <td>
                        <div class="exam-header">${e.assessment.name}(${e.assessment.weight})</div>
                        <div class="exam-date">${e.from}</div>
                    </td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
                <tr>
                    <td class="student-name">${s.name}</td>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <td>
                            <input type="text" name="score${s.id}_${e.id}"
                                <c:forEach items="${requestScope.grades}" var="g">
                                    <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                        value="${g.score}"
                                    </c:if>
                                </c:forEach>
                            />
                            <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>    
        </table>
        <input type="hidden" name="cid" value="${param.cid}" />
        <input type="submit" value="Save"/>
    </form>
</body>
</html>
