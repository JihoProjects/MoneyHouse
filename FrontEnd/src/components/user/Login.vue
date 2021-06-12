<template>
    <b-container id="login" class="my-5 py-5">
        <b-row>
            <b-col cols="3">
                <!-- 그리드 영역을 맞추기 위한 빈 태그-->
            </b-col>
            <b-col cols="6">
                <b-form @submit="login">
                    <b-container>
                        <b-row>
                            <b-col cols="3" align-self="center">
                                <label>ID</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    type="text"
                                    v-model="user_id"
                                    placeholder="아이디를 입력해주세요"
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row class="my-4">
                            <b-col cols="3" align-self="center">
                                <label>PW</label>
                            </b-col>
                            <b-col cols="9">
                                <b-form-input
                                    type="password"
                                    v-model="user_pw"
                                    @keyup.enter="login"
                                    placeholder="비밀번호를 입력해주세요"
                                ></b-form-input>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-button variant="primary" class="m-2" type="submit">로그인</b-button>
                            <hr class="my-3">
                            <b-button variant="success" class="m-2" href="/join">회원가입</b-button>
                            <b-button variant="warning" class="m-2" href="/find">비밀번호 찾기</b-button>
                        </b-row>
                    </b-container>
                </b-form>
            </b-col>
            <b-col cols="3">
                <!-- 그리드 영역을 맞추기 위한 빈 태그-->
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapActions } = createNamespacedHelpers('userStore');

export default {
    data() {
        return {
            user_id: "",
            user_pw: ""
        }
    },
    computed: {
        ...mapState({
            isLogin: state => state.user.isLogin,
            user: state => state.user.user_id
        }),
    },
    methods: {
        ...mapActions(["userLogin", "userLogout"]),
        login(event) {

            if (this.user_id == "") {
                alert("아이디를 입력해주세요.");
                this.user_pw = "";
                return;
            }
            if (this.user_pw == "") {
                alert("비밀번호를 입력해주세요.");
                this.user_id = "";
                return;
            }
            // Form Action으로 수행되도록 기능을 막는 역할
            event.preventDefault();
            // 로그인 시도
            this.userLogin({user_id: this.user_id, user_pw: this.user_pw});
            // 로그인 성공
            console.log(this.user);
            if (this.user != undefined) {
                this.$router.push("/").catch(() => {});
            }
            // 로그인 실패
            else {
                this.userLogout(); // vuex state 초기화
                alert("아이디 또는 비밀번호를 확인하세요!");
            }
        }
    },
    beforeMount() {
        if (this.isLogin == true) {
            alert("이미 로그인 했습니다!");
            this.$router.push("/").catch(() => {});
        }
    },
}
</script>

<style>

</style>