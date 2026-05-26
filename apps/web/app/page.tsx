const categories = ['Xisaab', 'English', 'Computer Basics', 'Quraan & Tajweed', 'Business Basics', 'Exam Preparation'];

const featuredCourses = [
  {
    title: 'Xisaab Fasalka 8aad',
    teacher: 'Macallin Cabdirahman',
    meta: 'Bilaash - Af-Soomaali'
  },
  {
    title: 'English Bilow',
    teacher: 'Macallin Ayaan',
    meta: 'Bilaash - Heer Bilow'
  },
  {
    title: 'Computer Basics',
    teacher: 'Macallin Samatar',
    meta: 'Lacag leh - Admin ayaa xaqiijinaya'
  }
];

export default function HomePage() {
  return (
    <main>
      <section className="container hero">
        <h1>Bar ama Baro</h1>
        <p>Ku baro koorsooyin tayo leh oo Af-Soomaali hormuud u tahay, meel kasta oo aad joogto.</p>
        <form className="search-row" role="search">
          <input aria-label="Raadi koorso" placeholder="Raadi koorso ama maaddo" />
          <button className="button" type="submit">
            Raadi
          </button>
        </form>
        <div className="nav-links">
          <a className="button" href="/koorsooyin">
            Bilow Barashada
          </a>
          <a className="button secondary" href="/macallimiin">
            Noqo Macallin
          </a>
        </div>
      </section>

      <section className="container section" aria-labelledby="stats-title">
        <h2 id="stats-title">Tirakoob</h2>
        <div className="grid">
          <article className="card">
            <h3>6 Qaybood</h3>
            <p>Koorsooyinka MVP-ga waxay ka bilaabmaan maaddooyinka ugu muhiimsan.</p>
          </article>
          <article className="card">
            <h3>3 Door</h3>
            <p>Arday, macallin, iyo admin ayaa ah saldhigga hore.</p>
          </article>
          <article className="card">
            <h3>100% Somali-first</h3>
            <p>Labels-ka iyo socodka ardayga waa Somali-first.</p>
          </article>
        </div>
      </section>

      <section className="container section" aria-labelledby="categories-title">
        <h2 id="categories-title">Qaybaha</h2>
        <div className="grid">
          {categories.map((category) => (
            <article className="card" key={category}>
              <h3>{category}</h3>
              <p>Eeg koorsooyin ku habboon heerkaaga.</p>
            </article>
          ))}
        </div>
      </section>

      <section className="container section" aria-labelledby="featured-title">
        <h2 id="featured-title">Koorsooyin La Doortay</h2>
        <div className="grid">
          {featuredCourses.map((course) => (
            <article className="card" key={course.title}>
              <h3>{course.title}</h3>
              <p>{course.teacher}</p>
              <p>{course.meta}</p>
            </article>
          ))}
        </div>
      </section>
    </main>
  );
}
