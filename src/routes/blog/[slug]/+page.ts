import type { ServerLoadEvent } from '@sveltejs/kit';
import { error } from '@sveltejs/kit';

export const load = async ({ params }: ServerLoadEvent) => {
	try {
		const post = await import(`../../../posts/${params.slug}.svx`);

		return {
			content: post.default,
			meta: post.metadata,
			url: `/blog/${params.slug}`
		};
		// eslint-disable-next-line @typescript-eslint/no-unused-vars
	} catch (err) {
		throw error(404, `Could not find ${params.slug}`);
	}
};
