<template>
	<div>
		<h1>게시판 수정</h1>
		<div class="AddWrap">
			<form>
				<table class="tbAdd">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>글 번호</th>
						<td><input type.trim="text" v-model="board.qid" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea v-model="board.qque"></textarea></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="btnWrap">
			<a href="javascript:;" @click="goList" class="btn">목록</a>
			<a href="javascript:;" @click="boardUpdate" class="btnAdd btn">수정</a>
		</div>
	</div>
</template>

<script>
export default {
	created() {
		var no = this.$route.params.id;
		console.log("detail" + no);
		this.$store.dispatch("selectOne", { id: no });
	},
	computed: {
		board() {
			console.log("조회완료");
			return this.$store.state.board;
		},
	},
	data() {
		return {
			newQna: {
				qid: "qna.qid",
				qque: "qna.qque",
				qans: "",
				quserid: "123",
			},
		};
	},
	methods: {
		goList() {
			this.$router.push("/board");
		},
		boardUpdate() {
			console.log(this.$store.state.board);
			if (this.newQna.qque != "") {
				this.$store.dispatch("boardUpdate", this.$store.state.board);
				this.$router.push("/board");
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
