const metrics = [
  ['Macallimiin Sugaya', '0'],
  ['Koorsooyin Sugaya', '0'],
  ['Lacag Bixin Sugaya', '0'],
  ['Shahaadooyin', '0']
];

export default function AdminDashboardPage() {
  return (
    <>
      <div className="topbar">
        <div>
          <h1>Guddi</h1>
          <p className="muted">La soco oggolaanshaha, lacag bixinta, iyo warbixinnada MVP-ga.</p>
        </div>
        <a className="button" href="/payments">
          Hubi Lacag Bixin
        </a>
      </div>
      <section className="grid" aria-label="Admin metrics">
        {metrics.map(([label, value]) => (
          <article className="card" key={label}>
            <h2>{value}</h2>
            <p className="muted">{label}</p>
          </article>
        ))}
      </section>
    </>
  );
}
