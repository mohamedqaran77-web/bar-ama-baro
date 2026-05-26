# Bar ama Baro - Codex Starter Repository

Bar ama Baro waa Somali-first learning platform. Repo-kan waa starter package loogu talagalay in Codex lagu bilaabo dhismaha MVP-ga.

## Default Build Decision

- Mobile App: Flutter / Dart
- Public Website: Next.js / React
- Admin Dashboard: Next.js / React
- Backend MVP: Supabase
- Database: PostgreSQL
- Video: Cloudflare Stream / Mux / Vimeo later
- Payments MVP: Manual EVC / ZAAD / Sahal transaction verification
- AI: Phase 2 beta module

## Repo Structure

```text
bar-ama-baro/
  apps/
    mobile/       # Flutter mobile app
    web/          # Next.js public website
    admin/        # Next.js admin dashboard
    backend/      # Supabase schema, functions, backend docs
  docs/           # Product, API, database, UI documentation
  codex_tasks/    # Module-by-module tasks for Codex
  design/         # UI copy and screen specs
```

## Current Project Setup

TASK 001 creates the initial monorepo folders:

- `apps/mobile`: Flutter student/teacher/parent mobile starter.
- `apps/web`: Next.js public learning marketplace starter.
- `apps/admin`: Next.js admin dashboard starter.
- `apps/backend`: Supabase/PostgreSQL schema and backend setup notes.
- `docs`: product, UI, API, database, and coding standards documentation.

## Run Locally

Copy each `.env.example` file before local development and fill only local values. Do not commit real secrets.

```bash
cp .env.example .env.local
cp apps/web/.env.example apps/web/.env.local
cp apps/admin/.env.example apps/admin/.env.local
cp apps/mobile/.env.example apps/mobile/.env.local
cp apps/backend/.env.example apps/backend/.env.local
```

### Public Website

```bash
cd apps/web
npm install
npm run dev
```

### Admin Dashboard

```bash
cd apps/admin
npm install
npm run dev
```

### Mobile App

```bash
cd apps/mobile
flutter pub get
flutter run
```

### Supabase Backend

```bash
cd apps/backend
supabase start
supabase db reset
```

## Somali UI Convention

User-facing UI should use Somali labels by default. Examples:

- Login: `Gal Akoonka`
- Register: `Isdiiwaan Geli`
- Search: `Raadi`
- Courses: `Koorsooyinka`
- Teachers: `Macallimiinta`
- Start Learning: `Bilow Barashada`
- Save: `Kaydi`
- Cancel: `Ka Noqo`

## First Development Order

1. Project setup and coding rules
2. Database schema
3. Authentication and roles
4. Public website: home/courses/teachers
5. Mobile app: auth/home/courses
6. Student dashboard
7. Teacher dashboard basic
8. Admin dashboard basic
9. Course upload and approval
10. Enrollment and progress
11. Payment verification
12. Certificate QR verification
