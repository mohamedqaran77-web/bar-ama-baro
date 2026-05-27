# Bar ama Baro Public Website

Next.js public website for the Somali-first learning marketplace.

## Stack

- Next.js App Router
- React
- TypeScript

## Pages

- `/`
- `/koorsooyin`
- `/koorsooyin/[slug]`
- `/macallimiin`
- `/macallimiin/[id]`
- `/nagu-saabsan`
- `/xiriir`
- `/preview`

## Run

```bash
npm install
npm run dev
```

The public website runs on `http://localhost:3000`.

## Visual Preview Gallery

To view the visual preview and TASK 002B premium redesign:

```bash
cd apps/web
npm install
npm run dev
```

Then open:

- `http://localhost:3000`
- `http://localhost:3000/preview`

## Environment

Copy `.env.example` to `.env.local` and fill local Supabase values. Only `NEXT_PUBLIC_*` anonymous client values belong in this app.
