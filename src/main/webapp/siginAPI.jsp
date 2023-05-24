<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 23/05/23
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng ký</title>
</head>
<body>
<h1>Đăng ký tài khoản</h1>
<form action="API" method="post">
  <p class="text-danger">${mess}</p>
<%--  <label for="name">Tên:</label>--%>
<%--  <input type="text" name="name" id="name" required><br>--%>

  <label for="email">Email:</label>
  <input type="email" name="email" id="email" value="fox@1234"><br>

  <label for="password" >Mật khẩu:</label>
  <input type="password" name="pass" id="password" value="123456"><br>
  <%-- Hiển thị access token --%>
<%--  <c:if test="${not empty accessToken}">--%>
<%--    <p>${accessToken}</p>--%>
<%--  </c:if>--%>
<%--  <c:if test="${not empty provinces}">--%>
<%--    <p>${provinces}</p>--%>
<%--  </c:if>--%>


  <input type="submit" value="Đăng ký">
</form>
</body>
</html>
