import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { mdsvex } from 'mdsvex';
import mdsvexConfig from './mdsvex.config.js';

const config = {
	preprocess: [vitePreprocess(), mdsvex(mdsvexConfig)],
	kit: { adapter: adapter() },
	extensions: ['.svelte', ...mdsvexConfig.extensions]
};

export default config;
