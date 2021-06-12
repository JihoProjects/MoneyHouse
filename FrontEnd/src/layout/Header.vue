<!--
<<< HEADER >>>

전체 페이지에서 기본적으로 사용하는 헤더 영역 컴포넌트.
navbar 형식으로 구현했으며, 상단 고정했음.

@author 김지호 jihogrammer@gmail.com
-->
<template>
    <div id="header" class="py-2">
        <b-navbar fixed="top">
            <b-container fluid>
                <b-navbar-brand href="/">
                    <h1>
                        Money
                        <b-icon class="mx-1" scale="1" variant="danger" icon="suit-heart-fill"></b-icon>
                        House
                    </h1>
                </b-navbar-brand>
                <b-col align-self="center">
                    <b-navbar-nav>
                        <b-nav-item href="#">
                            <!-- 미구현 -->
                            공지사항
                        </b-nav-item>
                        <b-nav-item-dropdown text="소식" right>
                            <!-- 미구현 -->
                            <b-dropdown-item href="#">About Us</b-dropdown-item>
                            <b-dropdown-item href="#">News</b-dropdown-item>
                        </b-nav-item-dropdown>
                        <b-nav-item href="/board">
                            게시판
                        </b-nav-item>
                    </b-navbar-nav>
                </b-col>
                <!-- 회원 관련 버튼 / 우측 정렬 -->
                <b-col align="right">
                    <div v-if="isLogin == false">
                        <b-button variant="success" class="m-2" href="/join">Sign In</b-button>
                        <b-button variant="primary" class="m-2" href="/login">Log In</b-button>
                    </div>
                    <div v-if="isLogin == true">
                        <b-button variant="success" class="m-2" href="/info">{{ user_id }}</b-button>
                        <b-button variant="danger" class="m-2" @click="logout">Logout</b-button>
                    </div>
                </b-col>
            </b-container>
        </b-navbar>
        <br><br><br><!-- Navigation Bar 상단 고정으로 인한 공간 할당 -->
    </div>
</template>

<script>
import { createNamespacedHelpers } from "vuex";
const { mapState, mapActions } = createNamespacedHelpers("userStore");

export default {
    computed: {
        ...mapState({
            isLogin: state => state.user.isLogin, // 로그인 상태
            user_id: state => state.user.user_id  // 로그인 한 사용자의 아이디
        }),
    },
    methods: {
        ...mapActions(["userLogout"]),
        /**
         * 로그아웃 버튼 클릭 시, userStore에서 세션(JWT) 해제
         */
        logout() {
            let out = confirm("로그아웃 하시겠습니까?");

			if (out) {
				this.userLogout();
				// 메인 페이지로 이동하기
				this.$router.push("/").catch(() => {});
			}
		},
	},
};
</script>

<style scope>
nav {
	background-color: whitesmoke; /* 헤더 전체 배경 색상 */
}
nav h1 {
	margin-top: 5px;
	font-family: "Bebas Neue", cursive;
}
</style>
