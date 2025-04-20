<script lang="ts">
	import '../app.css';

	let { children } = $props();
</script>

<main class="container mx-auto h-full min-h-screen bg-black px-4 py-8 text-gray-100">
	{@render children()}
</main>
