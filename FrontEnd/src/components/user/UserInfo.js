// 외부 JS 읽을 경우 component를 구분해서 사용한다.
// Daum ADDR API 사용
import DaumAddrAPI from "@/components/user/DaumAddrAPI.vue";

// Vuex Module Import
import { createNamespacedHelpers } from "vuex";
const { mapState, mapActions } = createNamespacedHelpers("userStore");

export default {
    components: {
        DaumAddrAPI,
    },
    data() {
        return {
            user: {},
            user_pw: "",
            d_id: "",
            d_name: "",
            d_pw: "",
            d_email: "",
            d_phone: "",
        }
    },
    computed: {
        ...mapState({
            storeUser: state => state.user.userObject,
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
        user_id() {
            return document.getElementById("user_id").innerHTML;
        },
        user_name() {
            return document.getElementById("user_name").value;
        },
        user_email() {
            return document.getElementById("user_email").value;
        },
        user_phone() {
            return document.getElementById("user_phone").value;
        },
    },
    methods: {
        ...mapActions(["userSearch", "passCheck", "userUpdate"]),
        update() {
            console.log("update() 호출");
            let user = this.readData();
            this.passCheck(user)
                .then(() => {
                    this.userUpdate(user)
                        .then(() => {
                            alert("수정되었습니다!");
                            this.$router.push("/").catch(()=>{});
                        });
                })
                .catch(() => {
                    alert("비밀번호를 확인해주세요!");
                });
        },
        readData() {
            let user = {
                user_id: this.user_id,
                user_pw: this.user_pw,
                user_name: this.user_name,
                user_email: this.user_email,
                user_phone: this.user_phone,
                user_address: this.user_addr,
            };
            console.log(user);
            return user;
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
