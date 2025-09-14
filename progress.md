# Tiny CRM Development Progress

**Project Start Date:** September 14, 2024
**Goal:** Build a full-stack CRUD web app (Rails + React) for managing contacts and notes in a weekend

## Project Overview
- **Architecture:** Monorepo with Rails backend (`mini-crm/`) + React frontend (`frontend/`)
- **Database:** PostgreSQL with contacts → notes (one-to-many relationship)
- **Learning Focus:** Understanding Rails API + React integration patterns

---

## Phase 1: Project Setup & Infrastructure ✅

### Completed Tasks
- [x] **Repository Setup** - Created monorepo structure
- [x] **Documentation** - Created CLAUDE.md and AGENTS.md for development guidance
- [x] **Rails Application** - Generated Rails 8 application with PostgreSQL
- [x] **Gitignore Configuration** - Set up comprehensive .gitignore for monorepo
- [x] **Monorepo Structure** - Organized backend in `mini-crm/` directory

### Key Decisions Made
- ✅ **Full Rails vs API-only:** Chose full Rails for visual feedback during learning
- ✅ **Monorepo vs Separate Repos:** Chose monorepo for simpler development workflow
- ✅ **Database:** PostgreSQL configured (pending connection setup)

---

## Phase 2: Database & Models 🚧

### Current Status: IN PROGRESS
**Blocker:** PostgreSQL connection issue - server not running locally

### Pending Tasks
- [ ] **PostgreSQL Setup** - Install and start PostgreSQL service
- [ ] **Database Creation** - Run `bin/setup` or `bin/rails db:create`
- [ ] **Contact Model** - Generate model with fields: first_name, last_name, email, phone, company, tags, next_follow_up_date
- [ ] **Note Model** - Generate model with fields: content, pinned, contact_id (foreign key)
- [ ] **Associations** - Set up Contact has_many :notes, Note belongs_to :contact
- [ ] **Validations** - Add ActiveRecord validations (required fields, email uniqueness)
- [ ] **Database Migration** - Run migrations to create tables

### Technical Decisions Needed
- [ ] PostgreSQL installation method (Homebrew vs Docker vs Postgres.app)

---

## Phase 3: Rails Controllers & Views 📋

### Planned Tasks
- [ ] **Contact Scaffold** - Generate complete CRUD interface with `rails generate scaffold`
- [ ] **Note Scaffold** - Generate nested resource under contacts
- [ ] **Routes Configuration** - Set up nested routes for notes under contacts
- [ ] **Seed Data** - Create sample contacts and notes for testing
- [ ] **Basic Styling** - Apply minimal styling to generated views

---

## Phase 4: API Layer 📋

### Planned Tasks
- [ ] **API Namespace** - Create `/api/v1` namespace in routes
- [ ] **API Controllers** - Build JSON-only controllers for contacts and notes
- [ ] **CORS Configuration** - Enable CORS for future React frontend
- [ ] **API Testing** - Test endpoints with curl/Postman
- [ ] **Error Handling** - Implement consistent JSON error responses

---

## Phase 5: Frontend Development 📋

### Planned Tasks
- [ ] **React Setup** - Create React application in `frontend/` directory
- [ ] **Routing** - Set up React Router (Contacts list → Contact detail)
- [ ] **API Integration** - Connect React to Rails API endpoints
- [ ] **Component Structure** - Build Contact list, detail, and form components
- [ ] **Styling** - Apply Tailwind CSS for responsive design
- [ ] **Note Management** - Add note CRUD functionality within contact details

---

## Phase 6: Polish & Features 📋

### Core Features
- [ ] **Search & Filter** - Add contact search by name, company, tag
- [ ] **Note Pinning** - Implement pin/unpin functionality for important notes
- [ ] **Form Validation** - Add client-side validation matching backend
- [ ] **Error Handling** - Graceful error handling in UI

### Stretch Goals (If Time Permits)
- [ ] **Follow-up Reminders** - Display next follow-up dates on contact list
- [ ] **Pagination** - Add pagination or infinite scroll for contacts
- [ ] **Deployment** - Deploy to Render/Railway (backend) and Netlify/Vercel (frontend)

---

## Learning Checkpoints

### Rails Concepts Covered
- [ ] Rails application structure and conventions
- [ ] ActiveRecord models and associations
- [ ] Database migrations and schema design
- [ ] Rails routing and nested resources
- [ ] Controller patterns (web vs API)
- [ ] Rails generators and scaffolding

### React Concepts To Cover
- [ ] Component composition and state management
- [ ] API integration with fetch/axios
- [ ] React Router for navigation
- [ ] Form handling and validation
- [ ] Responsive design with Tailwind CSS

---

## Current Blocker

**Issue:** PostgreSQL connection failure
**Error:** `connection to server on socket "/tmp/.s.PGSQL.5432" failed`
**Next Step:** Install and start PostgreSQL service locally

**Options to resolve:**
1. Install via Homebrew: `brew install postgresql@15 && brew services start postgresql@15`
2. Use Docker container: `docker run --name postgres-crm -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres:15`
3. Use Postgres.app for macOS

---

## Session Notes
- **Learning approach confirmed:** Prioritizing understanding over speed
- **Architecture decisions made:** Full Rails + React monorepo structure
- **Next immediate task:** Resolve PostgreSQL connection to proceed with database setup