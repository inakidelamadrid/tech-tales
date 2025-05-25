<!-- Accordion.svelte -->
<script lang="ts">
	import { quintOut } from 'svelte/easing';
	import { slide } from 'svelte/transition';

	// Props
	export let title: string;
	export let isOpen: boolean = false;
	export let icon: any = null; // Default to null if no icon provided
	export let animate: 'none' | 'slide' | 'fade' | 'zoom' = 'none';

	// Toggle accordion state
	function toggleAccordion() {
		isOpen = !isOpen;
	}

	// Animation config based on animate prop
	const getTransition = (node: HTMLElement) => {
		switch (animate) {
			case 'slide':
				return slide(node, { duration: 300, easing: quintOut });
			case 'fade':
				return {
					duration: 200,
					css: (t: number) => `opacity: ${t}`
				};
			case 'zoom':
				return {
					duration: 200,
					css: (t: number) => `transform: scale(${t}); opacity: ${t}`
				};
			default:
				return {}; // No animation
		}
	};
</script>

<div class="mb-2 w-full rounded-md border border-gray-200">
	<!-- Accordion Header -->
	<button
		on:click={toggleAccordion}
		class="bg-tiffany-blue hover:bg-blue-sky flex w-full items-center justify-between p-4 text-left transition-colors"
		aria-expanded={isOpen}
	>
		<span class="font-mono font-medium">{title}</span>

		<div class="flex items-center">
			{#if icon}
				<div class="mr-2">{icon}</div>
			{/if}

			<!-- Default chevron icon that rotates -->
			<svg
				class="h-5 w-5 transition-transform duration-200 {isOpen ? 'rotate-180 transform' : ''}"
				fill="none"
				stroke="currentColor"
				viewBox="0 0 24 24"
				xmlns="http://www.w3.org/2000/svg"
			>
				<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"
				></path>
			</svg>
		</div>
	</button>

	<!-- Accordion Content -->
	{#if isOpen}
		<div class="px-4 pb-4" transition:getTransition>
			<slot></slot>
		</div>
	{/if}
</div>
