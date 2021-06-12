<template>
    <div id="app">
        <Header />
        <router-view />
        <Footer />
    </div>
</template>

<script>
import Header from "@/layout/Header.vue";
import Footer from "@/layout/Footer.vue";

// Vuex Module Import
import { createNamespacedHelpers } from 'vuex';
const {mapActions} = createNamespacedHelpers('userStore');

export default {
    name: "App",
    components: {
        Header,
        Footer,
    },
    methods: {
        ...mapActions(["authLogin"]),
    },
    beforeMount() {
        let token = localStorage.getItem("moneyhouse-token");
        if (token != null) {
            this.authLogin(token);
        }
    },
};
</script>

<style>
#app {
    font-family: 'Montserrat', sans-serif;
}
</style>

<style src="./assets/css/style.css">
@import url("https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i");
