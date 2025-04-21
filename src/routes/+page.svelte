<script lang="ts">
	import Header from '$lib/components/header.svelte';
	import TestimonialGrid from '$lib/components/testimonial-grid.svelte';
</script>

<div id="landing" class="relative h-full">
	<Header />

	<div class="mt-[200px] flex flex-col">
		<h2 class="text-xl text-gray-100">Software Engineering Stories</h2>
		<h1 class="font-display text-8xl">Ignacio De La Madrid</h1>
	</div>
	<div class="mt-16">
		<TestimonialGrid />
	</div>
</div>
