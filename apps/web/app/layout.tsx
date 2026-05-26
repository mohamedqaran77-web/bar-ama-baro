import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'Bar ama Baro',
  description: 'Somali-first learning platform'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="so">
      <body>
        <div className="site-shell">
          <header className="site-header">
            <nav className="container nav" aria-label="Public navigation">
              <a className="brand" href="/">
                Bar ama Baro
              </a>
              <div className="nav-links">
                <a href="/koorsooyin">Koorsooyinka</a>
                <a href="/macallimiin">Macallimiinta</a>
                <a href="/nagu-saabsan">Nagu Saabsan</a>
                <a href="/xiriir">Xiriir</a>
                <a className="button secondary" href="/koorsooyin">
                  Bilow Barashada
                </a>
              </div>
            </nav>
          </header>
          {children}
          <footer className="site-footer">
            <div className="container nav">
              <strong>Bar ama Baro</strong>
              <span>Waxbarasho Somali-first ah.</span>
            </div>
          </footer>
        </div>
      </body>
    </html>
  );
}
