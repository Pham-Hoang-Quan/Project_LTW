<%@ page import="vn.edu.hcmuaf.ttt.bean.Profile_Modal" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.Profile_Bean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Insert title here</title>
</head>
<body>
<%--<c:set var="user" value="${sessionScope.user}"></c:set>--%>
<%--<p>username: ${user.username}</p>--%>
<%--<c:if test="${user.facebookID == null}">--%>
<%--  <p>normal</p>--%>
<%--</c:if>--%>
<%--<c:if test="${user.facebookID != null}">--%>
<%--  <p>facebook</p>--%>
<%--  <p>ID: ${user.facebookID}</p>--%>
<%--  <p>LINK: ${user.link}</p>--%>
<%--</c:if>--%>
<%--<c:url value="AccountServlet" var="logOutUrl">--%>
<%--  <c:param name="btAction" value="Logout"></c:param>--%>
<%--</c:url>--%>

<%
  String access_token=(String)request.getParameter("access_token");
  Profile_Modal obj_Profile_Modal=new Profile_Modal();
  Profile_Bean obj_Profile_Bean= obj_Profile_Modal.call_me(access_token);
%>
<form action="fbController" method="post">
Name : <p name="name"><%=obj_Profile_Bean.getUser_name() %></p></p><br>
  Email : <p name="mail"><%=obj_Profile_Bean.getEmail() %></p><br>
  id : <p name="id"><%=obj_Profile_Bean.getId() %></p><br>
  <button type="submit">Tiep tuc de hoan tat dang nhap</button>
</form>

</body>
</html>