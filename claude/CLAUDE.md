# Global Claude Code Instructions

## Safety Rules

When making system-level changes (D-Bus calls, service modifications, package installs), explain what will happen and wait for confirmation before executing. Never chain destructive or state-changing system commands without pausing.

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
