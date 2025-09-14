# Repository Guidelines

## Project Overview
- Tiny CRM: Rails 7+ API‑only backend with PostgreSQL, React frontend in `frontend/` or `client/` within this repo.
- Domain: Contacts have many Notes. JSON responses only; API namespace `/api/v1`.

## Project Structure & Module Organization
- Rails:
  - `app/`, `config/`, `db/`, `lib/`, `spec/` or `test/`
- Frontend: `frontend/` or `client/` (React app)
- Services/jobs live in `app/services/` and `app/jobs/`.

## Build, Test, and Development Commands
- Setup: `bin/setup` or `bundle install && bin/rails db:setup`
- DB lifecycle: `bin/rails db:create db:migrate db:seed`
- Server/console: `bin/rails s` at `http://localhost:3000`, `bin/rails c`
- Tests: RSpec `bundle exec rspec` or Minitest `bin/rails test`
- Lint/format: `bundle exec rubocop -A` or `bundle exec standardrb`

## API Surface
- Contacts: `GET/POST /api/v1/contacts`, `GET/PATCH/DELETE /api/v1/contacts/:id`
- Notes (nested): `GET/POST /api/v1/contacts/:contact_id/notes`, `PATCH/DELETE /api/v1/contacts/:contact_id/notes/:id`

## Coding Style & Naming Conventions
- Ruby: 2‑space indent; `snake_case` for methods/files; `CamelCase` for classes/modules.
- Rails: models singular (`Contact`, `Note`), controllers plural (`ContactsController`).
- Routes: namespace under `/api/v1`; enable CORS for frontend.
- Migrations: `YYYYMMDDHHMMSS_description.rb`. Use ActiveRecord scopes for search/filtering.

## Testing Guidelines
- Add tests for new behavior; do not reduce coverage.
- File names: RSpec `*_spec.rb`, Minitest `*_test.rb`.
- Run specific: `bundle exec rspec path/to/file_spec.rb:42` or `bin/rails test TEST=path/to/file_test.rb`.

## Commit & Pull Request Guidelines
- Imperative subjects: "Add contacts search scope".
- Prefer Conventional Commits: `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`.
- PRs: purpose/scope, linked issues (`Closes #123`), screenshots for UI, sample API requests, migration/rollback notes if relevant.

## Security & Configuration Tips
- Never commit secrets; use Rails credentials or `.env` (git‑ignored). Provide `.env.example` when needed.
- Configure CORS for the React origin.

## Agent‑Specific Instructions
- Teach as you code: briefly explain changes and trade‑offs.
- Delegate framework commands (e.g., generators, installs) to the user when possible to reinforce learning.
