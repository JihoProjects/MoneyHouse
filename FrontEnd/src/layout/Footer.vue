<!--
<<< FOOTER >>>

웹페이지의 꼬리말로 footer에는 회사명 정책, 전화번호 , 주소 , copyright등을 표시합니다..


@author jjw9551@naver.com
-->
<template>
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>Find Us</h3>
							<p>
								<b-icon-building class="mx-2"/>서울시 강남구 테헤란로 멀티스퀘어<br>
								<b-icon-telephone-fill class="mx-2"/>1544-9001<br>
								<b-icon-mailbox class="mx-2"/>admin@ssafy.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><b-icon-twitter/></a>
								<a href="#" class="facebook"><b-icon-facebook/></a>
								<a href="#" class="instagram"><b-icon-instagram/></a>
								<a href="#" class="google-plus"><b-icon-google/></a>
								<a href="#" class="linkedin"><b-icon-linkedin/></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li>
								<b-icon-chevron-right/>
								<a href="/">Home</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">About us</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">Services</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">Terms of service</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">Privacy policy</a>
							</li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li>
								<b-icon-chevron-right/>
								<a href="#">동별 실거래가 검색</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">아파트별 실거래가 검색</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">오늘의 뉴스</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">관심지역 둘러 보기</a>
							</li>
							<li>
								<b-icon-chevron-right/>
								<a href="#">주변 탐방</a>
							</li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
						<form action="" method="post">
							<input type="email" name="email" /><input type="submit" value="Subscribe" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong>Happy House</strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/sailor-free-bootstrap-theme/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> & Jiho & Jaewoo
			</div>
		</div>
	</footer>
</template>

<script>
export default {};
</script>

<style scope>
.footer-links li {
	text-decoration: none;
}
</style>
