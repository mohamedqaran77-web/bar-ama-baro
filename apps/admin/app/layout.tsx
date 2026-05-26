import type { Metadata } from 'next';
import './globals.css';

const navItems = [
  ['Guddi', '/'],
  ['Isticmaalayaasha', '/users'],
  ['Macallimiinta', '/teachers'],
  ['Koorsooyinka', '/courses'],
  ['Lacag Bixin', '/payments'],
  ['Shahaadooyin', '/certificates'],
  ['Warbixinno', '/reports'],
  ['Dejin', '/settings']
];

export const metadata: Metadata = {
  title: 'Bar ama Baro Admin',
  description: 'Admin dashboard for Bar ama Baro'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="so">
      <body>
        <div className="admin-shell">
          <aside className="sidebar">
            <h1>Bar ama Baro Admin</h1>
            <nav aria-label="Admin navigation">
              {navItems.map(([label, href]) => (
                <a href={href} key={href}>
                  {label}
                </a>
              ))}
            </nav>
          </aside>
          <main className="content">{children}</main>
        </div>
      </body>
    </html>
  );
}
