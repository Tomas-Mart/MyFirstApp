<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <div class="form-container">
        <form:form action="${pageContext.request.contextPath}/users/add" method="post" modelAttribute="user" onsubmit="return validateName()">
            <!-- Поле для имени -->
            <div>
                <label for="name"><fmt:message key="addUser.name" />:</label>
                <form:input path="name" id="name" cssClass="form-input"/>
                <form:errors path="name" cssClass="error"/>
                <p class="error hidden" id="nameError"><fmt:message key="addUser.nameValidation" /></p>
            </div>

            <!-- Поле для email -->
            <div>
                <label for="email"><fmt:message key="addUser.email" />:</label>
                <form:input path="email" id="email" cssClass="form-input"/>
                <form:errors path="email" cssClass="error"/>
            </div>

            <!-- Поле для возраста -->
            <div>
                <label for="age"><fmt:message key="addUser.age" />:</label>
                <form:input path="age" id="age" type="number" cssClass="form-input"/>
                <form:errors path="age" cssClass="error"/>
            </div>

            <!-- Кнопка для сохранения -->
            <div>
                <button type="submit" class="btn"><fmt:message key="addUser.submit" /></button>
            </div>
        </form:form>

        <!-- Ссылка для возврата к списку пользователей -->
        <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="addUser.backToList" /></a>
    </div>
</div>

<!-- Скрипт для валидации имени -->
<script>
    function validateName() {
        const name = document.getElementById("name").value;
        const regex = /^[A-Za-zА-Яа-я\s]+$/; // Разрешаем только буквы (английские и русские) и пробелы
        const nameError = document.getElementById("nameError");

        if (!regex.test(name)) {
            nameError.classList.remove("hidden");
            return false;
        } else {
            nameError.classList.add("hidden");
            return true;
        }
    }

    // Скрываем сообщение об ошибке при изменении поля "Имя"
    document.getElementById("name").addEventListener("input", function() {
        document.getElementById("nameError").classList.add("hidden");
    });
</script>
</body>
</html>