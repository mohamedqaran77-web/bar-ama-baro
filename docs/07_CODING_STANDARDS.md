# Coding Standards - Bar ama Baro

## Core Rules

- Keep code modular, readable, and production-oriented.
- Do not hardcode secrets, API keys, service-role keys, or payment credentials.
- Use Somali labels for user-facing UI unless a task explicitly says otherwise.
- Add loading, empty, error, and success states for user-facing screens.
- Validate user input at app boundaries.
- Enforce role-based access in Supabase/PostgreSQL policies and backend logic, not only in UI.
- Keep automatic real-money payments out of the MVP until approved by the owner.

## Somali Naming

Use Somali route and label names where they are visible to users:

- `/koorsooyin` for courses.
- `/macallimiin` for teachers.
- `Gal Akoonka` for login.
- `Isdiiwaan Geli` for registration.
- `Raadi` for search.
- `Kaydi` for save.
- `Ka Noqo` for cancel.

Internal code may use English identifiers when it improves maintainability, but user-facing copy should remain Somali-first.

## Tests

- Add focused tests for business logic.
- Add UI smoke tests where practical.
- Do not skip security-sensitive behavior such as roles, paid course access, payment verification, and certificates.
