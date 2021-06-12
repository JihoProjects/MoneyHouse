<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<style>
.section-title {
	padding-top: 20px;
}

@media ( max-width : 992px) {
	.section-title {
		padding-top: 10px;
	}
}

tbody>tr {
	cursor: pointer;
}
</style>
<!-- Login JS Start. -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var loginchecksum = localStorage.getItem("logincheck");
		if (loginchecksum == null) {
			var logincheck = {
				"check" : "false"
			}
			logincheck_json = JSON.stringify(logincheck);
			localStorage.setItem("logincheck", logincheck_json);
		} else {
			loginchecksum = JSON.parse(loginchecksum);
			if (loginchecksum.check == "true") {
				$("#button-on").hide();
				$("#button-off").show();
			}
		}
		$("#login_modal").click(function() {
			var account = localStorage.getItem("account");
			if (account == null) {
				$("#idfeed").html("ID�� Ʋ���ϴ�.").css("color", "red");
				return;
			}
			account = JSON.parse(account);
			var localId = account.id;
			var localPass = account.pass;
			var Id = $("#inputId").val();
			var Pass = $("#inputPassword").val();

			if (Id != localId) {
				$("#idfeed").html("ID�� Ʋ���ϴ�.").css("color", "red");
				return;
			} else {
				$("#idfeed").html("");
			}
			if (Pass != localPass) {
				$("#passfeed").html("Password�� Ʋ���ϴ�.").css("color", "red");
				return;
			} else {
				$("#passfeed").html("");
			}
			alert("�α��� ����!!");
			$("#login").modal("hide"); // ���â �ݱ�.
			$("#button-on").hide();
			$("#button-off").show();
			var logincheck = {
				"check" : "true"
			}
			logincheck_json = JSON.stringify(logincheck);
			localStorage.setItem("logincheck", logincheck_json);
		});
		//�α׾ƿ� ���.
		$("#logout").click(function() {
			$("#button-on").show();
			$("#button-off").hide();
			var logincheck = {
				"check" : "false"
			}
			logincheck_json = JSON.stringify(logincheck);
			localStorage.setItem("logincheck", logincheck_json);
			alert("�α׾ƿ� ����!!");
		});

		//��й�ȣ ã�� ���.
		$("#findpass").click(function() {
			location.href = "findPass.html";
		});
		
		//���� ��� ���.
		$("#enroll").click(function(){
			var title = $("#inputTitle").val();
			var content = $("#inputContent").val();
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
			console.log(content);
			var notice = {
					"title" : title,
					"content" : content,
			};
			notice_json = JSON.stringify(notice);
			localStorage.setItem("notice", notice_json);
			alert("���� ��� �Ϸ�");
			location.href = "Notice.html";
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
				<a href="index.html">HAPPY HOUSE</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav class="nav-menu d-none d-lg-block">

				<ul>
					<li class="active"><a href="index.html">���� ����</a></li>

					<li class="drop-down"><a href="#">������ ����</a>
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

					<li><a href="services.html">�ֺ� Ž��</a></li>
					<li><a href="portfolio.html">���� ���� ����</a></li>
					<li><a href="pricing.html">�������� �ѷ�����</a></li>
					<!--   <li><a href="blog.html">Blog</a></li>
          <li><a href="contact.html">Contact</a></li> -->

				</ul>

			</nav>
			<!-- nav-menu -->
			<!-- Login Button start -->
			<div id="button-on" class="col-lg-3 text-right">
				<a href="#login" style="color: white" data-toggle="modal"><button
						type="button" class="btn btn-success">�α���</button></a> <a
					href="Join.html" style="color: white"><button type="button"
						class="btn btn-info">ȸ������</button></a>
			</div>
			<!-- �α��� ���� �������� �κ� -->
			<div id="button-off" class="col-lg-3 text-right"
				style="display: none">
				<a href="" style="color: white" data-toggle="modal">
					<button id="logout" type="button" class="btn btn-danger">�α׾ƿ�</button>
				</a> <a href="Info.html" style="color: white">
					<button type="button" class="btn btn-info">ȸ������</button>
				</a>
			</div>
			<!-- Login Button end -->
		</div>
	</header>
	<!-- End Header -->
	<section id="services" class="services">
		<div class="container">
			<div class="section-title">
				<p>�������� ���</p>
			</div>
			<form class="form-horizontal" action="" method="post">
				<div class="form-group has-feedback row">
					<label for="inputTitle"
						class="col-md-2 control-label text-md-right col-form-label">����
						<span class="text-danger small">:</span>
					</label>
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputTitle"
							placeholder="Title" required="" name="Title"> <i
							class="fa fa-envelope form-control-feedback pr-4"></i>
					</div>
				</div>
				<div class="form-group has-feedback row">
					<label for="inputContent"
						class="col-md-2 control-label text-md-right col-form-label">����
						<span class="text-danger small">:</span>
					</label>
					<div class="col-md-8">
						<textarea class="form-control" id="inputContent" rows="20"
							placeholder="Content" required="" name="Title"></textarea>
					</div>
				</div>
			</form>
			<div class="form-group row justify-content-center">
					<button id="enroll" class="btn btn-group btn-warning btn-animated">
						��� <i class="fa fa-check"></i>
					</button>
			</div>

		</div>
	</section>
	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>Find Us</h3>
							<p>
								(SSAFY) <br> ����� ������ ������� ��Ƽ������<br> <br> <strong>Phone:</strong>1544-9001<br>
								<strong>Email:</strong>admin@ssafy.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
								<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">����
									�ǰŷ��� �˻�</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">����Ʈ��
									�ǰŷ��� �˻�</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">������
									����</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">��������
									�ѷ� ����</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">�ֺ�
									Ž��</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>

					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Happy House</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/sailor-free-bootstrap-theme/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

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
					<h4 class="modal-title">�α���</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="index.html" method="post">
						<div class="form-group has-feedback row">
							<label for="inputId"
								class="col-md-3 control-label text-md-right col-form-label">���̵�
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
								class="col-md-3 control-label text-md-right col-form-label">��й�ȣ
								<span class="text-danger small">*</span>
							</label>
							<div class="col-md-8">
								<input type="password" class="form-control" id="inputPassword"
									placeholder="" required="" name="pw"> <i id="passfeed"
									class="fa fa-pencil form-control-feedback pr-4"></i>
							</div>
						</div>

						<div class="form-group container justify-content-end"
							style="display: flex">
							<button id="findpass" type="button" class="btn btn-warning"
								data-dismiss="modal">��й�ȣ ã��</button>
						</div>

						<div class="modal-footer" style="justify-content: space-between">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							<button id="login_modal" type="button"
								class="btn btn-group btn-animated btn-success">�α���</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- Login modal end-->
</body>

</html>