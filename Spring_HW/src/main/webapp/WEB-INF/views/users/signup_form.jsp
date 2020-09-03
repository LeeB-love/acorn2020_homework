<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp",[]);
	myApp.controller("formCtrl", function($scope, $http){
		$scope.idChanged=function(){
			$http({
				url:"checkid.do",
				method:"get",
				//controller의 checkid 메소드의 RequestParam으로 들어가는 것
				params:{inputId:$scope.id}
			}).success(function(data){
				//isExist가 true이면 중복되는 아이디가 있으므로 사용불가
				$scope.myForm.id.$invalid = data.isExist;
				//isExist가 false면 사용가능
				$scope.myForm.id.$valid = !data.isExist;
			})
		}
		
		//비밀번호 확인
		$scope.pwdChanged=function(){
			$scope.myForm.pwd.$valid = $scope.pwd==$scope.pwd2;
			$scope.myForm.pwd.$invalid = $scope.pwd!=$scope.pwd2;
		}
	})
</script>
</head>
<body>
<div class="container" ng-controller="formCtrl">
	<h1 style="margin-bottom: 40px; margin-top: 30px;">|회원가입|</h1>
	
	<form action="signup.do" method="post" name="myForm" novalidate>
		
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" placeholder="아이디..." class="form-control"
					ng-model="id"
					ng-required="true"
					ng-pattern="/^[0-9A-Za-z].{4,16}$/"
					ng-class="{'is-invalid': myForm.id.$invalid && myForm.id.$dirty,'is-valid': myForm.id.$valid}"
					ng-change="idChanged()"
			/>
			<small class="form-text text-muted">4자 이상 16자 이하의 영소문자,대문자,숫자만 입력할 수 있습니다.</small>
			<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
		</div>
		
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호..." class="form-control"
					ng-model="pwd"
					ng-required="true"
					ng-pattern="/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,20}$/"
					ng-class="{'is-invalid':myForm.pwd.$invalid && myForm.pwd.$dirty, 'is-valid':myForm.pwd.$valid}"		
					ng-change="pwdChanged()"
			/>
			<small class="fomr-text text-muted">영문자,특수문자,숫자를 모두 포함하여 8자 이상, 20자 미만으로 입력할 수 있습니다.</small>
			<div class="invalid-feedback">비밀번호를 확인해주세요</div>
			
			<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인..." class="form-control" 
					ng-model="pwd2"
					ng-change="pwdChanged()"
			/>
		</div>
		
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" placeholder="이메일@domain.com" class="form-control"
				ng-model="email"
				ng-required="true"
				ng-pattern="/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i"
				ng-class="{'is-invalid':myForm.email.$invalid && myForm.email.$dirty, 'is-valid':myForm.email.$valid}"
			/>
			<div class="invalid-feedback">이메일 형식에 맞게 입력해주세요. (ex)아이디@naver.com)</div>
		</div>
		
		<button type="submit" class="btn btn-primary" ng-disabled="myForm.$invalid">회원가입</button>
		<button type="reset" class="btn btn-danger">취소</button>
	</form>
</div>
</body>
</html>