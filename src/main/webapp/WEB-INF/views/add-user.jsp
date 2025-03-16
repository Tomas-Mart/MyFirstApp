<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="addUser.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><fmt:message key="addUser.header" /></h1>

    <!-- Отображение общих ошибок -->
    <c:if test="${not empty error}">
        <div class="error-message">
                ${error}
        </div>
    </c:if>

    <!-- Отображение ошибок валидации -->
    <c:if test="${not empty errors}">
        <div class="error-message">
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error.defaultMessage}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <!-- Форма для добавления пользователя -->
    <form action="${pageContext.request.contextPath}/users/add" method="post">
        <div>
            <label for="name"><fmt:message key="addUser.name" />:</label>
            <input type="text" id="name" name="name" class="form-input" required>
        </div>
        <div>
            <label for="email"><fmt:message key="addUser.email" />:</label>
            <input type="email" id="email" name="email" class="form-input" required>
        </div>
        <div>
            <label for="age"><fmt:message key="addUser.age" />:</label>
            <input type="number" id="age" name="age" class="form-input" required>
        </div>
        <button type="submit" class="btn"><fmt:message key="addUser.submit" /></button>
    </form>

    <!-- Ссылка для возврата к списку пользователей -->
    <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="addUser.backToList" /></a>
</div>
</body>
</html>