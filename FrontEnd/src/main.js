import Vue from "vue";
import App from "./App.vue";

// Router
import router from "./js/router.js";

// Vuex
import store from "./js/store.js";

// Bootstrap
// https://bootstrap-vue.org
import { BootstrapVue, BootstrapVueIcons } from "bootstrap-vue";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
