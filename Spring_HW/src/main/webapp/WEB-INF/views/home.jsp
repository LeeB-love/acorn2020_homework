<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
</head>
<body>

<c:choose>
	<c:when test="${empty id }">
		<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
		<a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath }/users/private/info.do">개인정보 보기</a>
		<a href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
<h1>
	Hello world!  
	아아아아아아아ㅏ아아아아아ㅏㅏ 드디어 된다ㅜㅜㅜㅜㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
	ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ
</h1>
	<img src="${pageContext.request.contextPath }/resources/images/우는냥이.jpg">
</body>
</html>
