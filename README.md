# Tiny CRM - Rails + React Monorepo

Full-stack CRUD app for managing contacts and notes. Rails 8 API + PostgreSQL + React frontend.

## Quick Start

**Prerequisites:** Docker, Docker Compose, Make

```bash
# One-time setup
make setup

# Start development
make up-logs

# Access
# Rails: http://localhost:3000
# React: http://localhost:3001 (future)
```

## Make Commands

```bash
make help           # Show all commands
make setup          # Build containers + setup database
make up             # Start all services (background)
make up-logs        # Start with logs (foreground)
make down           # Stop all services
make reset          # Clean + rebuild everything

# Development
make shell-rails    # Rails console in container
make shell-postgres # PostgreSQL shell
make migrate        # Run migrations
make seed           # Seed database
make test           # Run Rails tests
make logs           # View all logs
make clean          # Clean containers/volumes
```

## Project Structure

```
├── mini-crm/           # Rails 8 backend
│   ├── app/models/     # Contact, Note models
│   ├── app/controllers/# Web + API controllers
│   └── config/         # Database, routes, env
├── frontend/           # React app (planned)
├── docker-compose.yml  # Multi-service orchestration
├── Makefile           # Developer commands
└── progress.md        # Development tracking
```

## API Endpoints (Planned)

```
GET    /api/v1/contacts
POST   /api/v1/contacts
GET    /api/v1/contacts/:id
PATCH  /api/v1/contacts/:id
DELETE /api/v1/contacts/:id

GET    /api/v1/contacts/:contact_id/notes
POST   /api/v1/contacts/:contact_id/notes
PATCH  /api/v1/contacts/:contact_id/notes/:id
DELETE /api/v1/contacts/:contact_id/notes/:id
```

## Database Schema

**Contacts:** first_name, last_name, email (unique), phone, company, tags, next_follow_up_date
**Notes:** content, pinned, contact_id, timestamps

## Development Workflow

1. **Database changes:** `make migrate` or `make shell-rails` → `bin/rails db:migrate`
2. **Test changes:** `make test`
3. **View data:** Web UI at http://localhost:3000 or `make shell-postgres`
4. **Debug:** `make logs-rails` or `make shell-rails`

## Troubleshooting

```bash
# Database connection issues
make down && make up

# Clean restart
make reset

# Check container status
docker-compose ps

# Manual database setup
make shell-rails
bin/rails db:create db:migrate db:seed
```

## Tech Stack

- **Backend:** Rails 8, PostgreSQL 15, Docker
- **Frontend:** React + Vite, Tailwind CSS (planned)
- **Tools:** Docker Compose, Make, dotenv