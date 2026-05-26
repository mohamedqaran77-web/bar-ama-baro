# Codex Prompts – Use These in Order

## Prompt 001 – Initialize Flutter App Structure

Create the initial Flutter mobile app structure for Bar ama Baro. Use Dart, clean architecture, feature-first folders, and Somali UI labels. Add screens for splash, onboarding, login, register, OTP verification, home, courses, and profile. Do not connect to real backend yet. Use mock data and create reusable widgets for buttons, cards, search bars, and empty/error states.

## Prompt 002 – Build Auth Screens

Build Flutter authentication screens:
- Gal Akoonka
- Isdiiwaan Geli
- Xaqiiji OTP
- Hilmaamay Password

Requirements:
- Somali labels
- Phone/email input
- Password validation
- Loading state
- Error state
- Success state
- AuthRepository interface
- MockAuthRepository implementation
- Unit tests for validation logic

## Prompt 003 – Build Courses Page

Build Flutter courses page with:
- Search bar: "Raadi koorso ama maaddo"
- Filters: Maaddo, Heer, Qiime, Luqad
- Course cards
- Empty state
- Error state
- Course model
- Mock course data
- Navigation to course details

## Prompt 004 – Build Course Details Page

Build course details screen with:
- Course title
- Teacher name
- Rating
- Price/free badge
- Description
- Lessons list
- CTA buttons: "Bilow Casharka", "Iibso Koorso"
- Preview lesson support

## Prompt 005 – Build Student Dashboard

Build student dashboard:
- Welcome message
- Continue learning
- My courses
- Progress bars
- Certificates shortcut
- Notifications shortcut

## Prompt 006 – Build Teacher Dashboard

Build teacher dashboard:
- My courses
- Create course button
- Students count
- Earnings placeholder
- Course status badges: draft, pending, approved, rejected

## Prompt 007 – Build Admin Dashboard Web

Create Next.js admin dashboard:
- Sidebar
- Dashboard metrics
- Users table
- Teachers approval page
- Courses approval page
- Payments verification page
- Somali labels
- Mock data first

## Prompt 008 – Add Supabase Schema

Use apps/backend/supabase/schema.sql. Add migrations and document how to apply them. Do not expose service role keys. Add .env.example files.

## Prompt 009 – Connect Flutter to Supabase

Connect Flutter app to Supabase using environment variables. Implement AuthRepository with Supabase Auth. Keep MockAuthRepository for tests.

## Prompt 010 – Payment Reference MVP

Build manual payment reference flow:
- Student selects EVC/ZAAD/Sahal
- Student enters payer phone and transaction reference
- Payment status becomes pending
- Admin verifies or rejects
- Approved payment enrolls student in course
