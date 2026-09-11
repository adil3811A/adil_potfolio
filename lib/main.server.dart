/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
import 'constants/profile.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

const _description = 'Adil Ansari — Flutter developer in Thane, Mumbai. Application Development '
    'Engineer at Codes ’n’ Coffee Tech: five production client apps on Android and iOS, plus '
    'PannaseCHE, published solo with 500+ downloads.';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: '${Profile.name} — ${Profile.role}',
    lang: 'en',
    meta: {
      'description': _description,
      'author': Profile.name,
      'theme-color': '#00685f',
    },
    head: [
      // Fonts: Plus Jakarta Sans for text, Material Symbols for icons.
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(
        rel: 'preconnect',
        href: 'https://fonts.gstatic.com',
        attributes: {'crossorigin': ''},
      ),
      link(
        rel: 'stylesheet',
        href: 'https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap',
      ),
      link(
        rel: 'stylesheet',
        href: 'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&display=swap',
      ),
      // Compiled Tailwind output — see styles/tailwind.css and `npm run build:css`.
      link(rel: 'stylesheet', href: 'styles.css'),
      link(rel: 'icon', href: 'favicon.svg', type: 'image/svg+xml'),
      link(rel: 'apple-touch-icon', href: 'apple-touch-icon.png'),
      // Social preview.
      meta(attributes: {'property': 'og:title', 'content': '${Profile.name} — ${Profile.role}'}),
      meta(attributes: {'property': 'og:description', 'content': _description}),
      meta(attributes: {'property': 'og:type', 'content': 'website'}),
      meta(attributes: {'property': 'og:image', 'content': Profile.portrait}),
      meta(name: 'twitter:card', content: 'summary_large_image'),
    ],
    body: App(),
  ));
}
