<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="${pageContext.request.contextPath}/file/text/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <ul>
        <li><a href="${pageContext.request.contextPath}/create">Create Class and Add Students</a></li>
        <li><a href="${pageContext.request.contextPath}/viewStatistics">View Pass/Fail Statistics</a></li>
    </ul>
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
</body>
</html>