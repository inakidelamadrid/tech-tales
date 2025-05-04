<script lang="ts">
	import BlogCard from '$lib/components/blog-card.svelte';
	export let data;
</script>

<section class="relative h-[88vh]">
	<ul class="flex items-center">
		{#each [data.posts[0]] as post}
			<BlogCard {post} />
		{/each}
	</ul>
</section>
