-- Bar ama Baro MVP PostgreSQL Schema
-- Designed for Supabase/PostgreSQL

create extension if not exists "uuid-ossp";

create type user_role as enum ('student', 'teacher', 'parent', 'institution_admin', 'admin', 'super_admin');
create type approval_status as enum ('draft', 'pending', 'approved', 'rejected', 'suspended');
create type payment_status as enum ('pending', 'verified', 'rejected', 'refunded');
create type enrollment_status as enum ('active', 'completed', 'cancelled');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  phone text unique,
  role user_role not null default 'student',
  status approval_status not null default 'approved',
  profile_photo_url text,
  language text not null default 'so',
  city text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.teacher_profiles (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  bio text,
  expertise text,
  education text,
  experience_years int default 0,
  verification_status approval_status not null default 'pending',
  average_rating numeric(3,2) default 0,
  total_students int default 0,
  created_at timestamptz not null default now()
);

create table public.student_profiles (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  education_level text,
  school_name text,
  parent_id uuid references public.profiles(id),
  learning_goal text,
  created_at timestamptz not null default now()
);

create table public.categories (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  slug text unique not null,
  icon text,
  parent_id uuid references public.categories(id),
  created_at timestamptz not null default now()
);

create table public.courses (
  id uuid primary key default uuid_generate_v4(),
  teacher_id uuid not null references public.profiles(id),
  category_id uuid references public.categories(id),
  title text not null,
  slug text unique not null,
  short_description text,
  full_description text,
  level text,
  language text not null default 'so',
  price numeric(10,2) not null default 0,
  currency text not null default 'USD',
  is_free boolean not null default true,
  thumbnail_url text,
  status approval_status not null default 'draft',
  approved_by uuid references public.profiles(id),
  approved_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.course_sections (
  id uuid primary key default uuid_generate_v4(),
  course_id uuid not null references public.courses(id) on delete cascade,
  title text not null,
  order_number int not null default 1
);

create table public.lessons (
  id uuid primary key default uuid_generate_v4(),
  course_id uuid not null references public.courses(id) on delete cascade,
  section_id uuid references public.course_sections(id) on delete cascade,
  title text not null,
  video_url text,
  pdf_url text,
  duration_minutes int default 0,
  order_number int not null default 1,
  is_preview boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.enrollments (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  progress_percent numeric(5,2) not null default 0,
  status enrollment_status not null default 'active',
  enrolled_at timestamptz not null default now(),
  completed_at timestamptz,
  unique(user_id, course_id)
);

create table public.lesson_progress (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  lesson_id uuid not null references public.lessons(id) on delete cascade,
  watched_seconds int not null default 0,
  completed boolean not null default false,
  last_watched_at timestamptz default now(),
  unique(user_id, lesson_id)
);

create table public.quizzes (
  id uuid primary key default uuid_generate_v4(),
  course_id uuid not null references public.courses(id) on delete cascade,
  lesson_id uuid references public.lessons(id) on delete cascade,
  title text not null,
  pass_mark numeric(5,2) not null default 50
);

create table public.quiz_questions (
  id uuid primary key default uuid_generate_v4(),
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  question text not null,
  question_type text not null default 'multiple_choice',
  options_json jsonb,
  correct_answer text,
  marks numeric(5,2) not null default 1
);

create table public.quiz_attempts (
  id uuid primary key default uuid_generate_v4(),
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  user_id uuid not null references public.profiles(id) on delete cascade,
  score numeric(5,2) not null default 0,
  passed boolean not null default false,
  attempted_at timestamptz not null default now()
);

create table public.payments (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  course_id uuid references public.courses(id) on delete set null,
  amount numeric(10,2) not null,
  currency text not null default 'USD',
  method text not null,
  transaction_reference text,
  payer_phone text,
  status payment_status not null default 'pending',
  verified_by uuid references public.profiles(id),
  paid_at timestamptz,
  verified_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.teacher_earnings (
  id uuid primary key default uuid_generate_v4(),
  teacher_id uuid not null references public.profiles(id),
  course_id uuid references public.courses(id),
  payment_id uuid references public.payments(id),
  gross_amount numeric(10,2) not null,
  platform_commission numeric(10,2) not null,
  teacher_amount numeric(10,2) not null,
  payout_status text not null default 'pending',
  created_at timestamptz not null default now()
);

create table public.certificates (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  certificate_code text unique not null,
  qr_code_url text,
  issued_at timestamptz not null default now(),
  status approval_status not null default 'approved',
  unique(user_id, course_id)
);

create table public.reviews (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  course_id uuid not null references public.courses(id) on delete cascade,
  rating int not null check (rating between 1 and 5),
  comment text,
  status approval_status not null default 'approved',
  created_at timestamptz not null default now()
);

create table public.notifications (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  title text not null,
  message text not null,
  type text,
  read_status boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.audit_logs (
  id uuid primary key default uuid_generate_v4(),
  actor_id uuid references public.profiles(id),
  action text not null,
  entity_type text,
  entity_id uuid,
  metadata jsonb,
  created_at timestamptz not null default now()
);

create table public.ai_interactions (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references public.profiles(id) on delete set null,
  course_id uuid references public.courses(id) on delete set null,
  question text,
  answer text,
  tokens_used int default 0,
  created_at timestamptz not null default now()
);

-- Basic indexes
create index idx_courses_status on public.courses(status);
create index idx_courses_category on public.courses(category_id);
create index idx_enrollments_user on public.enrollments(user_id);
create index idx_payments_status on public.payments(status);
create index idx_certificates_code on public.certificates(certificate_code);

-- RLS should be enabled and policies added after auth flow is confirmed.
