<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>회원가입</title>

<style type="text/css">
#loc_nav {
	padding-top: 20px;
}

@media ( max-width : 992px) {
	#loc_nav {
		padding-top: 0px;
	}
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//로그아웃 기능.
		$("#logout").click(function(){
			location.href="logout.mvc";
			alert("로그아웃 성공!!");
		});
		
		//비밀번호 찾기 기능.
		$("#findpass").click(function(){
			location.href = "findPass.html";
		});
		
		$("#join").click(function(){

			if(id == "" || pass == "" || name == "" || email == "" || tel == ""){
				return;
			}
			alert("계정 생성이 완료되었습니다.");
			location.href="joinButton.mvc";
		});
	});

</script>

</head>
<body>
<c:import url="common/header.jsp"/>

  <!-- JoinForm Start -->
	<section id="hero">
		<nav id="loc_nav" class="container" aria-label="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Home</a></li>
				<li class="breadcrumb-item active aria-current="">Join</li>
			</ol>
		</nav>

		<div class="form-block container justify-config-center" style="background-color:#e6e6e6; padding:10px; border-radius: 1rem">
			<h2 style="color:black" class="title">회원 가입</h2>

			<form class="form-horizontal" action="join" method="post">
				<div class="form-group has-feedback row">
					<label for="inputId"
						class="col-md-3 control-label text-md-right col-form-label">아이디
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputId"
							placeholder="" required="" name="id"> <i
							class="fa fa-pencil form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">비밀번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="영문 숫자 포함 6자리 이상" required="" name="pw"> <i
							class="fa fa-pencil form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputUserName"
						class="col-md-3 control-label text-md-right col-form-label">이름
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputUserName"
							placeholder="User Name" required="" name="name"> <i
							class="fa fa-user form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputEmail"
						class="col-md-3 control-label text-md-right col-form-label">주소
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="address" required="" name="addr"> <i
							class="fa fa-envelope form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">전화번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputTel"
							placeholder="010-xxxx-xxxx" required="" name="tel"> <i
							class="fa fa-lock form-control-feedback pr-4"></i>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<button id="join" class="btn btn-group btn-warning btn-animated">
						등록 <i class="fa fa-check"></i>
					</button>
				</div>
			</form>
		</div>
	</section>
	<!-- JoinForm end -->

<c:import url="common/footer.jsp"/>
</body>
</html>