<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Sailor Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Sailor - v2.3.1
  * Template URL: https://bootstrapmade.com/sailor-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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
<!-- Login JS Start. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//로그아웃 기능.
		$("#logout").click(function(){
			location.href="logout.mvc";
			alert("로그아웃 성공!!");
		});
		$("#modify").click(function(){
			location.href="modify.mvc";
		});
		$("#delete").click(function(){
			location.href="delete.mvc";
		});
	});
</script>
<!-- Login JS End -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo">
				<a href="index.mvc">HAPPY HOUSE</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav class="nav-menu d-none d-lg-block">

				<ul>
					<li class="active"><a href="index.html">공지 사항</a></li>

					<li class="drop-down"><a href="#">오늘의 뉴스</a>
						<ul>
							<li><a href="about.html">About Us</a></li>
							<li><a href="team.html">Team</a></li>
							<li><a href="testimonials.html">Testimonials</a></li>

							<li class="drop-down"><a href="#">Deep Drop Down</a>
								<ul>
									<li><a href="#">Deep Drop Down 1</a></li>
									<li><a href="#">Deep Drop Down 2</a></li>
									<li><a href="#">Deep Drop Down 3</a></li>
									<li><a href="#">Deep Drop Down 4</a></li>
									<li><a href="#">Deep Drop Down 5</a></li>
								</ul></li>
						</ul></li>

					<li><a href="services.html">주변 탐방</a></li>
					<li><a href="portfolio.html">관심 지역 설정</a></li>
					<li><a href="pricing.html">관심지역 둘러보기</a></li>
					<!--   <li><a href="blog.html">Blog</a></li>
          <li><a href="contact.html">Contact</a></li> -->

				</ul>

			</nav>
			<!-- nav-menu -->
			<!-- Login Button start -->
			<c:if test="${empty id}">
						<div id="button-on" class="col-lg-3 text-right">
							<a href="#login" style="color: white" data-toggle="modal"><button
									type="button" class="btn btn-success">로그인</button></a> <a
								href="join.mvc" style="color: white"><button type="button"
									class="btn btn-info">회원가입</button></a>
						</div>
			</c:if>
			
			<c:if test="${!empty id}">
						<div id="button-off" class="col-lg-3 text-right">
							<a href="" style="color: white" data-toggle="modal">
								<button id="logout"	type="button" class="btn btn-danger">로그아웃</button>
							</a>
							<a href="Info.html" style="color: white">
								<button type="button" class="btn btn-info">회원정보</button>
							</a>
						</div>
			</c:if>
			<!-- Login Button end -->
		</div>
	</header>
	<!-- End Header -->
	<!-- JoinForm Start -->
	<section id="hero">
		<nav id="loc_nav" class="container" aria-label="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.mvc">Home</a></li>
				<li class="breadcrumb-item active aria-current="">Info</li>
			</ol>
		</nav>

		<div class="form-block container justify-config-center" style="background-color:#e6e6e6; padding:10px; border-radius: 1rem">
			<h2 style="color:black" class="title">회원 정보</h2>

			<form class="form-horizontal" action="#" method="post">
				<div class="form-group has-feedback row">
					<label for="inputId"
						class="col-md-3 control-label text-md-right col-form-label">아이디
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<h3 id="id">${u.getId() }</h3>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">비밀번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<h3 id="pass">${u.getPw() }</h3>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputUserName"
						class="col-md-3 control-label text-md-right col-form-label">이름
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<h3 id="name">${u.getName() }</h3>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputEmail"
						class="col-md-3 control-label text-md-right col-form-label">주소
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<h3 id="address">${u.getAddress() }</h3>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputPassword"
						class="col-md-3 control-label text-md-right col-form-label">전화번호
						<span class="text-danger small">*</span>
					</label>
					<div class="col-md-8">
						<h3 id="tel">${u.getPhone() }</h3>
					</div>
				</div>
			</form>
			<div class="row justify-content-around">
					<button id="check" style="width:30%;justify-content:center;" class="btn btn-group btn-primary btn-animated">
						확인
					</button>
					<button id="modify" style="width:30%;justify-content:center;" class="btn btn-group btn-warning btn-animated">
						수정
					</button>
					<button id="delete" style="width:30%;justify-content:center;" class="btn btn-group btn-danger btn-animated">
						삭제
					</button>
			</div>
		</div>
	</section>
	<!-- JoinForm end -->
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<!-- Login modal start -->
	<div id="login" class="modal fade">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				<form action="login.mvc" id="f" method="post">	
				
 					<form class="form-horizontal" action="login.mvc" method="post">
						<div class="form-group has-feedback row">
							<label for="inputId"
								class="col-md-3 control-label text-md-right col-form-label">아이디
								<span class="text-danger small">*</span>
							</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="inputId"
									placeholder="" required="" name="id"> <i id="idfeed"
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
									placeholder="" required="" name="pw"> <i id="passfeed"
									class="fa fa-pencil form-control-feedback pr-4"></i>
							</div>
						</div>
						
						<div class="form-group container justify-content-end" style="display:flex">
							<button id="findpass" type="button" class="btn btn-warning" data-dismiss="modal">비밀번호 찾기</button>
						</div>
						
						<div class="modal-footer" style="justify-content: space-between">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-group btn-animated btn-success">로그인</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- Login modal end-->

</body>

</html>l>