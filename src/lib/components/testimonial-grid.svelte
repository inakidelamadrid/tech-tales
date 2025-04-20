<script lang="ts">
	import Testimonial from './testimonial.svelte';

	// You can define your testimonials data here or pass it as a prop
	export let testimonials = [
		{
			quote:
				'Ignacio would start the morning with a sunshine emoji in the chat window. He was delivering code on his second day, quick to take on projects, and with a deep love of learning. It was a pleasure to work with Ignacio at Insureon. I enjoyed his energy, curiosity, intelligence, and growth mindset.',
			author: 'Ezra Match',
			company: 'Engineering Manager at Insureon',
			icon: 'document'
		},
		{
			quote:
				"Besides being a joy to work with, Ignacio is a take-charge person who is able to present creative ideas and communicate the benefits.He's a quick learner and a self taught person always looking to improve his skills.",
			author: 'Manuel Gutierrez',
			company: 'Devops Engineer at Michelada.io',
			icon: 'document'
		},

		{
			quote:
				'Ignacio worked at ModCloth on our e-commerce Rails application when I joined to lead the team. He was always a pure pleasure to work with, very personable and warm individual. When we introduced test driven development (TDD) to our development process, Ignacio was very quick to accept and pick up the new process, a lot quicker than many other developers.',
			author: 'Konstantin Gredeskoul',
			company: 'Engineering Manager at ModCloth',
			icon: 'document'
		}
	];
</script>

<div class="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
	{#each testimonials as testimonial}
		<div class="h-full">
			<Testimonial
				quote={testimonial.quote}
				author={testimonial.author}
				company={testimonial.company}
				icon={testimonial.icon}
			/>
		</div>
	{/each}
</div>
