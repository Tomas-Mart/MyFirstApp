<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h1>Edit User</h1>
<form:form action="/users/edit" method="post" modelAttribute="user">
    <form:hidden path="id"/>
    Name: <form:input path="name"/><form:errors path="name"/><br>
    Email: <form:input path="email"/><form:errors path="email"/><br>
    Age: <form:input path="age"/><form:errors path="age"/><br>
    <input type="submit" value="Save">
</form:form>
</body>
</html>