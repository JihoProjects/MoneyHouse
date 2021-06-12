<template>
	<div>
		<div v-for="item in comments" :key="item.cid">
			<CommentListItem :commentObj="item" />
		</div>
		<CommentCreate :qid="qid" />
	</div>
</template>
<script>
import CommentListItem from "./CommentListItem.vue";
import CommentCreate from "./CommentCreate.vue";
export default {
	name: "CommentList",
	props: {
		qid: String,
	},
	components: {
		CommentListItem,
		CommentCreate,
	},
	data() {
		return {};
	},
	computed: {
		// subcomments() {
		// 	console.log("대댓글 조회완료");
		// 	return this.$store.state.subcomments;
		// },
		comments() {
			console.log("댓글 조회완료");
			return this.$store.state.comments;
		},
	},
};
</script>
