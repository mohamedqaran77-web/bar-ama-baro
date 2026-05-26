# AGENTS.md – Instructions for Codex

You are building Bar ama Baro, a Somali-first learning platform.

## Core Rules

1. Use clean, production-oriented code.
2. Do not hardcode secrets.
3. Use Somali labels for user-facing UI unless otherwise instructed.
4. Keep code modular and easy to test.
5. Create tests for business logic.
6. Do not implement payments as automatic real money transfer until approved.
7. All role-based access must be enforced in backend/database, not only UI.
8. Add loading, empty, error, and success states for all screens.
9. Use responsive design for web/admin.
10. Prefer simple UI over complex UI.

## Somali UI Vocabulary

- Login: Gal Akoonka
- Register: Isdiiwaan Geli
- Search: Raadi
- Courses: Koorsooyinka
- Teachers: Macallimiinta
- Start Learning: Bilow Barashada
- Continue Learning: Sii Wad Barashada
- View Profile: Daawo Profile
- Buy Course: Iibso Koorso
- Take Exam: Qaado Imtixaan
- Download Certificate: Soo Dejiso Shahaado
- Save: Kaydi
- Delete: Tirtir
- Submit: Gudbi
- Cancel: Ka Noqo

## Preferred Stack

- Flutter for mobile
- Next.js for public website and admin
- Supabase/PostgreSQL for MVP backend
- TypeScript for web/admin
- Dart for Flutter

## Security Requirements

- Use role-based access control.
- Validate all user input.
- Protect paid course access.
- Payment confirmation must be admin verified in MVP.
- Certificates must have unique codes and QR verification.
- Add audit logs for admin actions.
