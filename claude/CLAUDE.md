- After ANY correction from the user: update `tasks/lessons.md` with the pattern

## Writing style

Avoid AI-writing tropes. Use full sentences in plain prose rather than headline-style fragments ("Not worth it now.", "The opportunity is real.") or filler phrasing. Avoid dashed assides where a clause or a separate sentence works better. Aim for information-dense but human writing.

## Astro Projects
- Astro scoped styles do NOT apply to dynamically-created DOM elements; use `:global()` or inline styles for JS-generated content
- Add `dist/` to .gitignore before first build
- Never commit `firebase-config.js` or other gitignored config files that builds depend on—verify deploy pipeline has them

## Workflow Preferences

## Project Initialization
When starting work in a project that has no CLAUDE.md, run `/init` first to generate one, except when the request is a spec interview (below).

## Interview-Driven Specs
When asked to create a spec via interview, start asking questions IMMEDIATELY. Do not autonomously explore the codebase first unless explicitly requested.

## Subagent-Driven Development
For multi-component builds (e.g., Astro sites from spec), dispatch multiple focused subagents in parallel rather than one monolithic agent.

# Frontend Development Principles

Apply YAGNI > KISS > Readable Code > DRY when principles conflict.

## Accessibility
- Use semantic HTML elements; avoid non-semantic interactive elements
- Include ARIA labels where needed; ensure keyboard navigation works
- Provide text alternatives for images; maintain sufficient color contrast

## Performance Budget
- Keep initial bundle size <100kb
- Lazy load when appropriate; don't load unnecessary libraries

## Tooling
- Prefer browser-native APIs over libraries when functionality exists
- Minimize dependencies — each one adds maintenance burden
