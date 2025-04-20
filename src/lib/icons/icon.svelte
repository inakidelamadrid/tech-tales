<script lang="ts">
	// Available icon names
	export let name: iconName = 'document';
	export let size: number = 24;
	export let stroke: string = 'currentColor';
	export let fill: string = 'none';
	export let viewBox: string = '0 0 24 24';
	import { icons, type iconName } from './library';
</script>

<svg
	xmlns="http://www.w3.org/2000/svg"
	width={size}
	height={size}
	{viewBox}
	{fill}
	{stroke}
	stroke-width="2"
	stroke-linecap="round"
	stroke-linejoin="round"
	class={$$props.class || ''}
>
	{@html icons[name]}
</svg>
