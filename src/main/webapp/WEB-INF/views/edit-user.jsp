<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<h1>Edit User</h1>
<form action="/users/edit" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${user.name}" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${user.email}" required>
    <br>
    <button type="submit">Save</button>
</form>
<a href="/users">Back to Users List</a>
</body>
</html>