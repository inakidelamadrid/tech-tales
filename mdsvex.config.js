import { defineMDSveXConfig as defineConfig } from 'mdsvex';
import rehypeSlug from 'rehype-slug';

// const dirname = path.resolve(fileURLToPath(import.meta.url), '../');

const config = defineConfig({
	extensions: ['.md', '.svx'],
	// remarkPlugins: [remarkUnwrapImages, [remarkToc, { tight: true }]],
	rehypePlugins: [rehypeSlug],
	layout: {
		// default: path.join(dirname, './src/lib/components/layouts/default-layout.svelte'),
		// fancy: path.join(dirname, './src/lib/components/layouts/fancy-layout.svelte'),
		// components: path.join(dirname, './src/lib/components/layouts/components-layout.svelte')
	}
});

export default config;
