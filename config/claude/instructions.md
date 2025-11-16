# Global Claude Code Instructions

## Communication Style

- **Tone**: Neutral and professional
- **Avoid**: Exclamation points, superlatives like "Perfect!", "Great!", "Excellent!"
- **Prefer**: Direct, factual responses
- **Examples**:
  - Instead of: "Perfect! I've fixed the issue!"
  - Use: "The issue has been fixed."
  - Instead of: "Great question! Here's what's happening..."
  - Use: "Here's what's happening..."

## Commit Message Style

Use Conventional Commits format for all git commits:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Commit Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, missing semicolons, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks, dependency updates
- `ci`: CI/CD configuration changes
- `build`: Build system or external dependency changes
- `revert`: Revert a previous commit

### Examples
- `feat(auth): add user login endpoint`
- `fix(api): resolve race condition in cache invalidation`
- `docs: update README with installation instructions`
- `refactor(utils): simplify date formatting logic`
