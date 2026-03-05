import { defineContentConfig, defineCollection, z } from "@nuxt/content";

export default defineContentConfig({
  collections: {
    profile: defineCollection({
      type: "data",
      source: "profile.json",
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
      type: "page",
      source: "projects/*.md",
      schema: z.object({
        rank: z.number().default(10),
        title: z.string(),
        slug: z.string().optional(),
        description: z.string(),
        coverImage: z.string().optional(),
        images: z.array(z.string()).default([]),
        github: z.string().optional(),
        liveUrl: z.string().optional(),
        stack: z.array(z.string()).default([]),
      }),
      indexes: [{ columns: ["slug"] }],
    }),
    certificates: defineCollection({
      type: "data",
      source: "certificates/*.json",
      schema: z.object({
        rank: z.number().optional(),
        name: z.string(),
        organization: z.string(),
        date: z.string(),
        skills: z.string(),
        credential: z.string(),
      }),
    }),
  },
});
