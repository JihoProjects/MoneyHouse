<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Contact - Sailor Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Sailor - v2.3.1
  * Template URL: https://bootstrapmade.com/sailor-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
   
<!-- Login JS Start. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
				 var loadFavoriteArea = localStorage.getItem("favoriteArea");
				loadFavoriteArea = JSON.parse(loadFavoriteArea);
				var city = loadFavoriteArea.city; 
				var gu = loadFavoriteArea.gu; 
				var dong = loadFavoriteArea.dong; 
					if(city!="all"){
						$("#favoritecity").html(city);
						$("#favoritegu").html(gu);
					}else
					{
							alert("관심 지역을 설정 해주세요");
					} 
				}else
					{
						alert("로그인 해주세요")
					}
			}
		
		$("#login_modal").click(function() {
			var account = localStorage.getItem("account");
			if(account == null){
				$("#idfeed").html("ID가 틀립니다.").css("color", "red");
				return;
			}
			account = JSON.parse(account);
			var localId = account.id;
			var localPass = account.pass;
			var Id = $("#inputId").val();
			var Pass = $("#inputPassword").val();

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
		
		//비밀번호 찾기 기능.
		$("#findpass").click(function(){
			location.href = "findPass.html";
		});
		
		
	});
</script>
<!-- Login JS End -->
</head>

<body>
	
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo"><a href="index.html">HAPPY HOUSE</a></h1>
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
                </ul>
              </li>
            </ul>
          </li>

          <li><a href="services.html">주변 탐방</a></li>
          <li><a href="portfolio.html">관심 지역 설정</a></li>
          <li><a href="pricing.html">관심지역 둘러보기</a></li>
        <!--   <li><a href="blog.html">Blog</a></li>
          <li><a href="contact.html">Contact</a></li> -->

        </ul>

      </nav><!-- .nav-menu -->

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
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>관심 지역 상가 정보</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>관심 지역 상가 정보</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
      
  
    <!-- ======= Contact Section ======= -->
    <section style ="padding : 20px; " id="contact" class="contact" >
      <div class="container">

        <div>
          <iframe style=" border:0; width: 100%; height: 500px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
        </div>

        <div class="row mt-5">

          <!-- <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>A108 Adam Street, New York, NY 535022</p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div> -->
          <aside class="col-lg-6 order-lg-6">
              <div class="sidebar">
                <div class="block clearfix" id="houseInfo">
                  <h3 class="title">관심 지역</h3>
                  <h4 id=favoritecity style = > </h4>
                  <h4 id=favoritegu> </h4>
                  <div class="separator-2"></div>
                  
                  
                  <hr>
                  
                </div>
              </div>
            </aside>

          <!-- <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div> -->

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

   <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Find Us</h3>
              <p>
                (SSAFY) <br>
          		서울시 강남구 테헤란로 멀티스퀘어<br><br>
                <strong>Phone:</strong>1544-9001<br>
                <strong>Email:</strong>admin@ssafy.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">동별 실거래가 검색</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">아파트별 실거래가 검색</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">오늘의 뉴스</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">관심지역 둘러 보기</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">주변 탐방</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Happy House</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/sailor-free-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

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
					<form class="form-horizontal" action="index.html" method="post">
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