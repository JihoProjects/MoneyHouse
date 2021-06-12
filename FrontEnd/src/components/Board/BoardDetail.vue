<template>
	<div class="my-5 px-3 border-secondary">
		<b-container v-if="isExist">
			<a href="/board"><b-icon-chevron-double-left/> 게시판 목록</a>
			<b-card no-body class="m-0 my-5" header-tag="header" footer-tag="footer">
				<template #header>
					<h6 class="mb-0">
						{{cardHeader}}
					</h6>
				</template>
				<b-card-title class="mt-5 px-3">
					<b-icon-person-fill/> {{board.quserid}}
					<b-button class="mx-2" variant="success" @click="goUpdate()" v-if="checkUser">수정</b-button>
					<b-button class="mx-2" variant="danger" @click="removeQna()" v-if="checkUser">삭제</b-button>
				</b-card-title>
				<hr class="my-4">
				<b-card-text class="mb-5 px-3">
					{{ board.qque }}
				</b-card-text>
				<template #footer>
					<em>{{onlydate}}</em>
				</template>
			</b-card>
			<CommentList :qid="board.qid" />
		</b-container>
		<!-- qid가 없거나 존재하지 않는 페이지일 경우 -->
		<b-container>
			<b-jumbotron v-if="!isExist">
				<template #header>
					❌ 잘못된 접근입니다
				</template>
				<hr class="my-4">
				<b-button variant="success" href="/" class="mx-3">메인</b-button>
				<b-button variant="primary" href="/board">목록</b-button>
			</b-jumbotron>
		</b-container>
	</div>
</template>

<script>
import CommentList from "../Comment/CommentList.vue";
import { mapGetters } from "vuex";

export default {
	components: { CommentList },
	data() {
		return {
			board: null,
			isExist: false,
		}
	},
	created() {
		var no = this.$route.params.id;
		console.log("detail" + no);
		this.$store.dispatch("selectOne", { id: no }).then(() => {
			this.board = this.$store.state.board;
			if (this.board != "") this.isExist = true;
		});
		this.$store.dispatch("selectComment", { id: no });
	},
	computed: {
		...mapGetters(["userStore/getUserId"]),
		comments() {
			return this.$store.state.comments;
		},
		checkUser() {
			let userid = this['userStore/getUserId'];
			let quserid = this.board.quserid;
			if (userid == "admin") return true;
			if (userid == undefined || userid == "") return false;
			return userid == quserid;
		},
		cardHeader() {
			let id = this.board.qid;
			let area = this.board.qarea;
			return "No. " + id + " " + (area == null ? "" : area);
		},
		onlydate() {
			return this.board.qdate.split(' ')[0];
		},
	},
	methods: {
		removeQna() {
			this.$store.dispatch("boardRemove", this.board.qid);
			this.$router.push("/board");
		},
		goUpdate() {
			this.$router.push("/boardUpdate/" + this.board.qid);
		},
	},
};
</script>

<style></style>
