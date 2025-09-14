# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Tiny CRM** application - a full-stack CRUD web app for managing contacts and notes. The architecture consists of:
- **Backend**: Rails 7+ API-only mode with PostgreSQL database
- **Frontend**: React application (planned to be in separate repo: `tiny_crm_ui`)
- **Database**: PostgreSQL with `contacts` and `notes` tables (one-to-many relationship)

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

### Features to Implement
- Contact search/filtering by name, company, or tag
- Note pinning functionality
- Basic ActiveRecord validations (required fields, email uniqueness)
- CORS configuration for React frontend

## Development Guidelines

### Rails Conventions
- Models: singular naming (e.g., `Contact`, `Note`)
- Controllers: plural naming (e.g., `ContactsController`, `NotesController`)
- Services: place in `app/services/` with verb-based naming
- Migrations: timestamped format `YYYYMMDDHHMMSS_description.rb`

### Code Style
- Ruby: 2-space indentation, snake_case for methods/files, CamelCase for classes
- JSON responses only (API-only mode)
- Use ActiveRecord scopes for search functionality

### Testing Strategy
- Add tests for all new functionality
- Prefer fast unit tests with targeted feature/system tests
- Test files: `*_spec.rb` (RSpec) or `*_test.rb` (Minitest)

## Security Notes
- Do not commit secrets - use Rails credentials or `.env` files
- CORS must be properly configured for React frontend
- Optional JWT or cookie-based authentication (stretch goal)

## Project Status
This is a greenfield project designed to be completed in a weekend. Focus on core CRUD functionality first, then add search and note features.