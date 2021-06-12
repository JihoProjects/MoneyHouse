<template>
	<div class="comment-create">
		<b-input-group :prepend="name" class="mt-3">
			<b-form-textarea id="textarea" v-model="context" rows="3" max-rows="6"></b-form-textarea>
			<b-input-group-append>
				<b-button variant="info"> >작성하기</b-button>
			</b-input-group-append>
		</b-input-group>
	</div>
</template>

<script>
export default {
	props: {
		BoardId: String,
		isSubComment: Boolean,
		commentId: String,
	},
	data() {
		return {
			context: "",
			name: "jaewoo",
		};
	},
	created() {
		console.log(this.BoardId);
	},
};
</script>

<style></style>
