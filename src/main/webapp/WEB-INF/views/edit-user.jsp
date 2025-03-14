<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<h1>Edit User</h1>

<!-- Отображение общих ошибок валидации -->
<c:if test="${not empty errors}">
    <div class="error-message">
        <ul>
            <c:forEach items="${errors}" var="error">
                <li>${error}</li>
            </c:forEach>
        </ul>
    </div>
</c:if>

<form:form action="${pageContext.request.contextPath}/users/edit" method="post" modelAttribute="user">
    <form:hidden path="id"/> <!-- Скрытое поле для ID пользователя -->

    <!-- Поле для имени -->
    <div>
        <label for="name">Name:</label>
        <form:input path="name" id="name" cssClass="form-input"/>
        <form:errors path="name" cssClass="error"/> <!-- Отображение ошибок валидации -->
    </div>

    <!-- Поле для email -->
    <div>
        <label for="email">Email:</label>
        <form:input path="email" id="email" cssClass="form-input"/>
        <form:errors path="email" cssClass="error"/> <!-- Отображение ошибок валидации -->
    </div>

    <!-- Поле для возраста -->
    <div>
        <label for="age">Age:</label>
        <form:input path="age" id="age" type="number" cssClass="form-input"/>
        <form:errors path="age" cssClass="error"/> <!-- Отображение ошибок валидации -->
    </div>

    <!-- Кнопка для сохранения -->
    <div>
        <button type="submit" class="btn">Save</button>
    </div>
</form:form>

<!-- Ссылка для возврата к списку пользователей -->
<a href="${pageContext.request.contextPath}/users" class="btn-link">Back to Users List</a>
</body>
</html>