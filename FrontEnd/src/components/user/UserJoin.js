// 외부 JS 읽을 경우 component를 구분해서 사용한다.
// Daum ADDR API 사용
import DaumAddrAPI from "@/components/user/DaumAddrAPI.vue";

// Vuex Module Import
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapActions } = createNamespacedHelpers('userStore');

export default {
    components: {
        DaumAddrAPI,
    },
    data() {
        return {
            user_name: "",
            user_id: "",
            user_pw: "",
            user_pw_ck: "",
            user_email: "",
            user_phone: "",
            d_name: "",
            d_id: "",
            d_pw: "",
            d_pw_ck: "",
            d_email: "",
            d_phone: "",
        }
    },
    computed: {
        ...mapState({
            user: state => state.userSearch,
            joinSuccess: state => state.joinSuccess,
        }),
        user_addr() {
            let addr = "";
            addr += document.getElementById("postcode").value + "/";
            addr += document.getElementById("roadAddress").value + "/";
            addr += document.getElementById("jibunAddress").value + "/";
            addr += document.getElementById("extraAddress").value + "/";
            addr += document.getElementById("detailAddress").value;
            console.log("주소: " + addr);
            return addr;
        },
    },
    methods: {
        ...mapActions(["userJoin", "userSearch"]),
        join(event) {
            alert(this.user_addr);
            event.preventDefault();
            let userInfo = {
                user_name: this.user_name,
                user_id: this.user_id,
                user_pw: this.user_pw,
                user_email: this.user_email,
                user_phone: this.user_phone,
                user_address: this.user_addr
            }
            console.log(userInfo);
            this.userJoin(userInfo)
            .then(() => {
                // 회원가입 성공
                if (this.joinSuccess == true) {
                    alert(`환영합니다! ${this.user_name}님 로그인 페이지로 이동합니다!`);
                    this.$router.push("/login").catch(() => {});
                }
                //회원가입 실패
                else {
                    alert("문제가 생겼습니다.");
                    this.$router.push("/").catch(() => {});
                }
            });
            // 유저 등록 기다림(1초)
            // setTimeout(() => {
            // }, 500);
        },
        nameVaild() {
            let name = this.user_name;
            if (name.length < 2) {
                this.d_name = "이름이 너무 짧습니다!";
                this.user_name = "";
                return;
            }
            this.userSearch({ key: "user_name", value: this.user_name })
            .then(() => {
                // 이미 존재하는 이름일 경우
                if (this.user.user_name == this.user_name) {
                    this.user_name = "";
                    this.d_name = "이미 사용 중인 이름입니다🙄";
                }
                // 사용 가능한 이름일 경우
                else {
                    this.d_name = "닉네임으로 사용됩니다!👍";
                }
            });
        },
        identificationVaild() {
            let id = this.user_id;
            if (id.length < 5) {
                this.d_id = "아이디가 너무 짧습니다!";
                this.user_id = "";
                return;
            }
            let reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/i;
            if (id.match(reg) == null) {
                this.d_id = "아이디가 형식이 잘못되었습니다!";
                this.user_id = "";
                return;
            }
            this.userSearch({ key: "user_id", value: this.user_id })
            .then(() => {
                // 이미 존재하는 아이디일 경우
                if (this.user.user_id == this.user_id) {
                    this.user_id = "";
                    this.d_id = "이미 사용 중인 아이디입니다🙄";
                }
                // 사용 가능한 아이디일 경우
                else {
                    this.d_id = "멋진 아이디네요👍";
                }
            });
        },
        passwordVaild() {
            // https://java119.tistory.com/71
            let pw = this.user_pw;
            // let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
            let num = pw.search(/[0-9]/g);
            let eng = pw.search(/[a-z]/ig);
            let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            let flag = true;
            if (pw.length < 8) {
                this.d_pw = "비밀번호가 너무 짧습니다!"
                flag = false;
            } else if (pw.length > 20) {
                this.d_pw = "비밀번호가 너무 길어요😢"
                flag = false;
            } else if (pw.search(/\s/) != -1) {
                this.d_pw = "비밀번호에 공백은 빼주세요😉"
                flag = false;
            } else if (num < 0 || eng < 0 || spe < 0) {
                this.d_pw = "비밀번호는 숫자, 영문자, 특수문자를 혼합해주세요!"
                flag = false;
            }
            if (flag) {
                this.d_pw = "";
            } else {
                this.user_pw = "";
            }
        },
        passwordCheck() {
            let origin = this.user_pw;
            let check = this.user_pw_ck;
            if (origin != check) {
                this.user_pw_ck = "";
                //document.getElementById("user_pw_ck").focus();
                this.d_pw_ck = "비밀번호가 다릅니다❌";
            } else {
                this.d_pw_ck = "확인되었습니다!";
            }
        },
        emailValid() {
            let reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            if (this.user_email.match(reg) != null) {
                this.d_email = "확인되었습니다!"
            } else {
                this.user_email = "";
                this.d_email = "이메일 형식이 올바르지 않습니다!"
            }
        },
        phoneVaild() {
            if (this.user_phone.length < 1) return;
            let reg = /^\d{3}-\d{3,4}-\d{4}$/;
            if (this.user_phone.match(reg) != null) {
                this.d_phone = "확인되었습니다!"
            } else {
                this.user_phone = "";
                this.d_phone = "전화번호 형식이 올바르지 않습니다!"
            }
        },
    }
}