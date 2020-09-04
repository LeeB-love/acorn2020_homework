<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	var myApp=angular.module("myApp", []);
	myApp.controller("formCtrl", function($scope, $http){
		
		$scope.originPwdChanged=function(){
			$http({
				url:"checkPwd.do",
				method:"get",
				params:{inputPwd:$scope.originPwd}
			}).success(function(data){
				$scope.myForm.originPwd.$valid = data.isValid;
				$scope.myForm.originPwd.$invalid = !data.isValid;
			});
		}
		
		//변경할 비밀번호 확인
		$scope.newPwdChanged=function(){
			$scope.myForm.newPwd.$valid = $scope.newPwd == $scope.newPwd2;
			$scope.myForm.newPwd.$invalid = $scope.newPwd != $scope.newPwd2;
		}
	})
</script>
</head>
<body>
<div class="container" ng-controller="formCtrl">
	<div class="row" style="margin-top: 30px;">
		<div class="col"></div>
		<div class="col-6">
			<div class="card bg-light mb-3" style="max-width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title text-center">비밀번호 변경</h5>
			    
			    <form action="pwd_update" method="post" name="myForm" novalidate>
			    	<div class="form-group">
			    		<label for="originPwd" style="margin-top: 20px;">현재 비밀번호</label>
			    		<input type="password" id="originPwd" name="originPwd" placeholder="현재 비밀번호" 
			    				style="margin-bottom: 15px;" class="form-control"
			    				ng-model="originPwd"
			    				ng-required="true"
			    				ng-class="{'is-invalid' : myForm.originPwd.$invalid && myForm.originPwd.$dirty, 'is-valid' : myForm.originPwd.$valid}"
			    				ng-change="originPwdChanged()"/>
			    		<div class="invalid-feedback">현재 비밀번호가 일치하지 않습니다.</div>
			    	</div>
			    	
			    	<div class="form-group">
			    		<label for="newPwd">변경할 비밀번호</label>
			    		<input type="password" id="newPwd" name="newPwd" placeholder="새 비밀번호" 
			    				style="margin-bottom: 2px;" class="form-control"
								ng-model="newPwd"
								ng-required="true"
								ng-pattern="/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,20}$/"
								ng-class="{'is-invalid':myForm.newPwd.$invalid && myForm.newPwd.$dirty, 'is-valid':myForm.newPwd.$valid}"		
								ng-change="newPwdChanged()"
			    				/>
			    		<input type="password" id="newPwd2" name="newPwd2" placeholder="새 비밀번호 확인" class="form-control" 
			    				ng-model="newPwd2"
			    				ng-change="newPwdChanged()"/>
			    		<small class="form-text text-muted">영문자,특수문자,숫자를 모두 포함하여 8자 이상, 20자 미만으로 입력할 수 있습니다.</small>
						<div class="invalid-feedback">비밀번호를 확인해주세요</div>
			    	</div>
			    	<button type="reset" class="btn btn-danger" style="margin-top: 10px;">취소</button>
			    	<button type="submit" class="btn btn-primary" style="margin-top: 10px;" ng-disabled="myForm.$invalid">비밀번호 수정</button>
			    </form>
			  </div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
</body>
</html>