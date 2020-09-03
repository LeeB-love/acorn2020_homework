<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>로그인</h1>
	<form action="login.do" method="post">
		<input type="hidden" name="url" value=${url } />
		<div class="form-group">
			<input type="text" name="id" placeholder="아이디" class="form-control">
		</div>
		<div class="form-group">
			<input type="text" name="pwd" placeholder="비밀번호" class="form-control">
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>
</body>
</html>