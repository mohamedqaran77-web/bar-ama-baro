# API Structure – Bar ama Baro MVP

## Auth
- POST /api/auth/register
- POST /api/auth/login
- POST /api/auth/logout
- POST /api/auth/verify-otp
- POST /api/auth/forgot-password

## Courses
- GET /api/courses
- GET /api/courses/{slug}
- POST /api/teacher/courses
- PUT /api/teacher/courses/{id}
- DELETE /api/teacher/courses/{id}
- POST /api/admin/courses/{id}/approve
- POST /api/admin/courses/{id}/reject

## Lessons
- GET /api/courses/{id}/lessons
- POST /api/teacher/courses/{id}/lessons
- PUT /api/teacher/lessons/{id}

## Enrollments
- POST /api/courses/{id}/enroll
- GET /api/student/enrollments
- PUT /api/student/lessons/{id}/progress

## Payments
- POST /api/payments/submit-reference
- GET /api/payments/history
- POST /api/admin/payments/{id}/verify
- POST /api/admin/payments/{id}/reject

## Certificates
- GET /api/student/certificates
- GET /api/certificates/{code}/verify
- GET /api/certificates/{code}/download

## Admin
- GET /api/admin/dashboard
- GET /api/admin/users
- PUT /api/admin/users/{id}/status
- GET /api/admin/reports

## AI – Phase 2
- POST /api/ai/ask-tutor
- POST /api/ai/generate-quiz
- POST /api/ai/summarize-lesson
