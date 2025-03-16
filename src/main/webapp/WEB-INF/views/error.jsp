<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="ru" />
<fmt:setBundle basename="messages" />

<html>
<head>
  <title><fmt:message key="error.title" /></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
  <h1><fmt:message key="error.header" /></h1>

  <!-- Отображение общих ошибок -->
  <c:if test="${not empty errorMessage}">
    <div class="error-message">
        ${errorMessage}
    </div>
  </c:if>

  <!-- Ссылка для возврата к списку пользователей -->
  <a href="${pageContext.request.contextPath}/users" class="btn-link"><fmt:message key="error.backToList" /></a>
</div>
</body>
</html>
