<template>
	<b-container class="py-5">
		<b-row class="my-4">
			<b-jumbotron id="">
				<template #header>게시판</template>
				<template #lead>
					MONEY<b-icon class="mx-1" scale="1" variant="danger" icon="suit-heart-fill"></b-icon>HOUSE
				</template>
				<hr class="my-4">
				<p>
					<b-button variant="success" class="mx-3" v-if="isLogin" href="/boardInput">글쓰기</b-button>
					분류별로 게시글을 확인할 수 있습니다😉
				</p>
			</b-jumbotron>
        </b-row>
		<!-- https://bootstrap-vue.org/docs/components/table#sorting -->
		<b-table
			id="my-table"
			sort-icon-left
			:items="boardlist"
			:per-page="perPage"
			:current-page="currentPage"
			@row-clicked="qnaDetail"
			:fields="fields"
		></b-table>
		<div class="pagination justify-content-center">
			<b-pagination
				v-model="currentPage"
				:total-rows="rows"
				:per-page="perPage"
				aria-controls="my-table"
				align="center"
			></b-pagination>
		</div>
	</b-container>
</template>

<script>
import { mapGetters } from "vuex";
export default {
	data() {
		return {
			fields: [
				{
					key: "qid",
					label: "글번호",
					sortable: true,
				},
				{
					key: "qque",
					label: "내용",
					sortable: true,
				},
				{
					key: "quserid",
					label: "작성자",
					sortable: true,
				},
				{
					key: "qarea",
					label: "분류",
					sortable: true,
				},
				{
					key: "qdate",
					label: "작성일",
					sortable: true,
				},
			],
			currentPage: 1,
			perPage: 20,
		};
	},
	created() {
		this.$store.dispatch("selectAll"); //action call
	},
	computed: {
		...mapGetters(["boardlist", "userStore/getUserId"]), // store.js 파일안에 잇는 getter중에 qnalist
		rows() {
			return this.boardlist.length;
		},
		isLogin() {
			let id = this['userStore/getUserId'];
			if (id == undefined || id == "") return false;
			return true;
		},
	},
	methods: {
		qnaDetail(item) {
			this.$router.push("/board/" + item.qid);
		},
	},
};
</script>
<style>
.sr-only {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    border: 0;
    clip: rect(0,0,0,0);
}
</style>
