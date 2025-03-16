<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="editUser.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><fmt:message key="editUser.header" /></h1>

    <!-- Отображение общих ошибок -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
                ${errorMessage}
        </div>
    </c:if>

    <!-- Отображение ошибок валидации -->
    <c:if test="${not empty errors}">
        <div class="error-message">
            <ul>
                <c:forEach items="${errors.allErrors}" var="error">
                    <li>${error.defaultMessage}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <!-- Форма для редактирования пользователя -->
    <form action="${pageContext.request.contextPath}/users/update" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <div>
            <label for="name"><fmt:message key="addUser.name" />:</label>
            <input type="text" id="name" name="name" value="${user.name}" class="form-input" required>
        </div>
        <div>
            <label for="email"><fmt:message key="addUser.email" />:</label>
            <input type="email" id="email" name="email" value="${user.email}" class="form-input" required>
        </div>
        <div>
            <label for="age"><fmt:message key="addUser.age" />:</label>
            <input type="number" id="age" name="age" value="${user.age}" class="form-input" required>
        </div>
        <button type="submit" class="btn"><fmt:message key="editUser.submit" /></button>
    </form>

    <!-- Ссылка для возврата к списку пользователей -->
    <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="addUser.backToList" /></a>
</div>
</body>
</html>
