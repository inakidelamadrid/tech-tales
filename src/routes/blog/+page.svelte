<script lang="ts">
	import BlogCard from '$lib/components/blog-card.svelte';
	import Header from '$lib/components/header.svelte';
	export let data;
</script>

<section class="mb-16">
	<Header />
	<ul class="flex flex-col items-center">
		{#each data.posts as post}
			<BlogCard {post} />
		{/each}
	</ul>
</section>
