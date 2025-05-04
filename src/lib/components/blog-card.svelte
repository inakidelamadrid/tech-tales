<script lang="ts">
	import { description, title, url } from '$lib/config';
	import { formatDate } from '$lib/utils.js';
	export let post;
</script>

<svelte:head>
	<title>{title}</title>

	<meta name="description" content={description} />

	<meta property="og:type" content="article" />
	<meta property="og:url" content={`${url}/blog`} />
	<meta property="og:title" content={title} />
	<meta property="og:description" content={description} />
	<meta property="og:site_name" content={title} />
	<!-- <meta property="og:image" content="/blog-banner.webp" /> -->

	<meta name="twitter:site" content="@McBride1105" />
	<meta name="twitter:creator" content="@McBride1105" />
	<meta name="twitter:title" content={title} />
	<meta name="twitter:description" content={description} />
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:image:src" content="/blog-banner.webp" />
	<meta name="twitter:widgets:new-embed-design" content="on" />

	<meta name="theme-color" content="#ffffff" media="(prefers-color-scheme: light)" />
	<meta name="theme-color" content="#000000" media="(prefers-color-scheme: dark)" />
</svelte:head>

{#key post.slug}
	<a
		class="card card-hover bg-smoky-black mx-4 mt-4 w-full max-w-lg overflow-hidden rounded-md"
		href={`/blog/${post.slug}`}
	>
		<header class="mb-4">
			{#if post.image}
				<img src={post.image} alt="blog banner" />
			{/if}
		</header>

		<div class="space-y-4 p-4">
			<h3 class="h3 text-non-photo-blue font-mono" data-toc-ignore>{post.title}</h3>
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
