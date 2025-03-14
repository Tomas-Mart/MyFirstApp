<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<div class="container">
    <h1>User Details</h1>

    <!-- Отображение деталей пользователя -->
    <div class="user-details">
        <p><strong>ID:</strong> ${user.id}</p>
        <p><strong>Name:</strong> ${user.name}</p>
        <p><strong>Email:</strong> ${user.email}</p>
        <p><strong>Age:</strong> ${user.age}</p>
    </div>

    <!-- Ссылка для возврата к списку пользователей -->
    <a href="${pageContext.request.contextPath}/users" class="btn-link">Back to Users List</a>
</div>
</body>
</html>