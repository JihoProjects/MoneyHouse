<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var loginchecksum = localStorage.getItem("logincheck");
		if(loginchecksum == null){
			var logincheck = {
					"check" : "false"
			}
			logincheck_json = JSON.stringify(logincheck);
		}
		else{
			loginchecksum = JSON.parse(loginchecksum);
			if(loginchecksum.check == "true"){
				$("#button-on").hide();
				$("#button-off").show();
			}
		}
		$("#login_modal").click(function() {
			var account = localStorage.getItem("account");
			account = JSON.parse(account);
			var localId = account.id;
			var localPass = account.pass;
			var Id = $("#modal_inputId").val();
			var Pass = $("#modal_inputPassword").val();
			if (Id != localId) {
				$("#idfeed").html("ID가 틀립니다.").css("color", "red");
				return;
			} else {
				$("#idfeed").html("");
			}
			if (Pass != localPass) {
				$("#passfeed").html("Password가 틀립니다.").css("color", "red");
				return;
			} else {
				$("#passfeed").html("");
			}
			alert("로그인 성공!!");
			$("#login").modal("hide"); // 모달창 닫기.
			$("#button-on").hide();
			$("#button-off").show();
			var logincheck = {
					"check" : "true"
			}
			logincheck_json = JSON.stringify(logincheck);
			localStorage.setItem("logincheck", logincheck_json);
		});
		//로그아웃 기능.
		$("#logout").click(function(){
			$("#button-on").show();
			$("#button-off").hide();
			var logincheck = {
					"check" : "false"
			}
			logincheck_json = JSON.stringify(logincheck);
			localStorage.setItem("logincheck", logincheck_json);
			alert("로그아웃 성공!!");
		});
		
		$("#favorite_join").click(function(){
			
			var loginchecksum = localStorage.getItem("logincheck");
			loginchecksum = JSON.parse(loginchecksum);
			console.log(loginchecksum.check);
			
			if(loginchecksum.check == "true"){
			var city = $("#city").val(); 
			var gu = $("#gu").val(); 
			var dong = $("#dong").val(); 

			console.log(city + gu + dong);
			
			if(city == "all" || gu == "all" || dong == "all" ){
				//return;
			}
			//다 있을 시 관심 지역 설정
			var favoriteArea = {
				"city" : city,
				"gu" : gu,
				"dong" : dong,
			};
			
			var favoriteArea_json = JSON.stringify(favoriteArea);
			
			localStorage.setItem("favoriteArea", favoriteArea_json);
			
			alert("관심 지역 설정 되었습니다.");
			
			location.href="index.html";
			
			}else{
				
				alert("로그인 해주세요.");
			}
		})
	});
</script>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo">
				<a href="index.html">HAPPY HOUSE</a>
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
			<div id="button-on" class="col-lg-3 text-right">
				<a href="#login" style="color: white" data-toggle="modal"><button
						type="button" class="btn btn-success">로그인</button></a> <a
					href="Join.html" style="color: white"><button type="button"
						class="btn btn-info">회원가입</button></a>
			</div>
			<!-- 로그인 이후 보여지는 부분 -->
			<div id="button-off" class="col-lg-3 text-right" style="display: none">
				<a href="" style="color: white" data-toggle="modal">
					<button id="logout"	type="button" class="btn btn-danger">로그아웃</button>
				</a>
				<a href="Info.html" style="color: white">
					<button type="button" class="btn btn-info">회원정보</button>
				</a>
			</div>
			<!-- Login Button end -->
		</div>
	</header>
	<!-- End Header -->
  <!-- JoinForm Start -->
	<section id="hero">
		<nav id="loc_nav" class="container" aria-label="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active aria-current="">Join</li>
			</ol>
		</nav>

		<div class="form-block container justify-config-center" style="background-color:#e6e6e6; padding:10px; border-radius: 1rem">
			<h2 style="color:black" class="title">관심 지역 설정</h2>

			     <form class="form-horizontal" id="frm"  ><!-- action="searchRecentHouseDeal.do -->
			  <!-- <input type="hidden" id="code"  name="code" value="code"/> -->
              <div class="form-group md row">
                <select class="form-control" name="city" id="city">
                		<option value="all" >도/광역시</option>
                  <option value="서울특별시" >서울시</option>
                  <option value="경기도" >경기도</option>
                  <option value="인천광역시" >인천광역시</option>
                  <option value="부산광역시" >부산광역시</option>
                  <option value="대전광역시" >대전광역시</option>
                  <option value="대구광역시" >대구광역시</option>
                  <option value="울산광역시" >울산광역시</option>
                  <option value="세종특별자치시" >세종시</option>
                  <option value="광주광역시" >광주광역시</option>
                  <option value="강원도" >강원도</option>
                  <option value="충청북도" >충청북도</option>
                  <option value="경상북도" >경상북도</option>
                  <option value="경상남도" >경상남도</option>
                  <option value="전라북도" >전라북도</option>
                  <option value="전라남도" >전라남도</option>
                  <option value="제주특별자치도" >제주도</option>
                </select>
              </div>
              <div class="form-group md-1">
                <select class="form-control row" name="dongcode" id="gu">
                  <option value="all" >시/구/군</option>
                  <option value="도봉구">도봉구</option>
				  <option value="은평구">은평구</option>
				  <option value="동대문구">동대문구</option>
										        <option value="동작구">동작구</option>
										        <option value="금천구">금천구</option>
										        <option value="구로구">구로구</option>
										        <option value="종로구">종로구</option>
										        <option value="강북구">강북구</option>
										        <option value="중랑구">중랑구</option>
										        <option value="강남구">강남구</option>
										        <option value="강서구">강서구</option>
										        <option value="중구">중구</option>
										        <option value="강동구">강동구</option>
										        <option value="광진구">광진구</option>
										        <option value="마포구">마포구</option>
										        <option value="서초구">서초구</option>
										        <option value="성북구">성북구</option>
										        <option value="노원구">노원구</option>
										        <option value="송파구">송파구</option>
										        <option value="서대문구">서대문구</option>
										        <option value="양천구">양천구</option>
										        <option value="영등포구">영등포구</option>
										        <option value="관악구">관악구</option>
										        <option value="성동구">성동구</option>
										        <option value="용산구">용산구</option>
                </select>
              </div>
              <div class="form-group md-1 row">
                <select class="form-control" name="dong" id="dong">
                  <option value="all" >동</option>
                </select>
              </div>
              <div class="form-group row justify-content-center">
					<button id="favorite_join" class="btn btn-group btn-warning btn-animated">
						등록 <i ></i><!-- class="fa fa-check" -->
					</button>
				</div>
            </form>
		</div>
	</section>
	<!-- JoinForm end -->
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
					<form class="form-horizontal" action="index.html" method="post">
						<div class="form-group has-feedback row">
							<label for="modal_inputId"
								class="col-md-3 control-label text-md-right col-form-label">아이디
								<span class="text-danger small">*</span>
							</label>
							<div class="col-md-8">
								<input type="text" class="form-control" id="modal_inputId"
									placeholder="" required="" name="id"> <i id="idfeed"
									class="fa fa-pencil form-control-feedback pr-4"></i>
							</div>
						</div>
						<div class="form-group has-feedback row">
							<label for="mocal_inputPassword"
								class="col-md-3 control-label text-md-right col-form-label">비밀번호
								<span class="text-danger small">*</span>
							</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="modal_inputPassword"
									placeholder="" required="" name="pw"> <i id="passfeed"
									class="fa fa-pencil form-control-feedback pr-4"></i>
							</div>
						</div>

						<div class="modal-footer" style="justify-content: space-between">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							<button id="login_modal" type="button"
								class="btn btn-group btn-animated btn-success">로그인</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- Login modal end-->
</body>
</html>