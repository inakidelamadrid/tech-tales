<script lang="ts">
	import BlogCard from '$lib/components/blog-card.svelte';
	export let data;
</script>

<section class="relative h-full">
	<ul class="flex">
		{#each data.posts as post}
			<BlogCard {post} />
		{/each}
	</ul>
</section>
