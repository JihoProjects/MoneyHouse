<template>
	<div id="main">
		<MainBanner />
		<MainSection />
		<hr />
		<SubSection />
	</div>
</template>

<script>
import MainBanner from "./main/MainBanner";
import MainSection from "./main/MainSection";
import SubSection from "./main/SubSection";

export default {
	name: "Main",
	components: {
		MainBanner,
		MainSection,
		SubSection,
	},
};
</script>

<style></style>
