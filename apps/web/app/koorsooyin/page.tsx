const courses = ['Xisaab Fasalka 8aad', 'English Bilow', 'Computer Basics'];

export default function CoursesPage() {
  return (
    <main className="container section">
      <h1>Koorsooyinka</h1>
      <form className="search-row" role="search">
        <input aria-label="Raadi koorso" placeholder="Raadi koorso" />
        <button className="button" type="submit">
          Raadi
        </button>
      </form>
      <div className="grid" style={{ marginTop: 24 }}>
        {courses.map((course) => (
          <article className="card" key={course}>
            <h2>{course}</h2>
            <p>Maaddo, heer, qiime, luqad, iyo qiimeyn ayaa lagu dari doonaa.</p>
            <a className="button secondary" href="/koorsooyin/tusaale">
              Daawo Koorsooyinka
            </a>
          </article>
        ))}
      </div>
    </main>
  );
}
