# adloo.de Design Reference -- Complete Analysis for Astro Rebuild

> Extracted from https://adloo.de on 2026-03-11.
> Original site: WordPress + Bricks Builder theme.

---

## 1. GLOBAL DESIGN TOKENS

### 1.1 Color Palette

| Token                     | Value                     | Usage                              |
|---------------------------|---------------------------|------------------------------------|
| `--primary`               | `#CF2E2E`                 | SPD red, buttons, accents          |
| `--primary-light`         | (lighter variant)         | Category badges background         |
| `--white`                 | `#FFFFFF`                 | Page background, text on dark      |
| `--black`                 | `#000000`                 | Primary text                       |
| `--black-trans-30`        | `rgba(0,0,0,0.3)`        | Overlay on hero                    |
| `--black-trans-80`        | `rgba(0,0,0,0.8)`        | Muted text (excerpts)              |
| `--neutral`               | (mid gray)                | Timeline dots/connectors           |
| `--neutral-light`         | (light gray border)       | Borders, dividers                  |
| `--neutral-semi-light`    | (slightly darker border)  | Feature card left border           |
| `--neutral-ultra-light`   | (very light gray, ~#f5f5f5)| Background sections              |
| `--text-dark`             | (near black)              | Body text on light bg              |
| `--text-light`            | (white/near-white)        | Text on dark backgrounds           |
| `--text-light-muted`      | (gray on dark bg)         | Muted text on dark backgrounds     |
| Button background         | `#32373C`                 | CTA buttons                        |
| Hero gradient end         | `rgba(0,0,0,0.7)`        | Hero overlay gradient              |
| Footer background         | Dark (near #1a1a1a)       | Footer                             |
| News date overlay         | `rgba(0,0,0,0.6)`        | Date badge on archive cards        |
| Light section bg          | `#f2f2f2`                 | Wahl 2026 page bg                  |

### 1.2 Typography

| Token              | Approx. Value | Usage                         |
|--------------------|---------------|-------------------------------|
| Font family        | System sans-serif (no custom webfont detected) | All text |
| `--h1`             | ~2.5rem base  | Page titles (often scaled 1.2-1.4x) |
| `--text-xxl`       | ~1.75rem      | Feature card headings (scaled 1.4x) |
| `--text-xl`        | ~1.5rem       | Large subheadings              |
| `--text-l`         | ~1.25rem      | Blog excerpt, subheadings      |
| `--text-m`         | ~1rem         | Body text default              |
| `--text-s`         | ~0.875rem     | Labels, captions, categories   |
| Body weight        | 400           | Normal text                    |
| Bold weight        | 700           | Headings, feature card body text |
| Hero H1            | `calc(var(--h1) * 1.4)` | Homepage hero heading |
| Article title      | `calc(var(--text-xxl) * 1.3)` | Blog post title   |
| Button font size   | `1.125em`     | CTA buttons                    |

### 1.3 Spacing System

| Token              | Approx. Value | Usage                     |
|--------------------|---------------|---------------------------|
| `--space-xs`       | ~0.25-0.5rem  | Tight gaps                |
| `--space-s`        | ~0.75-1rem    | Small gaps                |
| `--space-m`        | ~1.5-2rem     | Medium spacing, sidebar sticky top |
| `--space-l`        | ~2-3rem       | Feature card padding      |
| `--space-xl`       | ~3-4rem       | Large section spacing     |
| `--grid-gap`       | ~1.5-2rem     | Grid gap between cards    |
| `--container-gap`  | ~2-3rem       | Container element spacing |
| `--content-gap`    | ~1.5rem       | Inner content spacing     |
| `--gutter`         | ~1-1.5rem     | Page side padding         |
| `--content-width`  | ~72rem        | Max content width         |

### 1.4 Border Radius

| Token              | Value      | Usage              |
|--------------------|------------|--------------------|
| `--radius-m`       | ~8px       | Cards, images      |
| `--radius-xl`      | ~16px      | Larger containers  |
| `--radius-circle`  | 50%        | Author photo       |
| Button radius      | `9999px`   | Pill-shaped CTAs   |

### 1.5 Responsive Breakpoints

| Breakpoint  | Value     | Layout Change                                |
|-------------|-----------|----------------------------------------------|
| Mobile      | <= 478px  | Single column, adjusted image positions      |
| Tablet      | 479-767px | Single column, some 2-col                    |
| Desktop sm  | 768-991px | Multi-column begins, mobile menu hidden      |
| Desktop     | >= 992px  | Full multi-column grids                      |

---

## 2. GLOBAL LAYOUT & COMPONENTS

### 2.1 Header / Navigation

**Structure:**
- Sticky top, z-index high
- Background: white with slight transparency/blur (backdrop-blur)
- Border bottom: subtle gray line

**Content:**
- Logo image: `https://adloo.de/wp-content/uploads/2026/01/kassra-adloo-logo.webp`
  - Links to homepage
- Desktop nav (visible >= 768px):
  - Home -> `/`
  - News -> `/news/`
  - Wahl 2026 -> `/kommunalwahl-aschaffenburg-2026/`
- Mobile toggle (visible < 768px):
  - Hamburger icon button
  - Reveals same links in vertical stack

**CSS Classes (original):** `.bm-header-20`, `.bm-header-20__nav-menu`, `.bricks-mobile-menu-toggle`

### 2.2 Footer

**Structure:** Dark background, flex column, centered

**Three sections:**
1. **Legal navigation links (inline, centered):**
   - Impressum -> `/impressum/`
   - Datenschutz -> `/datenschutzerklaerung/`
   - Transparenz -> `/transparenz/`

2. **Social media links:**
   - Instagram: `https://www.instagram.com/kassra.adloo/`
   - TikTok: `https://www.tiktok.com/@kassraadloo`

3. **Copyright:** "Copyright 2026 (c) Kassra Adloo"

**CSS Classes (original):** `.fr-footer-delta`, `.fr-social-alpha`, `.fr-legal-meta-alpha`

**Responsive:** Below 767px, items align left instead of centered.

### 2.3 Buttons / CTAs

- Background: `#32373C` (dark charcoal)
- Text: white
- Border radius: `9999px` (pill shape)
- Padding: `calc(0.667em + 2px)` vertical, `calc(1.333em + 2px)` horizontal
- Font size: `1.125em`
- Font weight: bold
- Hover: slight opacity or brightness change
- Hero CTA text: "Kassra kennenlernen ->" (arrow character)
- Scrolls to anchor `#brxe-7c6656` (about section)

---

## 3. HOMEPAGE (`/`)

### 3.1 Section Order

1. Header
2. Hero (full viewport height)
3. "Wer ist Kassra Adloo?" (about/intro)
4. Video section
5. Blog/News cards (3-column grid)
6. Campaign motivation / deeper intro
7. Feature cards / Schwerpunkte (3-column grid)
8. Footer

### 3.2 Hero Section

**Layout:**
- Full viewport height (`100vh`)
- Background image with gradient overlay
- Content positioned right side, white text

**Background image:**
- URL: `https://adloo.de/wp-content/uploads/2026/01/kassra-adloo-portrait-stehend-krawatte-rot-2000px-759x1024.webp`
- `object-fit: cover`
- Position: `30% 30%` desktop, `55% 10%` mobile
- Gradient overlay via `::after`: `linear-gradient(transparent 0%, rgba(0,0,0,0.7) 40%)`

**Text content:**
- Heading: "Gemeinsam fur ein vielfaltiges und lebendiges Aschaffenburg"
- Subtitle: "Kassra Adloo -- Stadtratskandidat in Aschaffenburg"
- Supporting: "Unternehmer . Familienvater . einer von uns"
- CTA button: "Kassra kennenlernen ->"

**Floating Balloon:**
- Image: `https://adloo.de/wp-content/uploads/2026/03/roter-ballon-danke-5000.webp`
- Positioned absolutely: top 15%, right 8%
- Animation: `ballonFloat` 4s infinite
- Hover: scale 1.05, animation pauses
- CSS class: `.wahlballon`

**Balloon Animation Keyframes:**
```css
@keyframes ballonFloat {
  0%, 100% { transform: translateY(0px) rotate(0deg); }
  50% { transform: translateY(-15px) rotate(0deg); }
}
```

**CSS Classes (original):** `.bm-hero-58`

### 3.3 About / "Wer ist Kassra Adloo?" Section

**Layout:** Two-column grid (text + image)

**Content highlights:**
- Key statistics: 23 years in Germany, 3 successful businesses, 10 nationalities on team
- Portrait image (same as hero or variant)

**CSS Classes (original):** `.bm-content-64`

### 3.4 Video Section

- HTML5 `<video>` element (not YouTube/Vimeo embed)
- Fallback text: "Dein Browser unterstutzt das Video-Tag nicht"
- Source URL: served from site (exact path not visible in HTML source)

### 3.5 Blog/News Cards Grid (Homepage)

**Layout:**
- 3-column grid on desktop (`var(--grid-3)`)
- 1-column at <= 991px
- Gap: `var(--grid-gap)`
- Card aspect ratio: 3:4 desktop, 16:9 tablet, 1:1 mobile

**Card design:**
- Background image fills entire card (`object-fit: cover`)
- Dark overlay on top
- Category label: white background, small padding (`.4rem .8rem`)
- Post title: white, positioned at bottom
- Icon wrapper with border at footer

**Hover effects:**
- Overlay opacity reduces
- Title slides up (translateY from 75% to 0)
- Footer element scales/slides in
- Transition: 0.5s ease

**Posts displayed (3 most recent):**

1. "Danke, Aschaffenburg!" -- 9. Marz 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/03/kassra-adloo-nach-wahl-2026-stadtrat-1024x787.webp`
   - Link: `/danke-aschaffenburg/`

2. "So einfach ist wahlen -- und ich zeige euch wie" -- 6. Marz 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/03/kassra-adloo-stadtratswahl-2026-testwahl-1024x632.jpg`
   - Link: `/so-einfach-ist-waehlen-und-ich-zeige-euch-wie/`

3. "Ihre Stimme zahlt -- am 8. Marz 3 Stimmen fur SPD Liste Platz 19" -- 5. Marz 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/01/kassra-adloo-plakate-576x1024.webp`
   - Link: `/eure-stimme-zaehlt-am-8-maerz-3-stimmen-fuer-spd-liste-platz-19/`

**CSS Classes (original):** `.bm-blog-section-24`, `.bm-blog-section-24-list`, `.bm-blog-section-24-card`

### 3.6 Feature Cards / Schwerpunkte

**Layout:**
- 3-column grid (`var(--grid-3)`, single column mobile)
- Gap: `var(--grid-gap)`

**Individual card styling:**
- Left border: `1px solid var(--neutral-semi-light)`
- Padding: `var(--space-l)` top/bottom, `var(--space-m)` left
- Row gap: `calc(var(--content-gap) / 2)`

**Card 1: "Integration & Vielfalt"**
- Body: "In meinen Restaurants arbeiten Menschen aus 8 Nationen zusammen. Nicht trotz ihrer Unterschiede, sondern wegen ihrer Vielfalt sind wir erfolgreich. Diese Erfahrung mochte ich fur ganz Aschaffenburg nutzbar machen."
- Bullet points: Integrationszentrum starken, Mehr Begegnungsraume schaffen, Unternehmen bei Vielfalt unterstutzen, Sprachforderung ausbauen
- Image: `kassra-adloo-business-mit-krawatte-hueftcut.webp`
- Tagline: "Integration funktioniert -- ich erlebe es taglich."

**Card 2: "Lebendige Innenstadt"**
- Body: "Seit 8 Jahren bin ich mit meinen Restaurants Teil der Aschaffenburger Innenstadt. Ich kenne die Herausforderungen von Unternehmern und die Wunsche der Burger aus erster Hand."
- Bullet points: Burokratie abbauen, Genehmigungen beschleunigen / Mehr Aufenthaltsqualitat schaffen / Aussengastronomie fordern / Leerstand intelligent nutzen
- Image: `biergarten-am-herstallturm-1-1024x705.jpg`
- Tagline: "Als Unternehmer weiss ich, was unsere City braucht."

**Card 3: "Zukunftsfahige Stadt"**
- Body: "Als Gastronom spure ich den Klimawandel direkt: Heisse Sommer, Starkregen, steigende Energiekosten. Wir mussen jetzt handeln, um Aschaffenburg zukunftsfahig zu machen."
- Bullet points: Mehr Grun in der Innenstadt / Erneuerbare Energien fordern / Gebaude klimafit machen / Nachhaltige Mobilitat starken
- Image: `klimastreifen-bayern-1024x683.webp`
- Tagline: "Klimawandel erfordert kluge Anpassungen."

**Typography:**
- Heading: `calc(var(--text-xxl) * 1.4)`, bold
- Body text: `font-weight: 700`

**CSS Classes (original):** `.bm-feature-45`, `.bm-feature-45-list`, `.bm-feature-45-card`, `.bm-feature-45-card__heading`, `.bm-feature-45-card__text`

---

## 4. NEWS ARCHIVE PAGE (`/news/`)

### 4.1 Layout

- 2-column responsive grid (`var(--grid-auto-2)`)
- Gap: `var(--grid-gap)` + `var(--container-gap)`

### 4.2 Card Design

- Full-width image: 16:9 aspect ratio, `object-fit: cover`
- Flexbox column layout with centered text alignment
- **Meta overlay:** Positioned absolutely top-right, `rgba(0,0,0,0.6)` background
  - Date: white text, small font
- **Category badges:** `background-color: var(--primary-light)`, padding `.4rem .8rem`, small font
- **Author:** Bold, dark text -- "Geschrieben von [Name]"
- **Excerpt:** `color: var(--black-trans-80)` for reduced contrast
- **Title:** Centered heading

### 4.3 Pagination

- Gap: `2.5rem` between items
- Current page highlighted with primary color
- Standard numbered pagination with active state

### 4.4 All Blog Posts (in order)

1. "Danke, Aschaffenburg!" -- 9. Marz 2026 -- Allgemein
   - Excerpt: "Es hat diesmal nicht gereicht. Aber fast 5.000 Stimmen zeigen mir: Es lohnt sich, weiterzumachen."
   - Image: `/wp-content/uploads/2026/03/kassra-adloo-nach-wahl-2026-stadtrat-1024x787.webp`

2. "So einfach ist wahlen -- und ich zeige euch wie" -- 6. Marz 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/03/kassra-adloo-stadtratswahl-2026-testwahl-1024x632.jpg`

3. "Ihre Stimme zahlt -- am 8. Marz 3 Stimmen fur SPD Liste Platz 19" -- 5. Marz 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/01/kassra-adloo-plakate-576x1024.webp`

4. "Erste Sitzung des Quartiersbeirats Innenstadt" -- 2. Marz 2026 -- Events
   - Excerpt: "Viel Diskussion -- aber auch viel Potenzial"
   - Image: `/wp-content/uploads/2026/03/WhatsApp-Image-2026-02-26-at-20.28.26-576x1024.jpeg`

5. "Kassra Adloo in den Quartiersbeirat Innenstadt gewahlt" -- 13. Feb 2026 -- Engagement
   - Image: `/wp-content/uploads/2025/08/catering-aschaffenburg-kassra-684x1024.jpeg`

6. "Ruckblick Politik & Pizza" -- 27. Jan 2026 -- Events
   - Excerpt: "Guter Austausch trotz winterlicher Bedingungen"
   - Image: `/wp-content/uploads/2026/01/PXL_20260125_165903730.RAW-01.COVER_-1024x576.jpg`

7. "Ausbildung ist Zukunftspolitik: Auszeichnung als Ausbildungsbetrieb 2026" -- 26. Jan 2026 -- Engagement
   - Image: `/wp-content/uploads/2026/01/kassra-adloo-ihk-ausbildungsbetrieb-2026-urkunde-576x1024.jpeg`

8. "Plakatierungsstart zur Kommunalwahl: Der Wahlkampf wird sichtbar" -- 24. Jan 2026 -- Allgemein
   - Image: `/wp-content/uploads/2026/01/kassra-adloo-plakate-herstallturm-1024x576.webp`

9. "IHK Podiumsdiskussion zur OB-Wahl: Wirtschaft braucht Verlasslichkeit" -- 22. Jan 2026 -- Events
   - Image: `/wp-content/uploads/2026/01/ihk-podiumsdiskussion-ob-kandidaten-2026-01-21-1-576x1024.jpeg`

10. "Barbel Bas zu Gast in Aschaffenburg" -- 20. Jan 2026 -- Events
    - Image: `/wp-content/uploads/2026/01/aschaffenburg-bearbel-bas-neujahrsempfang-spd-1024x684.jpeg`

**CSS Classes (original):** `.bm-blog-archive-20`, `.bm-blog-archive-20-archive-list`, `.bm-blog-archive-20-archive-card`, `.bm-blog-archive-pagination`

---

## 5. BLOG POST SINGLE (`/danke-aschaffenburg/` as reference)

### 5.1 Layout

**Top section:** Full-width with light background (`var(--neutral-ultra-light)`)
- Two-column grid: meta info left, featured image right
- Featured image: 4:3 aspect ratio desktop, 16:9 tablet, `object-fit: cover`

**Main content:** 3:1 grid (article:sidebar)
- Article area max width constrained by `var(--content-width)`
- Side padding: `var(--gutter)`

### 5.2 Meta / Header Area

- Author photo: `4.4rem x 4.4rem`, circular (`border-radius: 50%`), `object-fit: cover`
- Author name and position below photo
- Publication date: "9. Marz 2026"
- Category badge: "Allgemein" with light background

### 5.3 Article Title

- Font size: `calc(var(--text-xxl) * 1.3)`
- Bold weight

### 5.4 Excerpt / Lead

- Font size: `var(--text-l)` (~1.25rem)
- Larger than body text, serves as intro summary

### 5.5 Social Sharing Buttons

- Horizontal row below excerpt
- Platforms: Facebook, Twitter/X, LinkedIn, WhatsApp, Email
- Direct share URLs with encoded post title + image

### 5.6 Sidebar

- `position: sticky; top: var(--space-m)`
- Sticky disabled below 767px (`position: relative`)
- Contents:
  - Author engagement prompt
  - Social media follow buttons (Instagram, TikTok)
  - Additional news feed
- Bordered column dividers

### 5.7 Related Posts Section (bottom)

- 3-column grid
- Same card design as homepage blog cards (3:4 ratio, hover effects)
- Category tag, title, footer icon

**CSS Classes (original):** `.bm-blog-single-13`, `.bm-blog-single-13__inner`, `.bm-blog-single-13__bottom-container`, `.bm-blog-single-2__meta`, `.bm-blog-single-2__author`, `.bm-blog-single-2__photo`

---

## 6. KOMMUNALWAHL 2026 PAGE (`/kommunalwahl-aschaffenburg-2026/`)

### 6.1 Section Order

1. Header
2. Hero section (2-column: text + ballot box image)
3. Timeline section ("Zeitlicher Ueberblick")
4. "Was wird gewahlt?" -- Flip cards
5. "Wer darf wahlen?" -- Feature section
6. "Stimmabgabe" -- 4-step process
7. "Zahlen & Fakten" -- Election statistics
8. Footer

### 6.2 Hero Section

- Two-column grid layout
- Left: heading text with accent label
- Right: ballot box image
  - Image: `kommunalwahl-aschaffenburg-2026-stimmabgabe-wahlurne-1024x683.webp`
  - Aspect ratio: 16:9
  - Border radius: top-right and bottom-right only
  - Desktop: 50vw width; Mobile: 100% with negative margin bleed

### 6.3 Timeline Section

**Layout:**
- 12-column CSS grid
- Dates: columns 1-3 (or 1-4)
- Icon wrapper: column 4
- Content: columns 5-12
- Vertical center line connects all entries
- Dot markers on the line

**6 Timeline Entries:**

1. **26.01. -- 15.02.2026**: Distribution of voting notifications
2. **Upon receipt**: Postal voting application available
3. **From ~16.02.2026**: Postal voting materials dispatched
4. **06.03.2026, 15:00 Uhr**: Deadline for postal voting applications
5. **08.03.2026**: Election day (in-person + postal, deadline 18:00)
6. **Possibly 22.03.2026**: Potential runoff election

**Mobile:** Single column, icon shifts to first position

### 6.4 Flip Cards ("Was wird gewahlt?")

**Layout:** Two cards side by side (responsive to stacked)

**Animation:**
- `transform-style: preserve-3d`
- On hover: `transform: rotateY(180deg)`
- Transition: 0.8s
- Min height: 48rem desktop, 28rem mobile

**Card 1 -- Der Stadtrat:**
- Front: title + description (44 council members, budget, planning)
- Back: image with `object-fit: cover` (council formation details)

**Card 2 -- Der Oberburgermeister:**
- Front: title + description (direct election, administration)
- Back: image (implementation details)

### 6.5 "Wer darf wahlen?" Section

- Alternating text/image layout
- Image: `wahlbenachrichtigung-ausweis-kommunalwahl-aschaffenburg-2026-1024x683.webp`
- Requirements list with text content

### 6.6 "Stimmabgabe" 4-Step Process

Two-column layout (`.bm-how-it-works-24`):

1. Wahlbenachrichtigung (Notification receipt)
2. Art der Stimmabgabe wahlen (Select voting method)
3. Stimme vergeben (Assign votes with personalization)
4. Stimme abgeben (Submit at polling station or postal)

### 6.7 Images Used

- `kommunalwahl-aschaffenburg-2026-stimmabgabe-wahlurne-1024x683.webp`
- `stadtrat-aschaffenburg-symbolbild-1024x683.png`
- `wahlbenachrichtigung-ausweis-kommunalwahl-aschaffenburg-2026-1024x683.webp`
- `beispiel-stimmzettel-kommunalwahl-aschaffenburg-571x1024.webp`

All use `object-fit: cover` or `contain`.

**CSS Classes (original):** `.bm-hero-103`, `.fr-timeline-lima`, `.bm-feature-41`, `.bm-feature-10`, `.bm-how-it-works-24`

---

## 7. LEGAL PAGES

### 7.1 Impressum (`/impressum/`)

**Layout:** Simple single-column text page

**Content structure:**
- H1: "Impressum"
- Section: "Kontakt"
  - Name: Kassra Adloo
  - Address: Friedrichstrasse 3A, 63739 Aschaffenburg
  - Phone: 06021-4389782
  - Email: kassra@adloo.de
- Section: "Redaktionell verantwortlich"
  - Same contact details

### 7.2 Datenschutzerklaerung (`/datenschutzerklaerung/`)

**Layout:** Long-form text page with hierarchical headings

**Major sections:**
1. Datenschutz auf einen Blick (overview)
2. Hosting -- Provider: Hetzner Online GmbH, GDPR Art. 6(1)(f)
3. Allgemeine Hinweise und Pflichtinformationen
   - Responsible: Kassra Adloo, Friedrichstrasse 3A, 63739 Aschaffenburg
   - GDPR articles referenced: 6, 9, 49, and TDDDG section 25
   - Rights: access, correction, deletion, data portability, complaint
   - SSL/TLS encryption noted
4. Datenerfassung auf dieser Website
   - Cookies (session + persistent)
   - Server log files
   - Contact forms
   - Email/phone/fax inquiries
5. Newsletter
   - Provider: Brevo (Sendinblue GmbH)
   - GDPR Art. 6(1)(a) consent basis
   - Analytics + opt-out

**Last modified:** November 13, 2025

### 7.3 Transparenz (`/transparenz/`)

**Layout:** Single-column text page with section headings

**Title:** "Transparenzbekanntmachung zur Kommunalwahl 2026"

**Sections:**
1. Responsible Party: Kassra Adloo, SPD list position 19
2. Campaign Financing: independently conducted, no external sponsors, outdoor ads by SPD Aschaffenburg
3. Advertising Types: website, social media, print, posters
4. Campaign Period: December 2025 -- March 2026
5. Service Providers: web design, hosting, print design, printing, outdoor, social platforms (TikTok, Instagram, Facebook)
6. Data Processing: no personal data targeting, no programmatic ads
7. Archival: 7-year retention

**Last modified:** December 22, 2025

---

## 8. TECHNICAL DETAILS

### 8.1 Original Stack

- WordPress CMS
- Bricks Builder theme/page builder
- Custom CSS variables for design tokens
- HTML5 video (self-hosted)
- Brevo (Sendinblue) for newsletter
- Usermaven for analytics
- Hetzner hosting
- Color scheme switcher (light/dark via localStorage)

### 8.2 Global Behaviors

- `scroll-behavior: smooth` on HTML element
- Light/dark mode toggle (via localStorage)
- Search functionality in header
- Mobile menu toggle at <= 767px
- Schema.org structured data (Organization/Person)

### 8.3 Image Formats

- Primary format: `.webp`
- Fallbacks: `.jpg`, `.jpeg`, `.png`
- Responsive sizes in filenames (e.g., `-1024x683`, `-576x1024`)
- All images use `object-fit: cover` unless noted

### 8.4 CSS Architecture (Original Bricks)

All original classes follow two patterns:
- `.bm-*` -- Custom Bricks modules (e.g., `.bm-hero-58`, `.bm-feature-45`)
- `.brxe-*` -- Bricks element primitives (e.g., `.brxe-block`, `.brxe-heading`, `.brxe-text-basic`)
- `.fr-*` -- Footer/social components (e.g., `.fr-footer-delta`, `.fr-social-alpha`)

---

## 9. ASTRO REBUILD MAPPING

### 9.1 Suggested Component Structure

```
src/
  components/
    Header.astro           -- Sticky nav with logo, links, mobile toggle
    Footer.astro           -- Dark footer with legal links, social, copyright
    HeroHome.astro         -- Full-vh hero with bg image, gradient, balloon
    HeroPage.astro         -- Reusable page hero (Wahl 2026, etc.)
    FeatureCard.astro      -- Priority cards with left border, bullets
    BlogCard.astro         -- Image-overlay blog cards (homepage + related)
    BlogArchiveCard.astro  -- News archive card (image + meta + excerpt)
    Timeline.astro         -- Vertical timeline component
    FlipCard.astro         -- 3D flip card (Wahl 2026)
    ProcessSteps.astro     -- Numbered step component
    SocialLinks.astro      -- Instagram + TikTok links
    ShareButtons.astro     -- Social sharing row
    VideoEmbed.astro       -- HTML5 video with fallback
    BalloonFloat.astro     -- Animated floating balloon
  layouts/
    BaseLayout.astro       -- HTML shell, header, footer, global styles
    BlogPostLayout.astro   -- Single post with sidebar, related posts
  pages/
    index.astro
    news/
      index.astro          -- Archive with pagination
      [page].astro         -- Paginated archive pages (if needed)
    kommunalwahl-aschaffenburg-2026.astro
    danke-aschaffenburg.astro (or dynamic [slug].astro)
    impressum.astro
    datenschutzerklaerung.astro
    transparenz.astro
  content/
    posts/                 -- Markdown/MDX blog posts
  styles/
    global.css             -- Tailwind + custom properties
```

### 9.2 Key Differences from Current Astro Scaffold

The current scaffold has placeholder content and simplified styling. Key gaps:
- **Hero:** Currently uses gradient background, needs full-image hero with overlay + balloon
- **Nav logo:** Currently text-only, needs image logo
- **Feature cards:** Currently basic centered cards, needs left-border + bullets + images + taglines
- **Blog cards:** Currently empty section, needs overlay image cards with hover animations
- **Footer social links:** Currently generic URLs, needs real Instagram/TikTok links
- **Blog post layout:** Not yet implemented (needs 3:1 grid, sidebar, sharing, related)
- **News archive:** Not yet implemented (needs 2-col grid, meta overlays, pagination)
- **Wahl 2026 page:** Not yet implemented (needs timeline, flip cards, process steps)
- **Legal pages:** Not yet implemented
- **Balloon animation:** Not implemented
- **Color scheme:** `--primary` is `#e3000f` in current CSS but original site uses `#CF2E2E`
