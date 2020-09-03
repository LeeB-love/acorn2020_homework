<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width: 100px;
		height: 100px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<div class="container">
	<h1 style="margin-top: 30px;">|개인정보|</h1>
	<div class="row" style="margin-top: 30px;">
		<div class="col"></div>
		<div class="col-6">
			<table id="table">
				<tr>
					<td colspan="2" style="text-align: center; height: 150px;">
						<c:choose>
							<c:when test="${empty dto.profile }">
									<svg id="profileImage"  width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  							<path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
							</c:when>
							<c:otherwise>
								<img id="profileImage" src="${pageContext.request.contextPath }${dto.profile }"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><a href="pwd_updateform.do">수정하기</a></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${dto.regdate }</td>
				</tr>
			</table>
			<a href="updateform.do"><button class="btn btn-info">개인정보 수정</button></a>
			<a href="javascript:deleteConfirm()"><button class="btn btn-danger">회원탈퇴</button></a>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>