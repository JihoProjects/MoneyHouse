import Vue from "vue";
import VueRouter from "vue-router";

import Main from "@/components/Main";
import DealAddress from "@/components/Deal/DealAddress.vue"
import DealName from "@/components/Deal/DealName.vue"
import BoardList from '@/components/Board/BoardList.vue'
import BoardInput from '@/components/Board/BoardInput.vue'
import BoardDetail from '@/components/Board/BoardDetail.vue'
import BoardUpdate from '@/components/Board/BoardUpdate.vue'

import Login from "@/components/user/Login.vue";
import UserJoin from "@/components/user/UserJoin.vue";
import UserInfo from "@/components/user/UserInfo.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Main",
    component: Main,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/dealAddress",
    name: "DealAddress",
    component: DealAddress,
  },
  {
    path: "/join",
    name: "Join",
    component: UserJoin,
  },
  {
    path: "/info",
    name: "userinfo",
    component: UserInfo,
  },
  {
    path: "/dealName",
    name: "DealName",
    component: DealName,
  },

  {
    path: "/board",
    name: "board",
    component: BoardList,
  },
  {
    path: "/board/:id",
    name: "QnaDetail",

    component: BoardDetail,
  },
  {
    path: "/boardInput",
    name: "boardInput",

    component: BoardInput,
  },
  {
    path: "/boardUpdate/:id",
    name: "boardUpdate",
    component:BoardUpdate,
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
