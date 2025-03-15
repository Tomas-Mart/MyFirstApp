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
    <!-- Подключение Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* Основные стили */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f4f4f9, #e0e0e7);
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #333;
            font-weight: 700;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 2.5rem;
            text-align: center;
        }

        h2 {
            font-size: 2rem;
            margin-top: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-edit {
            background-color: #28a745;
        }

        .btn-edit:hover {
            background-color: #218838;
        }

        .btn-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6c757d; /* Серый цвет */
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-link:hover {
            background-color: #4caf50; /* Зеленый цвет при наведении */
        }

        .btn-link:active {
            background-color: #4caf50; /* Зеленый цвет при нажатии */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .error-message {
            color: #dc3545;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-input:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Адаптивность для мобильных устройств */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            table, th, td {
                font-size: 0.9rem;
            }

            .btn {
                padding: 8px 16px;
                font-size: 0.9rem;
            }
        }
    </style>
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
                    <!-- Ссылка для просмотра деталей -->
                    <a href="${pageContext.request.contextPath}/users/details?id=${user.id}" class="btn-link"><fmt:message key="users.details" /></a>

                    <!-- Ссылка для редактирования -->
                    <a href="${pageContext.request.contextPath}/users/edit?id=${user.id}" class="btn-link"><fmt:message key="users.edit" /></a>

                    <!-- Форма для удаления пользователя -->
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
