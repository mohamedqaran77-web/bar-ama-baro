# Bar ama Baro – Codex Starter Repository

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
