# Frontend Development Principles

Read and apply these principles throughout development. For detailed review guidance, see REVIEW.md.

---

## YAGNI (You Aren't Gonna Need It)

- Only implement features explicitly specified in requirements
- Remove any speculative code before completion
- Wait until abstractions are needed (don't build frameworks upfront)

---

## KISS (Keep It Simple, Stupid)

- Prefer straightforward solutions over clever ones
- Use clear, obvious code patterns
- Choose readability over brevity

---

## DRY (Don't Repeat Yourself)

- Extract repeated code into reusable functions/components
- Use variables for values that appear multiple times
- But: Don't over-abstract until patterns are clear

---

## Single Responsibility

- Each function/component should do one thing well
- Split functions that do multiple unrelated tasks
- Separate data fetching from rendering
- Keep concerns properly separated (structure, style, behavior)

---

## Readable Code

- Use descriptive variable and function names
- Add comments for "why" not "what"
- Keep consistent formatting
- Break complex expressions into named variables

---

## Accessibility

- Use semantic HTML elements
- Avoid non-semantic interactive elements (e.g., clickable divs)
- Include ARIA labels where needed
- Ensure keyboard navigation works
- Provide text alternatives for images
- Maintain sufficient color contrast

---

## Error Handling

- Handle API failures gracefully
- Provide user feedback when operations fail
- Don't assume happy path (network, permissions, external services)
- Fail gracefully with clear messages

---

## State Management

- Keep state as close to where it's used as possible
- Make data flow clear and predictable
- Avoid global state unless necessary
- Use consistent patterns for state updates

---

## Performance Budget

- Keep initial bundle size reasonable (aim for <100kb initial load)
- Optimize images and assets
- Lazy load when appropriate
- Don't load unnecessary libraries

---

## Constraints & Precedence

**Tooling Bias:**
- Prefer browser-native APIs over libraries when functionality exists
- Avoid build tools unless required by project constraints
- Minimize dependencies - each one adds maintenance burden

**When Principles Conflict:**
1. YAGNI (don't build it yet)
2. KISS (keep it simple)
3. Readable Code (make it clear)
4. DRY (don't repeat yourself)

Favor earlier principles when forced to choose.

---

## Quick Checklist

Before publishing, verify code follows these principles:
- [ ] YAGNI
- [ ] KISS  
- [ ] DRY
- [ ] Single Responsibility
- [ ] Readable Code
- [ ] Accessibility
- [ ] Error Handling
- [ ] State Management
- [ ] Performance Budget

For detailed review guidance, see REVIEW.md
