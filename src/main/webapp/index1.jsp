<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">
<body>
<h2>Xin chào 1 <% User auth= (User) session.getAttribute("auth");%>
<% if(auth==null){ %>
<p>Bạn chưa đăng nhập</p>
<% }else {%>
<p>Chào bạn<%= auth.getUser_fullname()%></p>
<% } %></h2>
</body>
</html>
