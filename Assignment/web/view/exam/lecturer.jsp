<%-- 
    Document   : lecturer
    Created on : Jun 19, 2024, 4:49:40 PM
    Author     : X1 Nano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/file/text/lecturer.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/file/text/logout.css" rel="stylesheet" type="text/css"/>
        <script>
            function toggleSelectAll(source) {
                checkboxes = document.getElementsByName('eid');
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }
        </script>
        <style>
            
            .select-all {
                background-color: #FFC107; /* Yellow background */
                border-color: #FFC107; /* Yellow border */
            }

            .select-all:checked::before {
                color: #FFC107; /* Yellow check mark */
            }
        </style>
    </head>
    <body>
        <form action="${requestScope.exams eq null ? 'lecturer' : 'take'}" method="${requestScope.exams eq null ? 'POST' : 'GET'}">
            <c:if test="${requestScope.exams eq null}">
                <c:if test="${requestScope.courses.size() > 0}">
                    <input type="hidden" name="lid" value="${param.lid}"/>
                    <label for="cid">Course:</label>
                    <select name="cid" id="cid">
                        <c:forEach items="${requestScope.courses}" var="c">
                            <option value="${c.id}">
                                ${c.name}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="View"/>
                </c:if>
            </c:if>
            <c:if test="${requestScope.exams ne null}">
                <input type="hidden" name="cid" value="${param.cid}"/>
                <c:forEach items="${requestScope.exams}" var="e">
                    <div class="exam-item">
                        <input type="checkbox" name="eid" value="${e.id}" id="exam-${e.id}"/> 
                        <label for="exam-${e.id}">${e.assessment.name} - (${e.from}: ${e.assessment.weight}%)</label>
                    </div>
                </c:forEach>
                <div class="exam-item">
                    <input type="checkbox" id="selectAll" class="select-all"  onclick="toggleSelectAll(this)"/> 
                    <label for="select-all">Select All</label>
                </div>
                <input type="submit" value="Take"/>
            </c:if>
        </form>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
    </body>
</html>
