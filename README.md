# Portfolio

Personal portfolio and resume site built with Nuxt 4, Nuxt UI v4, Tailwind CSS v4, and Nuxt Content v3.

## Features

- Landing page with hero, about, experience, projects, certifications, and contact sections
- Project pages rendered from markdown
- Multiple targeted resume variants at `/resume/<slug>`, printable or exportable to PDF
- Content editable in the browser through Nuxt Studio

## Content

All site data lives in `content/` and is validated by the schemas in `content.config.ts`:

| Path                    | Collection     | Format   |
| :---------------------- | :------------- | :------- |
| `content/profile.json`  | `profile`      | JSON     |
| `content/projects/`     | `projects`     | Markdown |
| `content/certificates/` | `certificates` | JSON     |
| `content/resumes/`      | `resumes`      | JSON     |

A resume project entry can set `toolRef` to a project slug to reuse that project's title, install count, and links.

## Development

Requires [bun](https://bun.sh).

```bash
bun install        # install dependencies and run `nuxt prepare`
bun run dev        # dev server at http://localhost:3000
bun run lint       # biome check
bun run typecheck  # nuxt typecheck
bun run build      # production build
bun run preview    # preview the production build
```

## Deployment

The same build deploys to two targets:

- **Vercel**: configured in `vercel.json` (default Nitro preset).
- **GitHub Pages**: `.github/workflows/deploy.yml` builds with `NITRO_PRESET=github_pages` on every push to `main` and publishes to `Kratosgado/Kratosgado.github.io`.

## License

See [LICENSE](LICENSE).
