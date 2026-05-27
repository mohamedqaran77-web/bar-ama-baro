const authScreens = [
  {
    name: 'Splash Screen',
    title: 'Bar ama Baro',
    eyebrow: 'Meesha Aqoontu Ka Bilaabato',
    body: 'Waxbarasho Somali-first ah.',
    button: 'Sii Wad',
    variant: 'splash'
  },
  {
    name: 'Onboarding Screen',
    title: 'Meesha Aqoontu Ka Bilaabato',
    eyebrow: 'Ku baro aqoon tayo leh',
    body: 'Hel koorsooyin Af-Soomaali ah, macallimiin tayo leh, iyo casharro aad ku baran karto meel kasta.',
    button: 'Isdiiwaan Geli',
    secondary: 'Gal Akoonka',
    variant: 'onboarding'
  },
  {
    name: 'Gal Akoonka',
    title: 'Gal Akoonka',
    eyebrow: 'Ku soo noqo barashadaada',
    body: 'Geli lambarka taleefanka iyo password-kaaga.',
    fields: ['Lambarka Taleefanka', 'Password'],
    button: 'Gal Akoonka',
    secondary: 'Hilmaamay Password',
    variant: 'form'
  },
  {
    name: 'Isdiiwaan Geli',
    title: 'Isdiiwaan Geli',
    eyebrow: 'Samee akoon cusub',
    body: 'Bilow safarkaaga waxbarasho maanta.',
    fields: ['Magaca Buuxa', 'Lambarka Taleefanka', 'Password'],
    button: 'Isdiiwaan Geli',
    secondary: 'Gal Akoonka',
    variant: 'form'
  },
  {
    name: 'Xaqiiji OTP',
    title: 'Xaqiiji OTP',
    eyebrow: 'Hubi akoonkaaga',
    body: 'Geli 6-da lambar ee laguu soo diray.',
    fields: ['OTP Code'],
    button: 'Sii Wad',
    secondary: 'Dib u dir OTP',
    variant: 'otp'
  },
  {
    name: 'Hilmaamay Password',
    title: 'Hilmaamay Password',
    eyebrow: 'Soo celi gelitaanka',
    body: 'Geli lambarka taleefanka si aan kuugu dirno tilmaamaha.',
    fields: ['Lambarka Taleefanka'],
    button: 'Sii Wad',
    secondary: 'Gal Akoonka',
    variant: 'form'
  }
];

const redesignChanges = [
  'Hero, search, buttons, cards, spacing, iyo typography waa la cusbooneysiiyay.',
  'Navigation-ka iyo footer-ka waxay noqdeen kuwo nadiif ah oo premium ah.',
  'Qaybaha iyo koorsooyinka la doortay waxay heleen hierarchy muuqaal oo xooggan.',
  'Trust, value, iyo learning path sections ayaa lagu daray.',
  'Palette-ku wuxuu isku darayaa ink deep, green, blue, white, iyo accent diirran.'
];

const nextItems = [
  'TASK 003: Dhis bogga Koorsooyinka oo dhammeystiran.',
  'Ku xir course data marka Supabase schema iyo policies diyaar noqdaan.',
  'Ku fidin design-kan premium-ka ah course details iyo teacher profiles.',
  'Ku dar auth/session state marka backend integration bilaabato.'
];

export default function PreviewPage() {
  return (
    <main className="preview-page">
      <section className="preview-hero">
        <div className="container preview-hero-inner">
          <div>
            <p className="preview-kicker">Bar ama Baro</p>
            <h1>Waxa La Dhisay Ilaa Hadda</h1>
            <p>
              Muuqaal kooban oo tusaya auth flow-ga mobile-ka, homepage-ka premium-ka ah, iyo waxa is beddelay redesign-ka.
            </p>
          </div>
          <a className="button" href="/">
            Eeg Homepage-ka
          </a>
        </div>
      </section>

      <section className="container preview-section" aria-labelledby="homepage-preview-title">
        <div className="preview-section-heading">
          <p className="preview-kicker">Homepage Premium</p>
          <h2 id="homepage-preview-title">Naqshadda Cusub ee Homepage-ka</h2>
        </div>
        <div className="homepage-preview">
          <div className="homepage-preview-hero">
            <p className="preview-kicker">Somali-first learning platform</p>
            <h3>Bar ama Baro</h3>
            <div className="homepage-preview-search">
              <span>Raadi koorso, maaddo, ama macallin</span>
              <span>Raadi</span>
            </div>
          </div>
          <div className="homepage-preview-grid">
            <div className="homepage-preview-card">
              <strong>Qaybaha</strong>
              <span>Xisaab, English, Computer Basics</span>
            </div>
            <div className="homepage-preview-card">
              <strong>Koorsooyin La Doortay</strong>
              <span>Cards nadiif ah, rating, casharro, iyo CTA</span>
            </div>
            <div className="homepage-preview-card">
              <strong>Sababta loo dhisayo</strong>
              <span>Trust, value, iyo learning path</span>
            </div>
          </div>
        </div>
      </section>

      <section className="container preview-section" aria-labelledby="mockups-title">
        <div className="preview-section-heading">
          <p className="preview-kicker">Mobile Auth</p>
          <h2 id="mockups-title">Shaashadaha Auth-ka ee Dhameystiran</h2>
        </div>

        <div className="phone-grid">
          {authScreens.map((screen) => (
            <article className="preview-card" key={screen.name}>
              <div className="phone-frame" data-variant={screen.variant}>
                <div className="phone-speaker" />
                <div className="phone-screen">
                  <div className="phone-brand">Bar ama Baro</div>
                  <div className="phone-icon" />
                  <p className="phone-eyebrow">{screen.eyebrow}</p>
                  <h3>{screen.title}</h3>
                  <p className="phone-body">{screen.body}</p>

                  {screen.fields ? (
                    <div className="phone-fields">
                      {screen.fields.map((field) => (
                        <div className="phone-field" key={field}>
                          {field}
                        </div>
                      ))}
                    </div>
                  ) : null}

                  <div className="phone-actions">
                    <div className="phone-button">{screen.button}</div>
                    {screen.secondary ? <div className="phone-link">{screen.secondary}</div> : null}
                  </div>
                </div>
              </div>
              <h3>{screen.name}</h3>
            </article>
          ))}
        </div>
      </section>

      <section className="container preview-section" aria-labelledby="status-title">
        <div className="preview-section-heading">
          <p className="preview-kicker">Horumarka Mashruuca</p>
          <h2 id="status-title">Redesign-ka iyo Waxa Xiga</h2>
        </div>

        <div className="status-grid">
          <StatusList title="Waxa Redesign-ku Bedelay" items={redesignChanges} />
          <StatusList title="Waxa Xiga" items={nextItems} />
        </div>
      </section>
    </main>
  );
}

function StatusList({ title, items }: { title: string; items: string[] }) {
  return (
    <article className="status-card">
      <h3>{title}</h3>
      <ul>
        {items.map((item) => (
          <li key={item}>{item}</li>
        ))}
      </ul>
    </article>
  );
}
