<!--
<<< SUB-SECTION >>>

우리 서비스에서 대표적으로 제공하는 기능들을 간략히 소개하고 링크 걸어둠
Bootstrap의 Card를 사용했고, v-for 방식으로 데이터를 읽어서 화면에 출력

@author jihogrammer@gmail.com
-->
<template>
    <section>
        <b-container>
            <div class="section-title">
                <h1>Money House Service</h1>
                <span>The Services We Offer</span>
            </div>
            <b-row>
                <b-col cols="6" class="my-3" v-for="card of cards" :key="card.title">
                    <a :href="card.link">
                        <b-card border-variant="light">
                            <b-card-title class="m-3">
                                <b-icon class="mx-2" :icon="card.icon" variant="danger"/>
                                {{ card.title }}
                            </b-card-title>
                            <b-card-text class="my-3">
                                {{ card.content }}
                            </b-card-text>
                        </b-card>
                    </a>
                </b-col>
            </b-row>
        </b-container>
    </section>
</template>

<script>
export default {
    data() {
        return {
            cards: [
                {
                    "link": "#",
                    "icon": "graph-up",
                    "title": "실 거래가 확인",
                    "content": "실시간으로 실거래가를 확인 할 수 있는 서비스를 제공합니다."
                },
                {
                    "link": "#",
                    "icon": "building",
                    "title": "아파트 검색",
                    "content": "주변 아파트를 검색하여서 주변의 시세를 비교 할 수 있게 해줍니다."
                },
                {
                    "link": "#",
                    "icon": "hand-index",
                    "title": "관심 지역 설정",
                    "content": "내가 관심있는 지역을 설정 하게되면 지도에 관심있는 지역을 위주로 나타나게 됩니다."
                },
                {
                    "link": "#",
                    "icon": "emoji-dizzy",
                    "title": "관심 지역 대기오염 정보",
                    "content": "내가 관심 지역으로 등록해놓은 곳의 대기 오염 정보를 실시간으로 제공합니다."
                }
            ]
        }
    },
}
</script>

<style scope>
.section-title>h1 {
    font-family: 'Bebas Neue', cursive;
    color: crimson;
}
section a {
    text-decoration: none;
    color: black;
}
section a:hover {
    color: crimson;
}
.card-body > h4:hover {
    color: red;
}
</style>