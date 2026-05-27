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
                <span className="brand-mark">BB</span>
                <span>Bar ama Baro</span>
              </a>
              <div className="nav-links">
                <a href="/koorsooyin">Koorsooyinka</a>
                <a href="/macallimiin">Macallimiinta</a>
                <a href="/preview">Muuqaalka</a>
                <a href="/nagu-saabsan">Nagu Saabsan</a>
                <a href="/xiriir">Xiriir</a>
              </div>
              <a className="button button-small" href="/koorsooyin">
                Bilow Barashada
              </a>
            </nav>
          </header>
          {children}
          <footer className="site-footer">
            <div className="container footer-grid">
              <div>
                <a className="brand footer-brand" href="/">
                  <span className="brand-mark">BB</span>
                  <span>Bar ama Baro</span>
                </a>
                <p>Somali-first learning platform u dhisan arday, macallin, iyo bulsho waxbarasho jecel.</p>
              </div>
              <div>
                <h2>Platform</h2>
                <a href="/koorsooyin">Koorsooyinka</a>
                <a href="/macallimiin">Macallimiinta</a>
                <a href="/preview">Muuqaalka</a>
              </div>
              <div>
                <h2>Taageero</h2>
                <a href="/nagu-saabsan">Nagu Saabsan</a>
                <a href="/xiriir">Xiriir</a>
                <a href="/koorsooyin">Raadi Koorso</a>
              </div>
            </div>
          </footer>
        </div>
      </body>
    </html>
  );
}
