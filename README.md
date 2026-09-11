# Adil Ansari — Portfolio

Personal portfolio site for Adil Ansari, Mobile Application Developer.
Built with [Jaspr](https://jaspr.site) (Dart) and styled with Tailwind CSS v4.
The visual design comes from the "Adil Ansari Developer Portfolio" project in
Google Stitch; the tokens from that design system live in `styles/tailwind.css`.

## Project layout

```
lib/
  app.dart              # page shell: header, content, footer, tab bar, enhancement script
  constants/profile.dart# ALL editable content: name, links, stats, services, skills
  components/           # header + mobile tab bar, footer, shared UI helpers
  sections/             # hero, what-i-do, projects, skills, about, contact
styles/
  tailwind.css          # Tailwind source + design tokens  (edit this)
web/
  styles.css            # compiled output                  (generated, do not edit)
  images/portrait.jpg   # placeholder portrait — replace with a real photo
```

## Running it

Styles and the Dart site are built separately. Install once:

```bash
npm install          # Tailwind CLI
dart pub get
```

Then, in two terminals:

```bash
npm run watch:css    # recompiles web/styles.css as you edit classes
jaspr serve          # http://localhost:8080
```

## Building for production

```bash
npm run build:css
jaspr build          # static output in build/jaspr/
```

The site is fully pre-rendered — `build/jaspr/` can be dropped on any static
host (GitHub Pages, Netlify, Firebase Hosting, Cloudflare Pages).

## Content

All copy is drawn from Adil's résumé and lives in `lib/constants/profile.dart`
— contact details, hero stats, services, skills, the experience timeline,
education and side projects. Project write-ups and the device mockups are in
`lib/sections/projects.dart`.

Still to fill in (both marked `TODO` in `profile.dart`):

- `Profile.portrait` — currently AI-generated placeholder art from the Stitch
  design. Drop a real photo in `web/images/` and point this at it.
- `Profile.pannasechePlayStore` / `pannasecheAppStore` — the live store
  listings. While they are empty the project card links to the contact section
  instead of the stores.
