# Bar ama Baro Admin Dashboard

Next.js admin dashboard for approvals, verification, reports, and platform management.

## Stack

- Next.js App Router
- React
- TypeScript

## Admin Modules

- Dashboard
- Users
- Teachers Approval
- Courses Approval
- Payments Verification
- Certificates
- Reports
- Settings

## Run

```bash
npm install
npm run dev
```

The admin dashboard runs on `http://localhost:3001`.

## Security Notes

- Admin role checks must be enforced in Supabase/PostgreSQL policies and backend logic.
- This starter does not include real secrets or service-role keys.
- Payment confirmation remains manual and admin verified for MVP.
