<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Users</title>
</head>
<body>
<h1>Users</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.age}</td>
            <td>
                <a href="/users/edit?id=${user.id}">Edit</a>
                <a href="/users/delete?id=${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<h2>Add User</h2>
<form:form action="/users/add" method="post" modelAttribute="user">
    Name: <form:input path="name"/><form:errors path="name"/><br>
    Email: <form:input path="email"/><form:errors path="email"/><br>
    Age: <form:input path="age"/><form:errors path="age"/><br>
    <input type="submit" value="Add">
</form:form>
</body>
</html>