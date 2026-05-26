const teachers = ['Macallin Cabdirahman', 'Macallin Ayaan', 'Macallin Samatar'];

export default function TeachersPage() {
  return (
    <main className="container section">
      <h1>Macallimiinta</h1>
      <form className="search-row" role="search">
        <input aria-label="Raadi macallin" placeholder="Raadi macallin" />
        <button className="button" type="submit">
          Raadi
        </button>
      </form>
      <div className="grid" style={{ marginTop: 24 }}>
        {teachers.map((teacher) => (
          <article className="card" key={teacher}>
            <h2>{teacher}</h2>
            <p>Profile-ka macallinka iyo koorsooyinkiisa ayaa halkan ka muuqan doona.</p>
            <a className="button secondary" href="/macallimiin/tusaale">
              Daawo Profile
            </a>
          </article>
        ))}
      </div>
    </main>
  );
}
