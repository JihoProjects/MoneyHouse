<template>
    <b-carousel
        id="carousel"
        fade
        controls
        indicators
        img-width="1024"
        img-height="480"
    >
        <b-carousel-slide>
            <template #img>
                <img
                    class="d-block img-fluid w-100"
                    width="1024"
                    height="480"
                    src="@/assets/img/main_img1.png"
                    alt="image slot"
                >
            </template>
            <div class="banner-container">
                <h1>Welcome to MONEY HOUSE</h1>
                <p>실시간 거래 매물을 확인해보세요</p>
                <b-button variant="danger" class="m-2" href="/dealAddress">확인하기</b-button>
            </div>
        </b-carousel-slide>
        <b-carousel-slide>
            <template #img>
                <img
                    class="d-block img-fluid w-100"
                    width="1024"
                    height="480"
                    src="@/assets/img/main_img2.png"
                    alt="image slot"
                >
            </template>
            <div class="banner-container">
                <h1>아파트 검색</h1>
                <p>실시간 매물</p>
                <b-button variant="danger" class="m-2" href="/dealName">확인하기</b-button>
            </div>
        </b-carousel-slide>
        <b-carousel-slide>
            <template #img>
                <img
                    class="d-block img-fluid w-100"
                    width="1024"
                    height="480"
                    src="@/assets/img/main_img3.png"
                    alt="image slot"
                >
            </template>
            <div class="banner-container">
                <h1>광명시</h1>
                <p>현재 관심이 제일 많은 지역</p>
                <b-button variant="danger" class="m-2" href="/board">확인하기</b-button>
            </div>
        </b-carousel-slide>
    </b-carousel>
</template>

<script>
export default {}
</script>

<style scope>
/* SCOPE로 처리 */

/* Carousel의 control들이 조정이 안 돼서 CSS를 직접 적용 */
.carousel-control-prev .sr-only {
    display: none;
}
.carousel-control-prev .carousel-control-prev-icon {
    margin-right: 100px;
}

.carousel-control-next .sr-only {
    display: none;
}
.carousel-control-next .carousel-control-next-icon {
    margin-right: -100px;
}

/* Carousel 내용 조정 */
.carousel-item {
    background-color: black;
}
img {
    opacity: 0.5;
}
.banner-container {
    margin-top: -400px;
}
.banner-container>h1 {
    font-family: 'Bebas Neue', 'Black Han Sans', sans-serif;
    font-size: 3.5em;
}
</style>
