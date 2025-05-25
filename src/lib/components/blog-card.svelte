<script lang="ts">
	import { formatDate } from '$lib/utils.js';
	export let post;
</script>

{#key post.slug}
	<a
		class="card card-hover bg-smoky-black mx-4 mt-4 w-full max-w-lg overflow-hidden rounded-md"
		href={`/blog/${post.slug}`}
	>
		<header class="mb-4">
			{#if post.image}
				<img class="aspect-3/2 object-cover" src={post.image} alt="blog banner" />
			{/if}
		</header>

		<div class="space-y-4 p-4">
			<h3 class="h3 text-non-photo-blue text-xl" data-toc-ignore>{post.title}</h3>
			<article>
				<p>
					{post.description}
				</p>
			</article>
		</div>
		<!-- <hr class="opacity-50" /> -->
		<footer class="text-sky-blue flex items-center justify-start space-x-4 p-4">
			<div class="flex flex-auto items-center justify-between">
				<h6 class="font-bold" data-toc-ignore>Ignacio De La Madrid</h6>
				<small>On {formatDate(post.date)}</small>
			</div>
		</footer>
	</a>
{/key}
