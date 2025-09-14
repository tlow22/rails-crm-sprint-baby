# Repository Guidelines

## Project Structure & Module Organization
- Rails layout is assumed:
  - `app/` (models, controllers, views, jobs, services)
  - `config/` (environment, routes, credentials)
  - `db/` (migrations, schema)
  - `lib/` (framework‑agnostic helpers)
  - `spec/` or `test/` (unit/integration tests)
  - Frontend assets in `app/assets/` or `app/javascript/` (if using JS bundling)

## Build, Test, and Development Commands
- Setup: `bin/setup` (preferred). If unavailable: `bundle install && bin/rails db:setup`
- Run server: `bin/rails s` (Rails app on `http://localhost:3000`)
- Console: `bin/rails c` (quickly inspect models and services)
- Tests:
  - RSpec: `bundle exec rspec` (when `spec/` exists)
  - Minitest: `bin/rails test` (when `test/` exists)
- Lint/format (if configured): `bundle exec rubocop -A` and `bundle exec standardrb`

## Coding Style & Naming Conventions
- Ruby: 2‑space indent; `snake_case` for methods/files; `CamelCase` for classes/modules.
- Rails: models singular (e.g., `User`), controllers plural (e.g., `UsersController`).
- Migrations: timestamped names like `YYYYMMDDHHMMSS_add_index_to_users.rb`.
- Services/queries: place in `app/services/` and name as verbs (e.g., `Accounts::SyncJob`).

## Testing Guidelines
- Prefer fast unit tests; add feature/system tests for flows.
- Naming:
  - RSpec: files end with `_spec.rb`; describe classes and public behavior.
  - Minitest: files end with `_test.rb`; group by component.
- Run specific tests: `bundle exec rspec path/to/file_spec.rb:42` or `bin/rails test TEST=path/to/file_test.rb`.
- Aim to add tests with every change; do not reduce existing coverage.

## Commit & Pull Request Guidelines
- Use clear, imperative subjects: "Add accounts sync job".
- Recommended format (Conventional Commits): `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`.
- PRs should include:
  - Purpose and scope; link issues (e.g., `Closes #123`).
  - Screenshots for UI changes; sample requests/responses for API changes.
  - Migration notes and rollback strategy when applicable.

## Security & Configuration Tips
- Do not commit secrets. Use Rails credentials or `.env` (git‑ignored) for local dev.
- Document required env vars in `README` or `.env.example`.
