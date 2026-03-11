import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const posts = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/posts' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    date: z.string().transform((str) => new Date(str)),
    image: z.string().optional(),
    imageAlt: z.string().optional(),
    category: z.enum([
      'Allgemein',
      'Engagement',
      'Events',
      'Termine',
      'Uncategorized',
    ]),
    tags: z.array(z.string()).default([]),
  }),
});

export const collections = { posts };
