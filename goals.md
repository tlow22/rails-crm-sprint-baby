# Project: Tiny CRM – Contacts + Notes

Goal: Build a simple full-stack CRUD web app using Ruby on Rails (API backend), React (frontend), and PostgreSQL (database). It should allow users to manage contacts and add notes to them. Designed to be completed in a weekend.

⸻

1. Objectives
	•	Learn Rails API + React integration.
	•	Ship a working CRUD app (create, read, update, delete).
	•	Provide clean, extendable architecture for future features.

⸻

2. Core Features

Contacts
	•	Create, view, update, and delete contacts.
	•	Fields: first name, last name, email, phone, company, tags, next follow-up date.
	•	Search/filter by name, company, or tag.

Notes
	•	Add notes to a specific contact.
	•	View all notes for a contact (sorted by date).
	•	Edit or delete a note.
	•	Pin/unpin important notes.

UI/UX
	•	React app with:
	•	Contact list (table or cards) with search box and “New Contact” button.
	•	Contact detail page showing contact info and notes section.
    
	•	Modal or inline form for adding/editing notes.
	•	Basic styling (Tailwind or similar).

Database
	•	PostgreSQL with two tables: contacts and notes.
	•	One-to-many relationship: contact → notes.
	•	Seed file to populate sample contacts and notes.

⸻

3. Technical Requirements

Backend (Rails)
	•	Rails 7+ in API-only mode.
	•	RESTful endpoints for contacts and notes under /api/v1.
	•	JSON responses only.
	•	Use ActiveRecord validations for required fields and email uniqueness.
	•	CORS enabled for the React frontend.
	•	Include basic search scope for contacts.
	•	Optional: simple JWT or cookie-based auth if time allows.

Frontend (React)
	•	Vite or Create React App for scaffolding.
	•	Use React Router for navigation (Contacts list → Contact detail).
	•	Use React Query or fetch/axios for API calls.
	•	Tailwind CSS for styling.
	•	Responsive layout (mobile and desktop).

Deployment (Optional if time)
	•	Use Render or Railway for backend.
	•	Use Netlify or Vercel for frontend.
	•	PostgreSQL hosted on Supabase or Render.

⸻

4. Non-Goals (Defer for later)
	•	User authentication/authorization beyond minimal setup.
	•	Complex tagging or reporting features.
	•	Advanced UI (drag-and-drop, animations).
	•	Multi-user or team sharing.

⸻

5. Stretch Goals (If Time Permits)
	•	Add “next follow-up” reminders on the contact list.
	•	Implement pinning for notes with a small badge or priority ordering.
	•	Add pagination or infinite scroll for contacts.
	•	Deploy live demo.

⸻

6. Deliverables
	•	Rails backend repo (tiny_crm_api).
	•	React frontend repo (tiny_crm_ui).
	•	README in each repo with:
	•	Setup instructions (install dependencies, create DB, run migrations, start servers).
	•	API documentation (routes + example JSON).
	•	Basic usage guide/screenshots.
	•	Seeded database to demo functionality.
	•	Deployed demo (if possible).
