<script lang="ts">
	import Header from '$lib/components/header.svelte';
	import '../app.css';

	let { children } = $props();
</script>

<main class="container mx-auto h-full bg-black px-4 py-8 text-gray-100">
	<Header />
	{@render children()}
</main>
<footer>
	<div class="flex justify-center gap-4 text-gray-100">
		<div class="font-mono">
			&copy;
			<script type="text/javascript">
				document.write(new Date().getFullYear());
			</script>
			Ignacio de La Madrid - All rights reserved.
		</div>
	</div>
</footer>
