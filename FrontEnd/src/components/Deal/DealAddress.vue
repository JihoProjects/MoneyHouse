<template>
	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs mt-0">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2>거래 정보</h2>
					<ol>
						<li><a href="/">Home</a></li>
						<li>거래 정보</li>
					</ol>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!--지역 검색 을 위한 검색 창 -->
		<div class="dark-bg section" style="padding: 20px; background-color: #f2f2f2">
			<!-- filters start -->
			<b-form id="form">
				<!-- <input type="hidden" id="code"  name="code" value="code"/> -->
				<b-contatiner>
					<b-row class="d-flex justify-content-center">
						<b-col md="2" class="ml-auto">
							<div class="form-group">
								<select class="form-control" name="city" id="city" v-model="city" @change="cityChange">
									<option v-for="op in options" :key="op" :value="op.value">{{op.content}}</option>
								</select>
							</div>
						</b-col>
						<b-col md="2" class="ml-auto">
							<div class="form-group">
								<select class="form-control" name="gu" id="gu" v-model="gu" @change="guChange">
									<option value="all">시/구/군</option>
									<option v-for="item in gus" :key="item">{{ item }}</option>
								</select>
							</div>
						</b-col>
						<b-col md="2" class="ml-auto">
							<div class="form-group">
								<select class="form-control" name="dong" id="dong" v-model="dong" @change="dongChange">
									<option value="all">동</option>
									<option v-for="item in dongs" :key="item">{{ item }}</option>
								</select>
							</div>
						</b-col>
					</b-row>
				</b-contatiner>
			</b-form>
			<!-- filters end -->
		</div>
		<!--지역 검색 을 위한 검색 창 end-->

		<!-- ======= Contact Section ======= -->
		<section style="padding: 20px" id="contact" class="contact">
			<b-container>
				<b-row>
					<b-col>
						<!-- Kakao Map -->
						<div id="map"></div>
					</b-col>
					<!-- SELECTED ITEM START -->
					<b-col cols="4" v-if="selectedItem != null" id="selectedItem">
						<!-- selectedItem 초기값은 null. 매물 클릭 시 값 갱신되어 화면에 렌더링 된다. -->
						<h3 class="my-3 text-center">{{selectedItem.aptname}}</h3>
						<p class="my-3 text-center">
							<!-- 매물마다 설명이나 이미지가 있으면 추가할 수 있다는 여지의 공간 -->
							✨서울의 자존심
							<strong>{{selectedItem.aptname}}</strong>입니다✨
						</p>
						<b-container>
							<b-row class="my-5">
								<b-col>
									<b-icon-cash-stack variant="warning"/>
									거래 금액
								</b-col>
								<b-col>
									{{ selectedItem.dealamount }} 만 원
								</b-col>
							</b-row>
							<b-row class="my-5">
								<b-col>
									<b-icon-arrows-move variant="info"/>
									매물 면적
								</b-col>
								<b-col>
									{{ reduceZero(selectedItem.area) }} ㎡
									({{squareMeterToPyeong(selectedItem.area)}} 평)
								</b-col>
							</b-row>
							<b-row class="my-5">
								<b-col>
									<b-icon-calendar2-check variant="primary"/>
									거래 년도
								</b-col>
								<b-col>{{ selectedItem.dealyear }} 년</b-col>
							</b-row>
						</b-container>
					</b-col>
					<!-- SELECTED ITEM END -->
				</b-row>

				<b-row id="result" class="mt-5">
					<aside class="col-lg-12 order-lg-12">
						<div class="sidebar">
							<h3 class="title">검색 결과</h3>
							<p>클릭하면 해당 지도로 이동합니다😊</p>
							<p v-if="selectedArea != null">
								<strong>"{{selectedArea}}"</strong>
								지역 검색 결과입니다😎
							</p>
							<hr class="my-3">
							<b-row>
								<b-col cols="4" v-for="house in houseDeal" :key="house.no">
									<b-card class="my-2" id="houseInfo" @click="clickItem(house)">
										<div class="media margin-clear">
											<div class="media-body">
												<h4 class="mb-3">{{ house.aptname }}</h4>
												<b-container>
													<b-row class="my-2">
														<b-col>
															<b-icon-cash-stack variant="warning"/>
															거래 금액
														</b-col>
														<b-col>
															{{ house.dealamount }} 만 원
														</b-col>
													</b-row>
													<b-row class="my-2">
														<b-col>
															<b-icon-arrows-move variant="info"/>
															매물 면적
														</b-col>
														<b-col>
															{{ reduceZero(house.area) }} ㎡
															({{squareMeterToPyeong(house.area)}} 평)
														</b-col>
													</b-row>
													<b-row class="my-2">
														<b-col>
															<b-icon-calendar2-check variant="primary"/>
															거래 년도
														</b-col>
														<b-col>{{ house.dealyear }} 년</b-col>
													</b-row>
												</b-container>
											</div>
										</div>
									</b-card>
								</b-col>
							</b-row>
							<h3 v-if="houseDeal.length == 0">현재 매물이 존재 하지 않습니다.</h3>
						</div>
					</aside>
				</b-row>
			</b-container>
		</section>
		<!-- End Contact Section -->
	</main>
	<!-- End #main -->
</template>

<script>
// 인포윈도우를 여는 클로저를 만드는 함수
function makeOverListener(map, marker, infowindow) {
	return function () {
		console.log(infowindow);
		infowindow.open(map, marker);
	};
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다
function makeOutListener(infowindow) {
	return function () {
		infowindow.close();
	};
}

// var map = new window.kakao.maps.Map(container, options);
export default {
	data() {
		return {
			options: [
				{value: "all"           , content: "도/광역시" },
				{value: "서울특별시"    , content: "서울시"    },
				{value: "경기도"        , content: "경기도"    },
				{value: "인천광역시"    , content: "인천광역시"},
				{value: "부산광역시"    , content: "부산광역시"},
				{value: "대전광역시"    , content: "대전광역시"},
				{value: "대구광역시"    , content: "대구광역시"},
				{value: "울산광역시"    , content: "울산광역시"},
				{value: "세종특별자치시", content: "세종시"    },
				{value: "광주광역시"    , content: "광주광역시"},
				{value: "강원도"        , content: "강원도"    },
				{value: "충청북도"      , content: "충청북도"  },
				{value: "경상북도"      , content: "경상북도"  },
				{value: "경상남도"      , content: "경상남도"  },
				{value: "전라북도"      , content: "전라북도"  },
				{value: "전라남도"      , content: "전라남도"  },
				{value: "제주특별자치도", content: "제주도"    },
			],
			city: "all",
			gu: "all",
			dong: "all",
			map: null,
			selectedItem: null,
		};
	},
	//데이터가 변경될 때 마다 데이터를 가져오는 곳
	computed: {
		gus() {
			return this.$store.state.gus;
		}, // 구,군 정보를 가지고 온다.
		dongs() {
			return this.$store.state.dongs;
		}, //동의 정보를 가져온다.
		houseDeal() {
			return this.$store.state.houseDeal;
		}, //매물의 정보를 가져온다.
		baseAddress() {
			return this.$store.state.baseAddress;
		},
		makers() {
			return this.$store.state.makers;
		},
		selectedArea() {
			if (this.city == "all" || this.gu == "all" || this.dong == "all") {
				return null;
			} else {
				return this.city + " " + this.gu + " " + this.dong;
			}
		}
	},
	watch: {
		baseAddress: function () {
			//console.log(this.baseAddress);
			//console.log(this.baseAddress[0].lat);
			var moveLatLon = new kakao.maps.LatLng(this.baseAddress[0].lat, this.baseAddress[0].lng);
			this.map.setCenter(moveLatLon);
		},
		makers: function () {
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			var imageSize = new kakao.maps.Size(24, 35);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			console.log(this.makers);
			var map = this.map;
			this.makers.forEach(function (pos) {
				var latlng = new kakao.maps.LatLng(pos.lat, pos.lng);
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: latlng, // 마커의 위치
					image: markerImage,
				});
				console.log(pos.aptname);
				var infowindow = new kakao.maps.InfoWindow({
					content: pos.aptname, // 인포윈도우에 표시할 내용
				});
				kakao.maps.event.addListener(
					marker,
					"mouseover",
					makeOverListener(map, marker, infowindow)
				);
				kakao.maps.event.addListener(marker, "mouseout", makeOutListener(infowindow));
			});
		},
	},

	//#city,gu,dong에서 select된 값이 변경되게 되면
	//city->gu , gu -> dong, dong -> apt를 찾는다.
	methods: {
		cityChange() {
			this.$store.dispatch("cityChange", { city: this.city }); //dispatch -> action을 call
		},
		guChange() {
			this.$store.dispatch("guChange", { gu: this.gu });
		},
		dongChange() {
			this.$store.dispatch("dongChange", { dong: this.dong });
			this.$store.dispatch("locationDongSearch", { dong: this.dong });
			this.$store.dispatch("locationAptSearch", { dong: this.dong });
			// Scroll 검색 결과 목록으로 이동
			var menuHeight = document.querySelector("#header").offsetHeight;
			var location = document.querySelector("#result").offsetTop;
			window.scrollTo({top:location - menuHeight, behavior:'smooth'});
		},
		initMap() {
			var container = document.getElementById("map");
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 4,
			};

			this.map = new kakao.maps.Map(container, options);
			this.map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
		},
		///////////////////////////////////////////////////////////
		/////////////////////// 기 타 기 능 ///////////////////////
		///////////////////////////////////////////////////////////
		/**
		 * DB에서 읽은 면적을 일의 자리까지 올림합니다.
		 * DB 및 Server에서 전처리 하면 좋겠지만, 일단 front에서 조작합니다.
		 */
		reduceZero(area) {
			// 올림 후 정수로 반환
			return Math.ceil(area);
		},
		/**
		 * '제곱미터'를 '평'으로 계산하여 반환합니다.
		 * computed에서 처리하는 게 맞지만, 구조상의 어려움으로 method로 구현했습니다.
		 */
		squareMeterToPyeong(area) {
			// 올림 후 정수로 반환
			return Math.ceil(area / 3.306);
		},
		clickItem(house) {
			// Scroll 지도로 이동
			var menuHeight = document.querySelector("#header").offsetHeight;
			var location = document.querySelector("#map").offsetTop;
			window.scrollTo({top:location - menuHeight, behavior:'smooth'});
			// 선택한 매물을 갱신합니다.
			this.selectedItem = house;
		}
	},
	mounted() {
		if (window.kakao && window.kakao.maps) {
			this.initMap();
		} else {
			const script = document.createElement("script");
			/* global kakao */
			script.onload = () => kakao.maps.load(this.initMap);
			script.src =
				"http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=142588d6f4b95600bdd45586fba803a7";
			document.head.appendChild(script);
		}
	},
};
</script>

<style>
#map {
	width: 100%;
	height: 600px;
}
</style>
