import axios from "../axios-common.js";

const userStore = {
    namespaced: true,
    state: {
        user: {
            isLogin: false,
            user_id: "",
            user_name: "",
            userObject: {}
        },
        user_search: {},
        joinSuccess: false,
    },
    getters: {
        getUserId(state) {
            return state.user.user_id;
        },
        getUserName(state) {
            return state.user.user_name;
        }
    },
    mutations: {
        USER_LOGIN: (state, user) => {
            state.user.user_id = user.user_id;
            state.user.user_name = user.user_name;
            state.user.userObject = user;
            state.user.isLogin = true;
        },
        USER_LOGOUT: (state) => {
            state.user.isLogin = false;
            state.user.user_id = "";
            state.user.userObject = {};
            localStorage.removeItem("moneyhouse-token");
            this.$router.push("/").then(()=>{});
        },
        USER_SEARCH: (state, user) => {
            state.user_search = user;
        },
        JOIN_SUCCESS: (state, result) => {
            state.joinSuccess = result;
        }
    },
    actions: {
        authLogin({commit, dispatch}, token) {
            let config = {
                headers: {
                    "moneyhouse-token": token
                }
            };
            axios
                .get("/user/auth", config)
                .then(res => {
                    let user = {
                        user_id: res.data.user_id,
                        user_name: res.data.user_name,
                        user_email: res.data.user_email,
                        user_phone: res.data.user_phone,
                        user_address: res.data.user_address,
                        user_point: res.data.user_point,
                    };
                    localStorage.setItem("moneyhouse-token", token);
                    // 로그인 성공 처리
                    commit("USER_LOGIN", user);
                })
                .catch((e) => {
                    // https://xn--xy1bk56a.run/axios/guide/error-handling.html
                    if (e.response) {
                        alert("세션이 만료되었습니다.");
                        // https://forum.vuejs.org/t/calling-action-inside-another-action-in-vuex/20390/3
                        // calling-action-inside-another-action-in-vuex
                        dispatch("userLogout");
                    } else {
                        alert("서버에 오류가 발생했습니다.");
                        console.log(e);
                    }
                })
        },
        userLogin({dispatch}, loginForm) {
            return axios
                .put("/user/login", loginForm)
                .then(res => {
                    // 통신 성공 시 token 발급 받음
                    let token = res.data;
                    console.log(token);
                    dispatch("authLogin", token);
                })
                .catch(e => {
                    alert("서버에 문제가 생겼습니다.");
                    console.log("ERROR: " + e);
                });
        },
        userLogout({commit}) {
            commit("USER_LOGOUT");
        },
        userJoin({commit}, userInfo) {
            return axios
            .post("user/join", userInfo)
            .then(() => {
                    console.log("[회원가입 성공]");
                    commit("JOIN_SUCCESS", true);
                })
                .catch((e) => {
                    console.log(e);
                })
        },
        userSearch({ commit }, user) {
            return axios
                .post("/user/search", user)
                .then(res => {
                    console.log(res);
                    commit("USER_SEARCH", res.data);
                })
                .catch(e => {
                    console.log(e);
                });
        },
        passCheck({commit}, user) {
            return axios
                .post("/user/check", user)
                .then(res => {
                    if (res.data == true)
                        commit("USER_LOGIN", user);
                })
            },
        userUpdate({ commit }, user) {
            console.log(user);
            return axios
                .put("/user/update", user)
                .then(res => {
                    if (res.data == true)
                        commit("USER_LOGIN", user);
                })
                .catch(e => {
                    console.log(e);
                });
        },
    }
};

export default userStore;