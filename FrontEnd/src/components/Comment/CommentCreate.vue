<template>
	<b-container fluid>
		<hr>
		<b-row>
			<b-input-group class="mt-3">
				<b-col cols="1"></b-col>
				<b-col cols="2">
					{{name}}
				</b-col>
				<b-col>
					<b-form-textarea
						id="textarea"
						v-model="context"
						:placeholder="isSubComment ? '덧글에 덧글을 달아주세요~!' : '코멘트를 달아주세요~!'"
						rows="3"
						max-rows="6"
					></b-form-textarea>
				</b-col>
				<b-col cols="2" align="right">
					<b-input-group-append>
						<b-button variant="primary" @click="isSubComment ? createSubComment() : addComment()">
							작성하기
						</b-button>
					</b-input-group-append>
				</b-col>
			</b-input-group>
		</b-row>
	</b-container>
</template>
<script>
import { mapState } from "vuex";
export default {
	props: {
		contentId: Number,
		isSubComment: Boolean,
		commentId: Number,
		qid: String,
		cid: String,
	},
	computed: {
		...mapState({
			// https://kdydesign.github.io/2019/04/06/vuejs-vuex-helper/
			userStore: (state) => state.userStore.user.userObject, // 로그인 한 사용자의 정보 객체
		}),
		// comments() {
		// 	console.log("댓글 조회완료");
		// 	return this.$store.state.comments;
		// },
		// subcomments() {
		// 	console.log("대댓글 조회완료");
		// 	return this.$store.state.subcomments;
		// },
	},
	created() {
		this.name = this.userStore.user_name;
		this.Newcomment.userid = this.userStore.user_name;
	},
	data() {
		return {
			name: "jaewoo",
			context: "",
			Newcomment: {
				qid: this.qid,
				comment: this.context,
				userid: "로그인된 유저가 들어와야함",
				cid: this.cid,
			},
		};
	},
	methods: {
		addComment() {
			console.log("userid ");
			console.log(this.userStore);
			this.Newcomment.comment = this.context;
			this.Newcomment.userid = this.userStore.user_name;
			this.$store.dispatch("addComment", this.Newcomment);
		},

		createSubComment() {
			console.log(this.context);
			this.Newcomment.comment = this.context;
			this.Newcomment.userid = this.userStore.user_name;
			this.$store.dispatch("addSubComment", this.Newcomment);
		},
	},
};
</script>
<style scoped>
.comment-create {
	display: flex;
	margin-bottom: 1em;
}
</style>
