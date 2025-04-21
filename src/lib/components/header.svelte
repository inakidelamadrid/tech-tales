<script lang="ts">
	import { page } from '$app/state';

	const navLinks = [
		{ href: '/', label: 'Home' },
		{ href: '/blog', label: 'Blog' }
	];
</script>

<ul class="inline-flex w-full items-center gap-8 pl-4">
	{#each navLinks as link}
		<li>
			{#if page.url.pathname !== link.href}
				<a href={link.href} class="text-non-photo-blue font-mono">{link.label}</a>
			{:else}
				<span class="text-non-photo-blue font-mono">{link.label}</span>
			{/if}
		</li>
	{/each}
</ul>
