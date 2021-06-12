<template>
	<b-card class="my-2">
		<b-container>
			<b-row>
				<b-col cols="2">
					{{ commentObj.userid }}
				</b-col>
				<b-col cols="7">
					{{ commentObj.comment }}
				</b-col>
				<b-col cols="3" align="right">
					<b-button v-if="isLoggedIn" variant="success" @click="subCommentToggle">덧글 달기</b-button>
					<b-button v-if="isSameUser" variant="warning" @click="deleteComment" class="mx-2">삭제</b-button>
				</b-col>
			</b-row>
		</b-container>

		<template v-if="subCommentCreateToggle">
			<CommentCreate :isSubComment="true" :qid="commentObj.qid" :cid="commentObj.cid" />
		</template>

		<template v-if="subcomments.length > 0">
			<b-container fluid :key="item.sid" v-for="item in subcomments">
				<template v-if="item.cid == commentObj.cid">
					<hr>
					<b-row>
						<b-col cols="1" align="right">
							<b-icon-arrow-return-right scale="1"/>
						</b-col>
						<b-col cols="2">
							{{ item.userid }}
						</b-col>
						<b-col cols="7">
							{{ item.comment }}
						</b-col>
						<b-col cols="2" align="right">
							<b-button v-if="isSameUser" @click="deleteSubComment(item.sid)" variant="danger">삭제</b-button>
						</b-col>
					</b-row>
				</template>
			</b-container>
		</template>
	</b-card>
</template>

<script>
import CommentCreate from "./CommentCreate";
import { mapGetters } from "vuex";
export default {
	props: {
		commentObj: Object,
	},
	components: {
		CommentCreate,
	},
	data() {
		return {
			subCommentCreateToggle: false,
		};
	},
	methods: {
		subCommentToggle() {
			this.subCommentCreateToggle = !this.subCommentCreateToggle;
		},
		deleteComment() {
			this.$store.dispatch("deleteComment", {
				cid: this.commentObj.cid,
				qid: this.commentObj.qid,
			});
		},
		deleteSubComment(sid) {
			this.$store.dispatch("deleteSubComment", {
				sid,
				cid: this.commentObj.cid,
				qid: this.commentObj.qid,
			});
		},
	},
	computed: {
		subcomments() {
			console.log("대댓글 조회완료");
			return this.$store.state.subcomments;
		},
		...mapGetters(["userStore/getUserName", "userStore/getUserId"]),
		isLoggedIn() {
			let id = this.userid;
			if (id == "" || id == undefined || id == null) return false;
			return true;
		},
		isSameUser() {
			if (this.isLoggedIn) {
				let cname = this.commentObj.userid;
				if (this.username == cname) return true;
			}
			return false;
		}
	},
	created() {
		console.log(this.commentObj.qid);
		this.$store.dispatch("selectSubComment", {
			qid: this.commentObj.qid,
			cid: this.commentObj.cid,
		});
		this.username = this['userStore/getUserName'];
		this.userid = this['userStore/getUserId']
	},
};
</script>
<style scoped>
.comment-list-item {
	display: flex;
	justify-content: space-between;
	padding-bottom: 1em;
}
.comment-list-item-name {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 0.5px solid black;
	padding: 1em;
}
.comment-list-item-context {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 50em;
	border: 0.5px solid black;
}
.comment-list-item-button {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 0.5px solid black;
	padding: 1em;
}
.btn {
	margin-bottom: 1em;
}
.comment-list-item-subcomment-list {
	display: flex;
	justify-content: space-between;
	padding-bottom: 1em;
	margin-left: 10em;
}
</style>
