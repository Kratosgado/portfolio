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
    projectData: defineCollection({
      type: "data",
      source: "project-data/*.json",
      schema: z.object({
        name: z.string(),
        description: z.string(),
        github: z.string(),
        liveUrl: z.string().optional(),
        imageUrl: z.string().optional(),
        stack: z.array(z.string()).default([]),
        slug: z.string().optional(),
      }),
      indexes: [{ columns: ["name"] }],
    }),
    projects: defineCollection({
      type: "page",
      source: "projects/*.md",
      schema: z.object({
        title: z.string(),
        description: z.string(),
        coverImage: z.string().optional(),
        images: z.array(z.string()).default([]),
        github: z.string().optional(),
        liveUrl: z.string().optional(),
        stack: z.array(z.string()).default([]),
      }),
    }),
    certificates: defineCollection({
      type: "data",
      source: "certificates/*.json",
      schema: z.object({
        name: z.string(),
        organization: z.string(),
        date: z.string(),
        skills: z.string(),
        credential: z.string(),
      }),
      indexes: [{ columns: ["name"] }],
    }),
  },
});
