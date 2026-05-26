# Bar ama Baro Backend

MVP backend uses Supabase/PostgreSQL.

## Files

- `supabase/schema.sql`
- `supabase/migrations/000001_initial_schema.sql`
- `supabase/config.toml`

## Run Local Supabase

```bash
supabase start
supabase db reset
```

## Environment

Copy `.env.example` to `.env.local` for local development only. Do not commit real project keys or service-role keys.

## Later

- Edge functions
- RLS policies
- Storage buckets
- Payment verification functions
- Certificate generator

## Security Notes

- Role-based access must be enforced in Supabase policies and backend logic.
- Manual payment verification remains admin reviewed in the MVP.
- Certificates require unique codes and QR verification.
