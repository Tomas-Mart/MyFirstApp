<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="users.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><fmt:message key="users.header" /></h1>

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

    <!-- Таблица с пользователями -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th><fmt:message key="users.name" /></th>
            <th><fmt:message key="users.email" /></th>
            <th><fmt:message key="users.age" /></th>
            <th><fmt:message key="users.actions" /></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.age}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/users/details?id=${user.id}" class="btn-link"><fmt:message key="users.details" /></a>
                    <a href="${pageContext.request.contextPath}/users/edit?id=${user.id}" class="btn-link"><fmt:message key="users.edit" /></a>
                    <form action="${pageContext.request.contextPath}/users/delete" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="${user.id}">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('<fmt:message key="users.deleteConfirmation" />')"><fmt:message key="users.delete" /></button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Форма для добавления нового пользователя -->
    <h2><fmt:message key="users.addUser" /></h2>
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
</div>
</body>
</html>