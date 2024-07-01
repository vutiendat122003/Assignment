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
        <link href="${pageContext.request.contextPath}/file/text/logout.css" rel="stylesheet" type="text/css"/>
        <script>
            function validateScores() {
                var inputs = document.querySelectorAll('input[type="text"][name^="score"]');
                for (var i = 0; i < inputs.length; i++) {
                    var score = parseFloat(inputs[i].value);
                    if (inputs[i].value !== "" && (isNaN(score) || score < 0 || score > 10)) {
                        alert("Score must be a number from 0 to 10");
                        inputs[i].focus();
                        return false;
                    }
                }
                return true;
            }
        </script>
    </head>
    <body>
        <c:if test="${not empty requestScope.errors}">
            <div class="error-messages">
                <c:forEach items="${requestScope.errors}" var="error">
                    <p style="color: red;">${error}</p>
                </c:forEach>
            </div>
        </c:if>
        <form action="take" method="POST" onsubmit="return validateScores()">
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
                                       min="0" max="10" step="0.1"
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
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </body>
</html>