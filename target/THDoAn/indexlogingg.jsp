<%@ page import="vn.edu.hcmuaf.ttt.service.UserService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>Xác nhận</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="formLoginGg/css/style.css">

	</head>
  <%
	  String id = request.getAttribute("id").toString();

	  String email = request.getAttribute("email").toString();%>
	<body class="img js-fullheight" style="background-image: url(formLoginGg/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Xác nhận đăng nhập bằng Google</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">

		      	<form action="/THDoAn_war/doLogingg" method="post">
		      		<div class="form-group">
						<label name="id1" class="form-control" > ID: <%= id%></label>
						<input class="id" name="id" style="display: none"  value="<%=id%>" type="text">
		      		</div>
	            <div class="form-group">

					<label name="email1" class="form-control">Email: <%= email%></label>
					<input class="email" name="email" style="display: none"   value="<%=email%>" type="text">

	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary px-3"> Tiếp tục để hoàn tất đăng nhập</button>
	            </div>
<%--	            <div class="form-group d-md-flex">--%>
<%--	            	<div class="w-50">--%>
<%--		            	<label class="checkbox-wrap checkbox-primary">Remember Me--%>
<%--									  <input type="checkbox" checked>--%>
<%--									  <span class="checkmark"></span>--%>
<%--									</label>--%>
<%--								</div>--%>
<%--								<div class="w-50 text-md-right">--%>
<%--									<a href="#" style="color: #fff">Forgot Password</a>--%>
<%--								</div>--%>
	            </div>
	          </form>
<%--	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>--%>
<%--	          <div class="social d-flex text-center">--%>
<%--	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>--%>
<%--	          	<a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>--%>
<%--	          </div>--%>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="formLoginGg/js/jquery.min.js"></script>
  <script src="formLoginGg/js/popper.js"></script>
  <script src="formLoginGg/js/bootstrap.min.js"></script>
  <script src="formLoginGg/js/main.js"></script>

	</body>
</html>

