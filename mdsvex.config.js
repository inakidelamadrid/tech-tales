import { defineMDSveXConfig as defineConfig, escapeSvelte } from 'mdsvex';
import rehypeSlug from 'rehype-slug';
import { createHighlighter } from 'shiki';

// const dirname = path.resolve(fileURLToPath(import.meta.url), '../');

const config = defineConfig({
	extensions: ['.md', '.svx'],
	highlight: {
		highlighter: async (code, lang = 'text') => {
			const highlighter = await createHighlighter({
				themes: ['poimandres'],
				langs: ['javascript', 'typescript', 'html']
			});
			await highlighter.loadLanguage('javascript', 'typescript', 'html');
			const html = escapeSvelte(highlighter.codeToHtml(code, { lang, theme: 'poimandres' }));
			return `{@html \`${html}\` }`;
		}
	},
	// remarkPlugins: [remarkUnwrapImages, [remarkToc, { tight: true }]],
	rehypePlugins: [rehypeSlug],
	layout: {
		// default: path.join(dirname, './src/lib/components/layouts/default-layout.svelte'),
		// fancy: path.join(dirname, './src/lib/components/layouts/fancy-layout.svelte'),
		// components: path.join(dirname, './src/lib/components/layouts/components-layout.svelte')
	}
});

export default config;
