<template>
	<div>
		<h1>QnA 등록</h1>

		<div class="AddWrap">
			<form>
				<table class="tbAdd">
					<colgroup>
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<!-- <tr>
					<th>번호</th>
						<td><input type.trim="text" v-model="newQna.qid" ref="subject" /></td>
					</tr> -->
					<tr>
						<th>내용</th>
						<td><textarea v-model="newQna.qque" ref="cont"></textarea></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="btnWrap">
			<a href="javascript:;" @click="goList" class="btn">목록</a>
			<a href="javascript:;" @click="boardAdd" class="btnAdd btn">등록</a>
		</div>
	</div>
</template>

<script>
import { mapState } from "vuex";
//quserid에 현재 유저 입력받아야함
export default {
	data() {
		return {
			newQna: {
				qid: "",
				qque: "",
				qans: "",
				// quserid: "123",
			},
		};
	},
	computed: {
		...mapState({
			// vuex에서 userid를 읽음
			quserid: store => store.userStore.user.user_id,
		}),
	},
	methods: {
		goList() {
			this.$router.push("/qna");
		},
		boardAdd() {
			console.log(this.newQna.qque);
			if (this.newQna.qque != "") {
				// dispatch 전에 userid 매핑
				this.newQna.quserid = this.quserid;
				console.log(this.newQna);
				this.$store.dispatch("addBoard", this.newQna);
				this.$router.push("/qna");
			} else {
				alert("내용을 입력하세요.");
			}
		},
	},
};
</script>
<style scoped>
div {
	margin-left: 50px;
	margin-right: 50px;
}
.tbAdd {
	border-top: 1px solid #888;
}
.tbAdd th,
.tbAdd td {
	border-bottom: 1px solid #eee;
	padding: 5px 0;
}
.tbAdd td {
	padding: 10px 10px;
	box-sizing: border-box;
}
.tbAdd td input {
	width: 100%;
	min-height: 30px;
	box-sizing: border-box;
	padding: 0 10px;
}
.tbAdd td textarea {
	width: 100%;
	min-height: 300px;
	padding: 10px;
	box-sizing: border-box;
}
.btnWrap {
	text-align: center;
	margin: 20px 0 0 0;
}
.btnWrap a {
	margin: 0 10px;
}
.btnAdd {
	background: #43b984;
}
.btnDelete {
	background: #f00;
}
</style>
