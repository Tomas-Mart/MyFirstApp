<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<h1>Add User</h1>

<!-- Отображение ошибок валидации -->
<c:if test="${not empty errors}">
    <div class="error-message">
        <ul>
            <c:forEach items="${errors}" var="error">
                <li>${error}</li>
            </c:forEach>
        </ul>
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/users/add" method="post">
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${user.name}" required>
        <c:if test="${not empty nameError}">
            <span class="error">${nameError}</span>
        </c:if>
    </div>
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required>
        <c:if test="${not empty emailError}">
            <span class="error">${emailError}</span>
        </c:if>
    </div>
    <div>
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="${user.age}" required>
        <c:if test="${not empty ageError}">
            <span class="error">${ageError}</span>
        </c:if>
    </div>
    <button type="submit">Add</button>
</form>

<a href="${pageContext.request.contextPath}/users">Back to Users List</a>
</body>
</html>