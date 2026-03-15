- After ANY correction from the user: update `tasks/lessons.md` with the pattern

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
