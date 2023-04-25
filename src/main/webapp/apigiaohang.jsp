<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ShipChung Login</title>
</head>
<body>
<h1>ShipChung Login</h1>
<% if (request.getParameter("error") != null) { %>
<p style="color: red;">Incorrect username or password.</p>
<% } %>
<form method="post" action="login">
  <label>Email:</label>
  <input type="text" name="email"><br>
  <label>Password:</label>
  <input type="password" name="password"><br>
  <input type="submit" value="Login">
</form>
</body>
</html>
