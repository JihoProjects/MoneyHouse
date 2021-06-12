<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Happy House</title>
</head>

<body>
<c:import url="common/header.jsp"/>

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

			<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

			<div class="carousel-inner" role="listbox">

				<!-- Slide 1 -->
				<div class="carousel-item active" style="background-image: url(/assets/img/main_img1.png)">
					<div class="carousel-container">
						<div class="container">
							<h2 class="animate__animated animate__fadeInDown">Welcome to <span>HAPPY HOUSE</span></h2>
							<p class="animate__animated animate__fadeInUp">실시간 거래 매물을 확인해보세요~</p>
							<a href="deal" class="btn-get-started animate__animated animate__fadeInUp scrollto">확인하기</a>
						</div>
					</div>
				</div>

				<!-- Slide 2 -->
				<div class="carousel-item"
					style="background-image: url(/assets/img/main_img2.png)">
					<div class="carousel-container">
						<div class="container">
							<h2 class="animate__animated animate__fadeInDown">아파트 검색</h2>
							<p class="animate__animated animate__fadeInUp">실 매물</p>
							<a href="apt" class="btn-get-started animate__animated animate__fadeInUp scrollto">확인하기</a>
						</div>
					</div>
				</div>

				<!-- Slide 3 -->
				<div class="carousel-item"
					style="background-image: url(/assets/img/main_img3.png)">
					<div class="carousel-container">
						<div class="container">
							<h2 class="animate__animated animate__fadeInDown">광명시</h2>
							<p class="animate__animated animate__fadeInUp">현재 관심이 제일 많은 지역</p>
							<a href="#" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
						</div>
					</div>
				</div>
			</div>

			<a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon icofont-simple-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
				<span class="carousel-control-next-icon icofont-simple-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main"> <!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container">

			<div class="row content">
				<div class="col-lg-6">
					<h2>내 집 마련하기</h2>
					<h3>실패를 피하는 가장 확실한 방법은 철저한 공부입니다.</h3>
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0">
					<p></p>
					<ul>
						<li><i class="ri-check-double-line"></i> 매일 부를 키우는 부자 공부법</li>
						<li><i class="ri-check-double-line"></i> 1. 하루 1시간 부자 수업</li>
						<li><i class="ri-check-double-line"></i> 2. 투자 안목을 길러주는
							‘일일삼방’</li>
					</ul>
					<p class="font-italic">실전 투자보다 더 나은 공부는 없다 지금까지 부자 공부법에 대해
						말씀드렸는데요. 소개해드린 방식대로 공부하신다면 이론은 충분하실 거라 생각합니다. 여기서 잠깐! 이론만 공부했다고
						자신의 미래에 대한 책임을 다 한 걸까요? 아닙니다. 실전 투자보다 더 나은 공부는 없습니다. 게다가 부동산은 물가에
						연동해서 우상향하는 성향이 있습니다. 결국 누가 먼저 시작하느냐의 싸움이죠.</p>
				</div>
			</div>

		</div>
	</section>
	<!-- End About Section --> <!-- ======= Clients Section ======= -->
	<section id="clients" class="clients section-bg">
		<div class="container">

			<div class="row">

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-1.png" class="img-fluid" alt="">
				</div>

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-2.png" class="img-fluid" alt="">
				</div>

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-3.png" class="img-fluid" alt="">
				</div>

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-4.png" class="img-fluid" alt="">
				</div>

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-5.png" class="img-fluid" alt="">
				</div>

				<div
					class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
					<img src="/assets/img/clients/client-6.png" class="img-fluid" alt="">
				</div>

			</div>

		</div>
	</section>
	<!-- End Clients Section --> <!-- ======= Services Section ======= -->
	<section id="services" class="services">
		<div class="container">

			<div class="section-title">
				<h2>Service</h2>
				<p>The Services We Offer</p>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="icon-box">
						<i class="icofont-computer"></i>
						<h4>
							<a href="#">실 거래가 확인</a>
						</h4>
						<p>실시간으로 실거래가를 확인 할 수 있는 서비스를 제공합니다.</p>
					</div>
				</div>
				<div class="col-md-6 mt-4 mt-md-0">
					<div class="icon-box">
						<i class="icofont-chart-bar-graph"></i>
						<h4>
							<a href="#">아파트 검색</a>
						</h4>
						<p>주변 아파트를 검색하여서 주변의 시세를 비교 할 수 있게 해줍니다.</p>
					</div>
				</div>

				<div class="col-md-6 mt-4 mt-md-0">
					<div class="icon-box">
						<i class="icofont-settings"></i>
						<h4>
							<a href="#">관심 지역 설정</a>
						</h4>
						<p>내가 관심있는 지역을 설정 하게되면 지도에 관심있는 지역을 위주로 나타나게 됩니다.</p>
					</div>
				</div>
				<div class="col-md-6 mt-4 mt-md-0">
					<div class="icon-box">
						<i class="icofont-earth"></i>
						<h4>
							<a href="#">관심 지역 대기오염 정보</a>
						</h4>
						<p>내가 관심 지역으로 등록해놓은 곳의 대기 오염 정보를 실시간으로 제공합니다.</p>
					</div>
				</div>

			</div>

		</div>
	</section>
	</main>
	<!-- End #main -->

<c:import url="common/footer.jsp"/>
</body>
</html>