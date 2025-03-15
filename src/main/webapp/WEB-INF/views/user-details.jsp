<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="userDetails.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><fmt:message key="userDetails.header" /></h1>

    <!-- Отображение деталей пользователя -->
    <div class="user-details">
        <p><strong><fmt:message key="userDetails.id" />:</strong> ${user.id}</p>
        <p><strong><fmt:message key="userDetails.name" />:</strong> ${user.name}</p>
        <p><strong><fmt:message key="userDetails.email" />:</strong> ${user.email}</p>
        <p><strong><fmt:message key="userDetails.age" />:</strong> ${user.age}</p>
    </div>

    <!-- Ссылка для возврата к списку пользователей -->
    <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="userDetails.backToList" /></a>
</div>
</body>
</html>