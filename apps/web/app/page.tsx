const categories = [
  {
    title: 'Xisaab',
    description: 'Casharro cad oo dhisaya fahamka tirooyinka, algebra, iyo imtixaan diyaarinta.',
    meta: '24 cashar'
  },
  {
    title: 'English',
    description: 'Grammar, speaking, vocabulary, iyo practice ku habboon ardayda Soomaaliyeed.',
    meta: '18 cashar'
  },
  {
    title: 'Computer Basics',
    description: 'Bilow xirfadaha digital-ka: typing, internet, files, iyo tools muhiim ah.',
    meta: '15 cashar'
  },
  {
    title: "Qur'aan & Tajweed",
    description: 'Barasho nidaamsan oo u fudud ardayga, waalidka, iyo macallinka.',
    meta: '12 cashar'
  },
  {
    title: 'Business Basics',
    description: 'Aasaaska ganacsiga, iibka, macaamiisha, iyo qorsheynta fikrad cusub.',
    meta: '10 cashar'
  },
  {
    title: 'Exam Preparation',
    description: 'Dib-u-eegis, su'aalo tababar, iyo qorshe waxbarasho oo ardayga hagaya.',
    meta: '20 cashar'
  }
];

const featuredCourses = [
  {
    title: 'Xisaab Fasalka 8aad',
    teacher: 'Macallin Cabdirahman',
    level: 'Dhexe',
    price: 'Bilaash',
    lessons: '32 cashar',
    rating: '4.9'
  },
  {
    title: 'English Bilow',
    teacher: 'Macallin Ayaan',
    level: 'Bilow',
    price: 'Bilaash',
    lessons: '24 cashar',
    rating: '4.8'
  },
  {
    title: 'Computer Basics',
    teacher: 'Macallin Samatar',
    level: 'Bilow',
    price: 'Admin ayaa xaqiijinaya',
    lessons: '20 cashar',
    rating: '4.7'
  }
];

const values = [
  {
    title: 'Somali-first',
    body: 'Labels, learning flow, and course discovery are written for Somali learners first.'
  },
  {
    title: 'Macallimiin tayo leh',
    body: 'Courses are designed around teacher approval, course approval, and clear lesson structure.'
  },
  {
    title: 'Barasho la ilaalinayo',
    body: 'Paid access, certificates, and admin actions are planned around backend-enforced rules.'
  }
];

const steps = [
  'Raadi koorso ku habboon heerkaaga.',
  'Isdiiwaan geli ama gal akoonkaaga.',
  'Bilow casharrada oo la soco horumarkaaga.',
  'Qaado imtixaan oo hel shahaado la xaqiijin karo.'
];

export default function HomePage() {
  return (
    <main>
      <section className="hero-premium">
        <div className="hero-scene" aria-hidden="true">
          <div className="scene-panel scene-panel-large">
            <div className="scene-row strong" />
            <div className="scene-row" />
            <div className="scene-row short" />
            <div className="scene-metric-grid">
              <span />
              <span />
              <span />
            </div>
          </div>
          <div className="scene-panel scene-panel-small">
            <div className="scene-avatar" />
            <div className="scene-row" />
            <div className="scene-row short" />
          </div>
        </div>

        <div className="container hero-premium-inner">
          <p className="eyebrow">Somali-first learning platform</p>
          <h1>Bar ama Baro</h1>
          <p className="hero-copy">
            Ku baro koorsooyin tayo leh, hel macallimiin la isku halleyn karo, kuna soco waddo waxbarasho oo nadiif ah,
            casri ah, oo Af-Soomaali hormuud u tahay.
          </p>
          <form className="premium-search" role="search">
            <label className="sr-only" htmlFor="home-search">
              Raadi koorso
            </label>
            <input id="home-search" placeholder="Raadi koorso, maaddo, ama macallin" />
            <button className="button" type="submit">
              Raadi
            </button>
          </form>
          <div className="hero-actions">
            <a className="button" href="/koorsooyin">
              Bilow Barashada
            </a>
            <a className="button secondary" href="/macallimiin">
              Noqo Macallin
            </a>
          </div>
        </div>
      </section>

      <section className="container metrics-band" aria-label="Platform trust metrics">
        <article>
          <strong>6</strong>
          <span>Qaybood oo MVP ah</span>
        </article>
        <article>
          <strong>3</strong>
          <span>Doorarka ugu horreeya</span>
        </article>
        <article>
          <strong>100%</strong>
          <span>Somali-first UI</span>
        </article>
        <article>
          <strong>Admin</strong>
        <span>Lacag bixin la xaqiijiyo</span>
        </article>
      </section>

      <section className="container section section-spacious" aria-labelledby="categories-title">
        <div className="section-header">
          <p className="eyebrow">Qaybaha</p>
          <h2 id="categories-title">Maaddooyin si qurux badan loo habeeyay</h2>
          <p>Ka bilow casharro cad, koorsooyin la kala doortay, iyo waddo waxbarasho oo ardayga ka dhigaysa mid deggan.</p>
        </div>
        <div className="premium-grid categories-grid">
          {categories.map((category) => (
            <article className="premium-card category-card" key={category.title}>
              <span className="category-meta">{category.meta}</span>
              <h3>{category.title}</h3>
              <p>{category.description}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="section section-contrast" aria-labelledby="featured-title">
        <div className="container">
          <div className="section-header split-header">
            <div>
              <p className="eyebrow">Koorsooyin caan ah</p>
              <h2 id="featured-title">Koorsooyin La Doortay</h2>
            </div>
            <a className="button secondary on-dark" href="/koorsooyin">
              Daawo Koorsooyinka
            </a>
          </div>
          <div className="premium-grid course-grid">
            {featuredCourses.map((course) => (
              <article className="course-card" key={course.title}>
                <div className="course-visual">
                  <span>{course.level}</span>
                </div>
                <div className="course-body">
                  <p className="course-rating">Qiimeyn {course.rating}</p>
                  <h3>{course.title}</h3>
                  <p>{course.teacher}</p>
                  <div className="course-meta">
                    <span>{course.lessons}</span>
                    <span>{course.price}</span>
                  </div>
                  <a className="button button-full" href="/koorsooyin/tusaale">
                    Bilow Casharka
                  </a>
                </div>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="container section section-spacious" aria-labelledby="trust-title">
        <div className="section-header">
          <p className="eyebrow">Sababta loo dhisayo</p>
          <h2 id="trust-title">Waxbarasho qurux badan, fudud, oo la isku halleyn karo</h2>
        </div>
        <div className="premium-grid value-grid">
          {values.map((value) => (
            <article className="premium-card value-card" key={value.title}>
              <h3>{value.title}</h3>
              <p>{value.body}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="container section learning-path" aria-labelledby="steps-title">
        <div>
          <p className="eyebrow">Sida ay u shaqeyso</p>
          <h2 id="steps-title">Waddo waxbarasho oo sahlan</h2>
        </div>
        <ol>
          {steps.map((step) => (
            <li key={step}>{step}</li>
          ))}
        </ol>
      </section>
    </main>
  );
}
