<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
  <title><fmt:message key="error.title" /></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
  <!-- Подключение Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    /* Основные стили */
    body {
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #667eea, #764ba2);
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column; /* Вертикальное расположение */
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #fff;
      text-align: center;
    }

    h1 {
      font-size: 2.5rem;
      font-weight: 700;
      margin-bottom: 20px;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
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

    .btn-link {
      display: inline-block;
      padding: 12px 24px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 50px;
      text-decoration: none;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    .btn-link:hover {
      background-color: #0056b3;
      transform: translateY(-2px);
      box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
    }

    .btn-link:active {
      transform: translateY(0);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    /* Адаптивность для мобильных устройств */
    @media (max-width: 768px) {
      h1 {
        font-size: 2rem;
      }

      .error-message {
        font-size: 1rem;
        padding: 10px;
      }

      .btn-link {
        font-size: 0.9rem;
        padding: 10px 20px;
      }
    }
  </style>
</head>
<body>
<h1><fmt:message key="error.header" /></h1>

<!-- Отображение общих ошибок -->
<c:if test="${not empty error}">
  <div class="error-message">
      ${error}
  </div>
</c:if>

<!-- Ссылка для возврата к списку пользователей -->
<a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="error.backToList" /></a>
</body>
</html>
