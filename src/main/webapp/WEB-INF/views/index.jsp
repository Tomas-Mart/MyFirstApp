<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="home.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            text-align: center;
        }

        h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        a {
            text-decoration: none;
            font-size: 1.2rem;
            color: #fff;
            background-color: #007bff;
            padding: 15px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            display: inline-block;
            border: 2px solid transparent;
        }

        a:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
        }

        a:active {
            transform: translateY(0);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .spacer {
            height: 15cm;
        }

        .error-message {
            font-size: 1.2rem;
            color: #ff6b6b;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="spacer"></div>

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

<h1><fmt:message key="home.welcome" /></h1>
<div class="spacer"></div>
<a href="${pageContext.request.contextPath}/users"><fmt:message key="home.viewUsers" /></a>
<div class="spacer"></div>
</body>
</html>
