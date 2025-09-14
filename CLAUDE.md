# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Tiny CRM** application - a full-stack CRUD web app for managing contacts and notes. The project is designed as a **learning experience** for the human developer to understand Rails API + React integration. The architecture consists of:

- **Backend**: Rails 7+ API-only mode with PostgreSQL database
- **Frontend**: React application (in this monorepo under `frontend/` or `client/`)
- **Database**: PostgreSQL with `contacts` and `notes` tables (one-to-many relationship)
- **Timeline**: Weekend project focusing on core CRUD functionality first

## Learning-Focused Development Approach

**IMPORTANT**: This project prioritizes learning over speed. Always:
- **Teach as you code**: Explain what you're doing and why
- **Delegate framework commands**: Ask the user to run `bin/rails generate`, `bundle install`, etc. so they learn the Rails workflow
- **Explain architectural decisions**: Help the user understand Rails conventions and patterns
- **Show alternatives**: When possible, mention different approaches and trade-offs

## Development Commands

### Setup

- Initial setup: `bin/setup` (preferred) or `bundle install && bin/rails db:setup`
- Database setup: `bin/rails db:create db:migrate db:seed`

### Running the Application

- Rails API server: `bin/rails s` (runs on `http://localhost:3000`)
- Rails console: `bin/rails c`

### Testing

- RSpec (when `spec/` exists): `bundle exec rspec`
- Minitest (when `test/` exists): `bin/rails test`
- Run specific test: `bundle exec rspec path/to/file_spec.rb:42`

### Code Quality

- Linting/formatting: `bundle exec rubocop -A` or `bundle exec standardrb`

## API Architecture

### RESTful Endpoints (under `/api/v1`)

- **Contacts**: `/api/v1/contacts` - CRUD operations for contacts
- **Notes**: `/api/v1/contacts/:contact_id/notes` - CRUD operations for notes (nested under contacts)

### Key Models

- **Contact**: first_name, last_name, email (unique), phone, company, tags, next_follow_up_date
- **Note**: content, contact_id (foreign key), pinned (boolean), timestamps

### Core Features (Priority Order)

**Contacts**
- Create, view, update, and delete contacts
- Fields: first_name, last_name, email (unique), phone, company, tags, next_follow_up_date
- Search/filter by name, company, or tag
- Basic ActiveRecord validations (required fields, email uniqueness)

**Notes**
- Add notes to a specific contact (nested resource)
- View all notes for a contact (sorted by date)
- Edit or delete a note
- Pin/unpin important notes

**Technical Requirements**
- CORS configuration for React frontend
- JSON responses only
- RESTful API design under `/api/v1`
- Seed file to populate sample data

### UI/UX Goals (Frontend)
- Contact list (table or cards) with search box and "New Contact" button
- Contact detail page showing contact info and notes section
- Modal or inline form for adding/editing notes
- Basic styling (Tailwind CSS)
- Responsive layout (mobile and desktop)

### Non-Goals (Defer for Later)
- User authentication/authorization beyond minimal setup
- Complex tagging or reporting features
- Advanced UI (drag-and-drop, animations)
- Multi-user or team sharing

### Stretch Goals
- "Next follow-up" reminders on contact list
- Pinned notes with badge or priority ordering
- Pagination or infinite scroll for contacts
- Deploy live demo

## Development Guidelines

### Project Structure & Module Organization
- Rails layout:
  - `app/` (models, controllers, views, jobs, services)
  - `config/` (environment, routes, credentials)
  - `db/` (migrations, schema)
  - `lib/` (framework-agnostic helpers)
  - `spec/` or `test/` (unit/integration tests)

### Rails Conventions & Naming
- **Models**: singular naming (e.g., `Contact`, `Note`)
- **Controllers**: plural naming (e.g., `ContactsController`, `NotesController`)
- **Services**: place in `app/services/` with verb-based naming
- **Migrations**: timestamped format `YYYYMMDDHHMMSS_description.rb`

### Code Style
- **Ruby**: 2-space indentation, snake_case for methods/files, CamelCase for classes/modules
- **JSON responses only** (API-only mode)
- **ActiveRecord scopes** for search functionality
- **Route namespacing**: All API routes under `/api/v1/`

### Testing Strategy
- **Add tests for all new functionality** - aim to not reduce existing coverage
- **Prefer fast unit tests** with targeted feature/system tests for flows
- **Test files**: `*_spec.rb` (RSpec) or `*_test.rb` (Minitest)
- **Run specific tests**: `bundle exec rspec path/to/file_spec.rb:42` or `bin/rails test TEST=path/to/file_test.rb`

### Commit Guidelines
- **Clear, imperative subjects**: "Add accounts sync job"
- **Conventional Commits format**: `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`
- **Include purpose and scope** in PRs; link issues (e.g., `Closes #123`)
- **Screenshots for UI changes**; sample requests/responses for API changes
- **Migration notes and rollback strategy** when applicable

## Security & Configuration

- **Never commit secrets** - use Rails credentials or `.env` (git-ignored) files for local dev
- **Document required env vars** in `README` or `.env.example`
- **CORS must be properly configured** for React frontend
- **Optional JWT or cookie-based authentication** (stretch goal)

## Frontend Goals (Monorepo Structure)

**Technology Stack**
- **React** with Vite or Create React App for scaffolding
- **React Router** for navigation (Contacts list → Contact detail)
- **React Query or fetch/axios** for API calls
- **Tailwind CSS** for styling
- **Responsive layout** (mobile and desktop)

**Deployment Options (If Time Permits)**
- **Backend**: Render or Railway
- **Frontend**: Netlify or Vercel
- **Database**: PostgreSQL hosted on Supabase or Render

## Project Status & Next Steps

This is a **greenfield learning project** designed to be completed in a weekend.

**Immediate priorities:**
1. Set up Rails API-only application
2. Create Contact and Note models with proper associations
3. Build RESTful controllers with JSON responses
4. Add basic validations and seed data
5. Configure CORS for future frontend integration

**Development flow**: Start with backend CRUD, add search functionality, then create the React frontend in a `frontend/` or `client/` directory within this repo.
