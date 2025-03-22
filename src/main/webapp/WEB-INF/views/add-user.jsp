<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="addUser.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        .error-input {
            border: 2px solid red;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var age = document.getElementById("age").value;
            var password = document.getElementById("password").value;
            var errorMessage = document.getElementById("error-message");
            var isValid = true;

            // Сброс стилей ошибок
            document.getElementById("name").classList.remove("error-input");
            document.getElementById("email").classList.remove("error-input");
            document.getElementById("age").classList.remove("error-input");
            document.getElementById("password").classList.remove("error-input");
            errorMessage.innerHTML = "";

            // Проверка поля name
            if (name.trim() === "") {
                document.getElementById("name").classList.add("error-input");
                errorMessage.innerHTML += "<fmt:message key='error.required' />: Имя<br>";
                isValid = false;
            }

            // Проверка поля email
            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("email").classList.add("error-input");
                errorMessage.innerHTML += "<fmt:message key='error.invalid' />: Email<br>";
                isValid = false;
            }

            // Проверка поля age
            if (age <= 0) {
                document.getElementById("age").classList.add("error-input");
                errorMessage.innerHTML += "<fmt:message key='error.invalid' />: Возраст<br>";
                isValid = false;
            }

            // Проверка поля password
            if (password.trim() === "") {
                document.getElementById("password").classList.add("error-input");
                errorMessage.innerHTML += "<fmt:message key='error.required' />: Пароль<br>";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
<div class="container">
    <h1><fmt:message key="addUser.header" /></h1>

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

    <!-- Форма для добавления пользователя -->
    <form action="${pageContext.request.contextPath}/users/add" method="post" onsubmit="return validateForm()">
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
        <div>
            <label for="password"><fmt:message key="addUser.password" />:</label>
            <input type="password" id="password" name="password" class="form-input" required>
        </div>
        <button type="submit" class="btn"><fmt:message key="addUser.submit" /></button>
    </form>

    <!-- Ссылка для возврата к списку пользователей -->
    <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="addUser.backToList" /></a>

    <!-- Отображение сообщений об ошибках -->
    <div id="error-message" class="error-message"></div>
</div>
</body>
</html>
