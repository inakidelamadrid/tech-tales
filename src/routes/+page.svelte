<script lang="ts">
	import TestimonialGrid from '$lib/components/testimonial-grid.svelte';
</script>

<div id="landing" class="relative h-full">
	<ul class="inline-flex w-full items-center gap-8 pl-4">
		<!-- <li>
			<a class="text-non-photo-blue font-mono" href="/blog">Portfolio</a>
		</li> -->
		<li>
			<a class="text-non-photo-blue font-mono" href="/blog">Blog</a>
		</li>
		<!-- <li>
			<a class="text-non-photo-blue font-mono" href="/blog">About</a>
		</li> -->
	</ul>

	<div class="mt-[200px] flex flex-col">
		<h2 class="text-xl text-gray-100">Software Engineering Stories</h2>
		<h1 class="font-display text-8xl">Ignacio De La Madrid</h1>
	</div>
	<div class="mt-16">
		<TestimonialGrid />
	</div>
</div>
