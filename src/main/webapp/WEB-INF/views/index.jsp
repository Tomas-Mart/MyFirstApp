<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
    <title><fmt:message key="home.title" /></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <!-- Подключение Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Основные стили */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column; /* Вертикальное расположение */
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

        /* Адаптивность для мобильных устройств */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            a {
                font-size: 1rem;
                padding: 12px 24px;
            }
        }

        .spacer {
            height: 15cm; /* Отступ 15 см */
        }
    </style>
</head>
<body>
<div class="spacer"></div>
<h1><fmt:message key="home.welcome" /></h1>
<div class="spacer"></div>
<a href="${pageContext.request.contextPath}/users"><fmt:message key="home.viewUsers" /></a>
<div class="spacer"></div>
</body>
</html>
