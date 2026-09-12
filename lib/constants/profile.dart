/// Everything about *you* lives here — edit this file, not the components.
/// Content is drawn from Adil's résumé (Flutter, 1+ yr production).
library;

class Profile {
  static const name = 'Adil Ansari';
  static const role = 'Flutter Developer';
  static const title = 'Application Development Engineer I';
  static const company = "Codes 'n' Coffee Tech";
  static const location = 'Thane, Maharashtra, India';

  static const email = 'ansari89561@gmail.com';
  static const phone = '+91 97654 91703';
  static const mailto = 'mailto:$email';
  static const whatsapp = 'https://wa.me/919765491703';

  static const github = 'https://github.com/adil3811A';
  static const linkedin = 'https://www.linkedin.com/in/adil3811k/';

  /// Square crop used in the hero card and as the social-preview image.
  /// Both crops are generated from `assets/portrait-source.png`.
  static const portrait = 'images/portrait.jpg';

  /// Tight head-and-shoulders crop for the small circles (header, About).
  static const avatar = 'images/avatar.jpg';

  /// Live store listings for PannaseCHE.
  static const pannasechePlayStore =
      'https://play.google.com/store/apps/details?id=com.pannaseche.gate&hl=en';
  static const pannasecheAppStore = 'https://apps.apple.com/us/app/pannaseche/id6762131658';
}

/// A link in the desktop header / mobile bottom bar.
class NavItem {
  const NavItem(this.label, this.href, this.icon);

  final String label;
  final String href;
  final String icon;
}

/// Ordered to match the order the sections appear on the page.
const navItems = [
  NavItem('Projects', '#projects', 'apps'),
  NavItem('Experience', '#experience', 'work_history'),
  NavItem('Skills', '#skills', 'code_blocks'),
  NavItem('About', '#about', 'person'),
  NavItem('Contact', '#contact', 'send'),
];

/// Bottom bar on phones — four targets, not five.
const mobileNavItems = [
  NavItem('Home', '#top', 'cottage'),
  NavItem('Work', '#projects', 'layers'),
  NavItem('Skills', '#skills', 'code_blocks'),
  NavItem('Contact', '#contact', 'send'),
];

/// Colour role used to tint an accent (icon tile, metric, chip).
enum Tone { primary, secondary, tertiary, neutral }

class Stat {
  const Stat(this.value, this.label, this.tone);

  final String value;
  final String label;
  final Tone tone;
}

const heroStats = [
  Stat('500+', 'App Downloads', Tone.primary),
  Stat('8 Live', 'Client Apps', Tone.secondary),
  Stat('1+ Year', 'In Production', Tone.neutral),
];

/// --- Pressfit Electrical Solutions -----------------------------------------
/// Client whose Flutter apps Adil maintains. Details below are taken from the
/// live store listings.

const pressfitPlayDeveloper =
    'https://play.google.com/store/apps/dev?id=6474024959592551820&hl=en_IN';
const pressfitAppStoreDeveloper =
    'https://apps.apple.com/in/developer/press-fit-pipe-and-profile/id1444574965';

class ClientApp {
  const ClientApp({
    required this.name,
    required this.icon,
    required this.body,
    this.play = '',
    this.appStore = '',
    this.note = '',
  });

  final String name;
  final String icon;
  final String body;
  final String play;
  final String appStore;

  /// Rating or install count as shown on the store, when there is one worth showing.
  final String note;
}

const pressfitApps = [
  ClientApp(
    name: 'Pressfit Connect',
    icon: 'receipt_long',
    body:
        'One place for B2B customers to pull up their important documents — invoices through '
        'to account ledgers — with product filtering on top.',
    play: 'https://play.google.com/store/apps/details?id=com.pressfit.connectlive',
    appStore: 'https://apps.apple.com/in/app/pressfit-connect/id1629675477',
    note: '4.9 ★',
  ),
  ClientApp(
    name: 'Pressfit Catalogs',
    icon: 'menu_book',
    body:
        'The latest price lists and product catalogues for channel partners, stored on-device '
        'for poor-signal regions and shareable straight to WhatsApp or email.',
    play: 'https://play.google.com/store/apps/details?id=com.pressfit',
    appStore: 'https://apps.apple.com/in/app/pressfit-catalogs/id1457417002',
    note: '10K+ installs',
  ),
  ClientApp(
    name: 'Pressfit On-The-Go',
    icon: 'insights',
    body:
        'Information simplified for the field sales team: a dashboard for real-time data '
        'analysis and the reporting that hangs off it.',
    play: 'https://play.google.com/store/apps/details?id=com.pressfit.otg&hl=en_IN',
    appStore: 'https://apps.apple.com/in/app/pressfit-on-the-go/id1624001173',
    note: '4.5 ★',
  ),
  ClientApp(
    name: 'Pressfit Vision',
    icon: 'visibility',
    body:
        'A utility built to make the sales team’s day-to-day tasks easier to manage from their '
        'phone.',
    appStore: 'https://apps.apple.com/in/app/pressfit-vision/id6476973756',
  ),
  ClientApp(
    name: 'Pressfit Uploads',
    icon: 'cloud_upload',
    body: 'Attachments without the desk: pick the invoice, capture the image, sync and upload.',
    play: 'https://play.google.com/store/apps/details?id=com.pressfit.uploads',
    note: 'Android',
  ),
];

/// --- Dial4242 ---------------------------------------------------------------
/// Legacy native-Android (Java/XML) ambulance platform under maintenance.

const dial4242PlayDeveloper = 'https://play.google.com/store/apps/developer?id=Dial4242&hl=en_IN';

const dial4242Apps = [
  ClientApp(
    name: 'DIAL 4242',
    icon: 'emergency',
    body: 'The rider app: book and track the nearest ambulance, see the estimated fare and time '
        'to arrival, and pay digitally — for emergencies and for scheduled trips alike.',
    play: 'https://play.google.com/store/apps/details?id=com.ambulance.dial4242.user',
    note: '10K+ installs',
  ),
  ClientApp(
    name: 'DIAL 4242 — Driver',
    icon: 'local_shipping',
    body: 'Drivers take fare requests from riders, get the best route to the destination, and '
        'check fare history and what is payable or receivable.',
    play: 'https://play.google.com/store/apps/details?id=com.ambulance.dial4242.driver',
    note: '4.6 ★',
  ),
  ClientApp(
    name: 'Dial 4242 — Owner',
    icon: 'dashboard',
    body: 'Fleet owners track their own ambulances, review every trip their drivers have run, '
        'and settle payments — without buying separate GPS hardware.',
    play: 'https://play.google.com/store/apps/details?id=com.ambulance.dial4242.owner',
    note: '5.0 ★',
  ),
];

/// Prompts offered in the assistant widget: (chip label, question it fills in).
const chatSuggestions = [
  ('Flutter state management?', 'What is his experience with Flutter state management?'),
  ('Remote timezone overlap?', 'Can Adil work with US / European remote time zones?'),
  ('Notice period & expectations', 'What is his notice period and expected compensation?'),
];

/// A card in the "Skills & Superpowers" grid.
class Capability {
  const Capability({
    required this.icon,
    required this.tone,
    required this.title,
    required this.body,
    required this.tags,
  });

  final String icon;
  final Tone tone;
  final String title;
  final String body;
  final List<String> tags;
}

const skills = [
  Capability(
    icon: 'terminal',
    tone: Tone.primary,
    title: 'Mobile Development',
    body: 'Cross-platform Flutter, plus native Android where the platform demands it.',
    tags: ['Flutter', 'Dart', 'Kotlin / Java', 'Jetpack Compose'],
  ),
  Capability(
    icon: 'account_tree',
    tone: Tone.secondary,
    title: 'State & Architecture',
    body: 'Structure that survives the second year of a codebase, not just the first sprint.',
    tags: ['Bloc', 'Riverpod', 'MVVM', 'Clean Architecture'],
  ),
  Capability(
    icon: 'cloud_sync',
    tone: Tone.tertiary,
    title: 'Backend & Data',
    body: 'Connecting apps to APIs and databases, online and offline.',
    tags: ['REST APIs', 'Firebase', 'Supabase', 'SQLite / Hive'],
  ),
  Capability(
    icon: 'publish',
    tone: Tone.primary,
    title: 'Delivery & Payments',
    body: 'Automated pipelines, store releases, and secure in-app payments.',
    tags: ['GitHub Actions', 'TestFlight', 'HDFC HyperSDK', 'Push / FCM'],
  ),
];

/// A role on the experience timeline.
class Role {
  const Role({
    required this.title,
    required this.org,
    required this.place,
    required this.period,
    required this.current,
    required this.points,
  });

  final String title;
  final String org;
  final String place;
  final String period;
  final bool current;
  final List<String> points;
}

const roles = [
  Role(
    title: 'Application Development Engineer I',
    org: "Codes 'n' Coffee Tech",
    place: 'Thane, MH',
    period: 'Sept 2025 — Present',
    current: true,
    points: [
      'Maintain and enhance five production Flutter apps for client Pressfit Electrical Solutions '
          '— Connect, On-The-Go, Vision, Uploads and Catalogs — across Android and iOS.',
      'Built and independently published PannaseCHE end to end: architecture, development and '
          'release, now live on both stores with 500+ downloads.',
      'Integrated the HDFC HyperSDK payment gateway into a Flutter app for secure in-app '
          'transactions.',
      'Maintain Dial4242, a legacy native Android (Java + XML) ambulance-booking platform of '
          'three apps — rider, driver and fleet owner — shipping bug fixes and small features to '
          'a live emergency service.',
      'Leading the ground-up rewrite of a legacy native Android app in React Native, replacing an '
          'unstable, bug-prone build with a maintainable cross-platform architecture.',
      'Built a GitHub Actions CI/CD pipeline that compiles APKs and App Bundles and delivers them '
          'to the Play Store and TestFlight automatically.',
    ],
  ),
  Role(
    title: 'Android Developer Intern',
    org: 'Horyzen',
    place: 'Remote',
    period: 'Dec 2024 — Feb 2025',
    current: false,
    points: [
      'Contributed to a high-traffic social media application as part of the Android team.',
      'Implemented navigation flows and secure user authentication.',
      'Integrated REST APIs for real-time data sync, focused on efficient JSON parsing.',
    ],
  ),
];

class Education {
  const Education(this.degree, this.school, this.period);

  final String degree;
  final String school;
  final String period;
}

const education = Education(
  "Bachelor's in Software Development",
  'Tata Institute of Social Sciences (TISS), Mumbai',
  '2022 — 2025',
);

/// Something built outside client work, with the repo to read.
class SideProject {
  const SideProject({
    required this.title,
    required this.icon,
    required this.body,
    required this.tags,
    this.repo = '',
    this.note = '',
  });

  final String title;
  final String icon;
  final String body;
  final List<String> tags;
  final String repo;

  /// Short qualifier shown beside the title (platform, status).
  final String note;
}

const sideProjects = [
  SideProject(
    title: 'Recipe App',
    icon: 'restaurant',
    body:
        'Recipe discovery on the Spoonacular API — one-tap Google sign-in, favourites saved to '
        'Firestore, a nutrition breakdown per recipe and Coil-cached imagery. Clean architecture '
        'with manual dependency injection and Codemagic builds.',
    tags: ['Kotlin', 'Jetpack Compose', 'Retrofit', 'Firebase'],
    repo: 'https://github.com/adil3811A/Recipe-App',
    note: 'Android',
  ),
  SideProject(
    title: 'This portfolio site',
    icon: 'code_blocks',
    body:
        'The page you are reading. Written in Dart with Jaspr and pre-rendered to static HTML, '
        'styled from design tokens exported out of a Stitch design system — no client framework, '
        'under a megabyte of output.',
    tags: ['Dart', 'Jaspr', 'Tailwind v4', 'Static Site'],
    repo: 'https://github.com/adil3811A/adil_potfolio',
    note: 'Web',
  ),
  SideProject(
    title: 'Real-Time Communication App',
    icon: 'forum',
    body:
        'Messaging app built on the Firebase Realtime Database with snapshot listeners and a '
        'responsive Compose UI tuned for low-latency updates.',
    tags: ['Jetpack Compose', 'Firebase', 'MVVM'],
    note: 'Android',
  ),
];
