# Frontend Development Principles - Detailed Review Guide

Use this comprehensive guide during spec review and before publishing. For quick reference during development, see CLAUDE.md.

---

## YAGNI (You Aren't Gonna Need It)

**Claude should:**
- Only implement features explicitly specified in requirements
- Avoid adding "nice to have" functionality not requested
- Resist building abstractions or frameworks until actually needed
- Remove any speculative code before completion

**I should check:**
- Is there code for features I didn't request?
- Are there unused functions, components, or utilities?
- Did Claude build abstractions before they're necessary?

**Red flags:**
- "I added this in case you need it later..."
- Configuration systems for single use cases
- Generic utilities that aren't used
- Framework code for simple problems

**Good example:**
```javascript
// Simple, direct solution
function calculateTotal(price, tax) {
  return price + (price * tax);
}
```

**Bad example:**
```javascript
// Over-engineered for future flexibility
class Calculator {
  constructor(operations = {}) {
    this.operations = operations;
  }
  calculate(type, ...args) {
    return this.operations[type](...args);
  }
}
```

---

## KISS (Keep It Simple, Stupid)

**Claude should:**
- Prefer straightforward solutions over clever ones
- Use clear, obvious code patterns
- Avoid unnecessary complexity or abstractions
- Choose readability over brevity when in conflict

**I should check:**
- Can I understand what this code does at a glance?
- Is there a simpler way to solve this problem?
- Is Claude being clever when clear would be better?

**Red flags:**
- Code that requires multiple readings to understand
- One-liners that obscure meaning
- Nested ternaries
- Regex for simple string operations

**Good example:**
```javascript
// Clear intent
if (user.isAdmin) {
  showAdminPanel();
}
```

**Bad example:**
```javascript
// Unnecessarily clever
user.isAdmin && showAdminPanel();
```

---

## DRY (Don't Repeat Yourself)

**Claude should:**
- Extract repeated code into reusable functions/components
- Use variables for values that appear multiple times
- Create shared utilities for common operations
- But: Don't over-abstract—wait for clear patterns (see YAGNI)

**I should check:**
- Are there copy-pasted code blocks?
- Do the same values appear multiple times without variables?
- Are similar patterns repeated without shared abstractions?

**Red flags:**
- Three or more instances of nearly identical code
- Magic numbers scattered throughout
- Copy-pasted event handlers
- Repeated validation logic

**Rule of three:** Don't abstract until you see the pattern three times

---

## Single Responsibility Principle

**Claude should:**
- Each function/component should do one thing well
- Split functions that do multiple unrelated tasks
- Keep components focused on a single purpose
- Separate data fetching from rendering

**I should check:**
- Does this function/component have a clear, single purpose?
- Are there "and" statements in function names? (e.g., "fetchAndDisplay")
- Would I struggle to name this in one or two words?

**Red flags:**
- Functions longer than 50 lines
- Components doing multiple unrelated things
- Mixed concerns (data + presentation + logic)
- Names with "Manager", "Handler", "Utility"

**Good example:**
```javascript
// Single purpose: fetch data
async function fetchUserData(userId) {
  const response = await fetch(`/api/users/${userId}`);
  return response.json();
}

// Single purpose: display data
function UserProfile({ userData }) {
  return <div>{userData.name}</div>;
}
```

**Bad example:**
```javascript
// Multiple responsibilities
async function fetchAndDisplayUser(userId) {
  const response = await fetch(`/api/users/${userId}`);
  const data = await response.json();
  document.getElementById('profile').innerHTML = data.name;
  trackAnalytics('profile_viewed', data.id);
}
```

---

## Separation of Concerns

**Claude should:**
- Keep HTML structure, CSS styling, and JS behavior separate
- Don't mix business logic with UI rendering
- Separate data fetching from data display
- Use clear boundaries between different system layers

**I should check:**
- Is styling mixed into JavaScript logic?
- Are API calls mixed with rendering code?
- Can I modify one layer without touching others?

**Red flags:**
- Inline styles in JavaScript
- Business logic in components
- Tightly coupled code
- No clear layer boundaries

---

## Readable Code

**Claude should:**
- Use descriptive variable and function names
- Add comments for "why" not "what"
- Keep consistent formatting and style
- Break complex expressions into named variables

**I should check:**
- Can I understand what variables represent without comments?
- Are function names clear about what they do?
- Is the code formatted consistently?

**Red flags:**
- Single-letter variables (except loop counters)
- Cryptic abbreviations
- Unclear logic flow
- Comments explaining what code does (should be obvious)

**Good example:**
```javascript
// Descriptive names make intent clear
const userIsEligibleForDiscount = 
  user.age >= 65 || user.isPremiumMember;

if (userIsEligibleForDiscount) {
  applyDiscount();
}
```

**Bad example:**
```javascript
// Cryptic and unclear
const x = u.a >= 65 || u.p;
if (x) { d(); }
```

---

## Accessibility

**Claude should:**
- Use semantic HTML elements (nav, article, button, etc.)
- Include ARIA labels for interactive elements
- Ensure keyboard navigation works throughout
- Provide text alternatives for images (alt text)
- Maintain sufficient color contrast (WCAG AA minimum)
- Focus states are visible
- Form inputs have associated labels

**I should check:**
- Can I navigate the entire UI with keyboard only?
- Do interactive elements have clear, descriptive labels?
- Is the HTML structure semantic (not div soup)?
- Are images described with alt text?
- Can screen readers understand the interface?

**Red flags:**
- Clickable divs instead of buttons
- Missing alt text on images
- No visible focus indicators
- Inputs without labels
- Color as the only indicator of state

**Good example:**
```html
<button 
  aria-label="Close dialog"
  onclick="closeDialog()"
>
  ×
</button>
```

**Bad example:**
```html
<div onclick="closeDialog()">×</div>
```

---

## Error Handling

**Claude should:**
- Handle API failures gracefully with user-friendly messages
- Provide clear feedback when operations fail
- Never assume the happy path
- Consider edge cases: network failures, missing permissions, external service downtime
- Fail gracefully with helpful error messages

**I should check:**
- What happens when the API returns an error?
- What happens when the network is offline?
- Are errors shown to the user in a helpful way?
- Does the app recover gracefully from failures?

**Red flags:**
- No error handling for API calls
- Generic "Something went wrong" messages
- Console errors instead of user feedback
- App crashes on failed requests

**Good example:**
```javascript
async function saveData(data) {
  try {
    const response = await fetch('/api/save', {
      method: 'POST',
      body: JSON.stringify(data)
    });
    
    if (!response.ok) {
      throw new Error('Failed to save');
    }
    
    showSuccessMessage('Data saved successfully');
  } catch (error) {
    showErrorMessage('Unable to save. Please check your connection and try again.');
    console.error('Save error:', error);
  }
}
```

**Bad example:**
```javascript
async function saveData(data) {
  const response = await fetch('/api/save', {
    method: 'POST',
    body: JSON.stringify(data)
  });
  
  const result = await response.json();
  showSuccessMessage('Saved!');
}
```

---

## State Management

**Claude should:**
- Keep state as close to where it's used as possible
- Make data flow clear and predictable
- Avoid global state unless truly necessary
- Use consistent patterns for state updates
- Minimize state - derive values when possible

**I should check:**
- Is it clear where this data lives?
- Can I trace how state changes?
- Is state unnecessarily global or lifted?
- Are there conflicting sources of truth?

**Red flags:**
- State duplicated in multiple places
- Unclear data flow
- Global state for local concerns
- Inconsistent update patterns

**Good example:**
```javascript
// State lives close to usage
function TodoList() {
  const [todos, setTodos] = useState([]);
  
  function addTodo(text) {
    setTodos([...todos, { id: Date.now(), text }]);
  }
  
  return /* ... */;
}
```

**Bad example:**
```javascript
// Unnecessary global state
window.appState = {
  todos: [],
  user: null,
  settings: {}
};

function addTodo(text) {
  window.appState.todos.push({ id: Date.now(), text });
}
```

---

## Performance Budget

**Claude should:**
- Keep initial bundle size reasonable (target <100kb gzipped)
- Optimize and compress images
- Use lazy loading for below-the-fold content
- Avoid loading large libraries for small features
- Minimize render-blocking resources

**I should check:**
- Are there large dependencies added for minor features?
- Are images optimized and appropriately sized?
- Is the app fast on mobile/slow connections?
- Are there obvious performance issues?

**Red flags:**
- Large libraries (like Moment.js) for simple tasks
- Unoptimized images (>1MB)
- Everything loads on initial page load
- No code splitting for large apps

**Performance checklist:**
- Images are compressed and sized appropriately
- CSS is minified
- JavaScript bundle is reasonable size
- No blocking resources on critical path
- Fast on 3G network

---

## Avoid Premature Optimization

**Claude should:**
- Write clear, working code first
- Only optimize when there's a demonstrated performance problem
- Profile before optimizing to identify actual bottlenecks
- Prefer readability unless performance is critical

**I should check:**
- Is there complex optimization code for unproven performance issues?
- Is the code harder to read for unclear performance gains?
- Did Claude optimize before proving there's a problem?

**Red flags:**
- Memoization everywhere "just in case"
- Complex caching for fast operations
- Micro-optimizations that hurt readability
- "This might be slow" without evidence

**Rule:** Make it work, make it right, make it fast (in that order)

---

## Extended Checklist

Before publishing, verify:

**Core Principles:**
- [ ] **YAGNI:** No speculative features or unused code
- [ ] **KISS:** Solutions are straightforward and clear
- [ ] **DRY:** No repeated code blocks or magic numbers
- [ ] **Single Responsibility:** Each piece has one clear purpose
- [ ] **Separation:** Concerns are properly separated
- [ ] **Readable:** Names are descriptive, logic is clear

**User Experience:**
- [ ] **Accessible:** Keyboard navigation, semantic HTML, ARIA labels, sufficient contrast
- [ ] **Error Handling:** Graceful failures with user-friendly messages
- [ ] **Performance:** Fast load (<3s on 3G), optimized assets, reasonable bundle size

**Code Quality:**
- [ ] **State:** Clear data flow, minimal global state, single source of truth
- [ ] **No Premature Optimization:** Complex optimizations are justified by profiling

**Final Checks:**
- [ ] Does it work correctly?
- [ ] Can I understand the code?
- [ ] Would I be comfortable maintaining this in 6 months?

---

## Notes

- These principles sometimes conflict—use judgment
- Simple working code beats complex perfect code
- When in doubt, choose clarity over cleverness
- It's easier to optimize working code than debug clever code
- Code should be optimized for reading, not writing
