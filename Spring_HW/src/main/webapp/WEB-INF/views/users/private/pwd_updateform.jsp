<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<div class="row" style="margin-top: 30px;">
		<div class="col"></div>
		<div class="col-6">
			<div class="card bg-light mb-3" style="max-width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title">비밀번호 변경</h5>
			    
			    <form action="pwd_update">
			    	<input type="password" name="originPwd" placeholder="현재 비밀번호"/>
			    	<input type="password" name="newPwd" placeholder="새 비밀번호" />
			    	<input type="password" name="newPwd2" placeholder="새 비밀번호 확인" />
			    </form>
			    
			  </div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>