<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<div class="container">
    <h1>Users</h1>

    <!-- Таблица с пользователями -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Age</th>
            <th>Actions</th>
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
                    <a href="${pageContext.request.contextPath}/users/details?id=${user.id}"
                       class="btn-link">Details</a>
                    <a href="${pageContext.request.contextPath}/users/edit?id=${user.id}" class="btn-link">Edit</a>
                    <a href="${pageContext.request.contextPath}/users/delete?id=${user.id}" class="btn-link">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Форма для добавления нового пользователя -->
    <h2>Add User</h2>
    <form action="${pageContext.request.contextPath}/users/add" method="post">
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" class="form-input" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-input" required>
        </div>
        <div>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" class="form-input" required>
        </div>
        <button type="submit" class="btn">Add</button>
    </form>
</div>
</body>
</html>