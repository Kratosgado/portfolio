import { defineContentConfig, defineCollection, z } from "@nuxt/content";

const linkSchema = z.object({ label: z.string(), url: z.string() });

export default defineContentConfig({
  collections: {
    resumes: defineCollection({
      type: "data",
      source: "resumes/*.json",
      schema: z.object({
        slug: z.string(),
        title: z.string(),
        targetRole: z.string().optional(),
        isDefault: z.boolean().optional(),
        header: z.object({
          name: z.string(),
          links: z.array(linkSchema),
        }),
        profile: z.string(),
        education: z.array(
          z.object({
            institution: z.string(),
            degree: z.string(),
            period: z.string(),
            bullets: z.array(z.string()).default([]),
          })
        ),
        skills: z.array(
          z.object({
            category: z.string(),
            items: z.array(z.string()),
          })
        ),
        experience: z.array(
          z.object({
            company: z.string(),
            role: z.string(),
            period: z.string(),
            location: z.string(),
            url: z.string().optional(),
            bullets: z.array(z.string()),
          })
        ),
        projects: z.array(
          z.object({
            toolRef: z.string().optional(),
            name: z.string().optional(),
            year: z.string().optional(),
            links: z.array(linkSchema).default([]),
            bullets: z.array(z.string()),
          })
        ),
      }),
    }),
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
        toolType: z.enum(["vscode-extension", "neovim-plugin", "intellij-plugin", "cli", "library"]).optional(),
        installs: z.number().optional(),
        year: z.string().optional(),
        resumeBullets: z.array(z.string()).default([]),
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
