# Bar ama Baro Mobile App

Flutter app for students, teachers, and parents.

## Stack

- Flutter
- Dart
- Supabase client integration in a later task

## First Screens

- Splash
- Onboarding
- Gal Akoonka
- Isdiiwaan Geli
- Xaqiiji OTP
- Hilmaamay Password

## Current Architecture

```text
lib/
  app/                         # App routes and MaterialApp setup
  core/validation/             # Shared validation logic
  features/auth/
    data/                      # MockAuthRepository
    domain/                    # AuthRepository interface and auth models
    presentation/              # Screens, state, and widgets
```

Auth uses `AuthRepository` with `MockAuthRepository` for TASK 002. Real Supabase auth is intentionally not connected yet.

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```

## Environment

Copy `.env.example` to `.env.local` for local values. Do not commit real Supabase keys.
