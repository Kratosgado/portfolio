import { defineContentConfig, defineCollection, z } from '@nuxt/content';

export default defineContentConfig({
  collections: {
    profile: defineCollection({
      type: 'data',
      source: 'profile.json',
      schema: z.object({
        name: z.string(),
        username: z.string(),
        bio: z.string(),
        email: z.string(),
        location: z.string(),
        github: z.string(),
        linkedin: z.string(),
        website: z.string(),
      }),
    }),
    projects: defineCollection({
      type: 'data',
      source: 'projects.json',
      schema: z.object({
        name: z.string(),
        description: z.string(),
        github: z.string(),
        liveUrl: z.string().optional(),
        imageUrl: z.string().optional(),
        stack: z.array(z.string()).optional(),
      }),
    }),
    certificates: defineCollection({
      type: 'data',
      source: 'certificates.json',
      schema: z.object({
        name: z.string(),
        organization: z.string(),
        date: z.string(),
        skills: z.string(),
        credential: z.string(),
      }),
    }),
  },
});
