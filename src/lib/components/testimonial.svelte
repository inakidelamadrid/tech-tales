<script lang="ts">
	import Icon from '$lib/icons/icon.svelte';
	import type { iconName } from '$lib/icons/library';

	export let quote: string;
	export let author: string;
	export let company: string;
	export let icon: string = 'document';
</script>

<div class="bg-smoky-black flex h-full flex-col rounded-lg p-8 font-mono">
	<div class="mb-6 flex justify-center text-teal-400">
		<Icon
			name={icon as iconName}
			size={36}
			color="currentColor"
			viewBox="0 0 0.72 0.72"
			stroke="none"
			fill="currentColor"
		/>
	</div>

	<p class="mb-4 flex-grow text-sm leading-relaxed text-teal-400 sm:text-base">
		{quote}
	</p>

	<div class="mt-auto">
		<p class="font-medium text-teal-400">{author}</p>
		<p class="text-xs text-teal-400">{company}</p>
	</div>
</div>
