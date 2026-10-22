import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

/// Production work — each card pairs a hand-built device mockup with the story
/// of what was actually shipped.
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'projects',
      classes:
          'w-full py-space-xl max-w-[1200px] mx-auto px-margin-mobile lg:px-margin '
          'flex flex-col gap-space-lg lg:gap-space-xl',
      [
        sectionHeading(
          badge: 'Proven Work',
          badgeIcon: 'apps',
          title: 'Apps in Production',
          lead:
              'Cross-platform apps I have built, published and keep running — DeGeneral, my '
              'flagship on-device AI journal, PannaseCHE published entirely on my own, and five '
              'apps maintained for a client every day.',
          tone: Tone.secondary,
        ),
        _degeneral(),
        _pannaseche(),
        _pressfit(),
        _dial4242(),
        _payments(),
        _buildHub(),
        _alsoBuilt(),
      ],
    );
  }

  // --- DeGeneral — flagship -------------------------------------------------

  Component _degeneral() {
    return _shell(
      mockup: _phone([
        // App bar with the privacy badge.
        div(classes: 'flex items-center justify-between pt-2', [
          icon('menu', classes: 'text-[20px] text-on-surface'),
          span(
            classes: 'font-title-md text-label-md text-on-surface font-bold tracking-tight',
            [.text('DeGeneral')],
          ),
          div(
            classes:
                'flex items-center gap-1 bg-primary-fixed/50 px-2 py-0.5 rounded-full '
                'text-on-primary-fixed font-label-sm text-[11px]',
            [
              icon('lock', classes: 'text-[13px] text-primary'),
              span([.text('On-device')]),
            ],
          ),
        ]),
        // Composer card: title, moods, entry.
        div(classes: 'p-3.5 rounded-2xl bg-surface-container-low flex flex-col gap-2', [
          div(
            classes: 'flex justify-between items-center text-label-sm font-label-sm text-outline',
            [
              span([.text('New entry')]),
              span(classes: 'text-primary font-bold', [.text('112 words')]),
            ],
          ),
          p(
            classes: 'font-title-md text-label-md text-on-surface pt-1 leading-snug',
            [.text('A quiet win I nearly forgot to write down')],
          ),
          p(
            classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed',
            [
              .text(
                'Mood: Reflective · Today · #work, #smallwins — the kind of day that only '
                'makes sense on paper.',
              ),
            ],
          ),
        ]),
        // Local AI actions.
        div(classes: 'flex flex-col gap-2', [
          _aiAction('auto_awesome', 'Refine grammar & spelling', 'Gemma 3 1B · 2.1s'),
          _aiAction('forum', 'Talk it through in Chat', 'Reads your last 3 entries'),
        ]),
        div(
          classes:
              'w-full py-2.5 rounded-xl bg-primary text-on-primary font-label-md '
              'text-label-md text-center mt-1',
          [.text('Save Entry')],
        ),
      ]),
      tags: const [
        ('Flagship', Tone.primary),
        ('Kotlin Multiplatform', Tone.neutral),
        ('On-Device AI', Tone.secondary),
        ('Play Store', Tone.tertiary),
      ],
      title: 'DeGeneral — Private Journal with an AI That Never Leaves the Phone',
      lead: [
        .text('My flagship build. A private journal with an AI companion that runs '),
        strong([.text('entirely on your phone')]),
        .text(
          ': Gemma 3 1B runs on the phone’s own CPU to tidy your writing, suggest '
          'titles and talk things through using your last three entries. No account, no '
          'server, no cloud sync — the only network touch is a one-time, SHA-256-verified '
          'model download. Built with Kotlin Multiplatform and Compose Multiplatform, '
          'feature-first with a hand-rolled DI container.',
        ),
      ],
      metrics: const [
        ('100%', 'On-device, no cloud', Tone.primary),
        ('Gemma 3 1B', 'Runs on the phone CPU', Tone.secondary),
        ('806 MB', 'Verified model install', Tone.tertiary),
      ],
      actions: [
        primaryButton('Get it on Google Play (under review)', Profile.degeneralPlayStore, 'shop', extra: 'px-6 py-2.5'),
        youtubeButton('Watch the demo', Profile.degeneralDemo),
        quietButton('Read the source', Profile.degeneralRepo, 'code'),
      ],
    );
  }

  Component _aiAction(String iconName, String label, String note) {
    return div(
      classes:
          'p-2.5 rounded-xl bg-surface-container-lowest flex items-center justify-between '
          'shadow-xs',
      [
        div(classes: 'flex items-center gap-2.5', [
          div(
            classes:
                'w-8 h-8 rounded-full bg-tertiary-fixed/50 text-tertiary flex items-center '
                'justify-center',
            [icon(iconName, classes: 'text-[16px]')],
          ),
          div(classes: 'flex flex-col', [
            span(
              classes: 'font-label-md text-label-md text-on-surface font-bold',
              [.text(label)],
            ),
            span(
              classes: 'font-body-sm text-[12px] text-outline',
              [.text(note)],
            ),
          ]),
        ]),
        icon('arrow_forward', classes: 'text-[18px] text-primary'),
      ],
    );
  }

  // --- PannaseCHE ----------------------------------------------------------

  Component _pannaseche() {
    return _shell(
      mockup: _phone([
        // App bar.
        div(classes: 'flex items-center justify-between pt-2', [
          icon('menu', classes: 'text-[20px] text-on-surface'),
          span(
            classes: 'font-title-md text-label-md text-on-surface font-bold tracking-tight',
            [.text('PannaseCHE')],
          ),
          div(
            classes:
                'flex items-center gap-1 bg-primary-fixed/50 px-2 py-0.5 rounded-full '
                'text-on-primary-fixed font-label-sm text-[11px]',
            [
              icon('timer', classes: 'text-[13px] text-primary'),
              span([.text('12:40')]),
            ],
          ),
        ]),
        // Question card.
        div(classes: 'p-3.5 rounded-2xl bg-surface-container-low flex flex-col gap-2', [
          div(
            classes: 'flex justify-between items-center text-label-sm font-label-sm text-outline',
            [
              span([.text('Question 04 / 25')]),
              span(classes: 'text-primary font-bold', [.text('Mock Test')]),
            ],
          ),
          div(
            classes: 'w-full h-1.5 rounded-full bg-surface-container-highest overflow-hidden',
            [div(classes: 'w-1/6 h-full bg-primary rounded-full', [])],
          ),
          p(
            classes: 'font-title-md text-label-md text-on-surface pt-1 leading-snug',
            [
              .text(
                'Which unit operation separates a liquid mixture using differences in '
                'relative volatility?',
              ),
            ],
          ),
        ]),
        // Answers.
        div(classes: 'flex flex-col gap-2', [
          _answer('A. Absorption', selected: false),
          _answer('B. Distillation', selected: true),
          _answer('C. Leaching', selected: false),
        ]),
        div(
          classes:
              'w-full py-2.5 rounded-xl bg-surface-container-highest text-on-surface '
              'font-label-md text-label-md text-center mt-1',
          [.text('Next Question →')],
        ),
      ]),
      tags: const [
        ('Built & Published Solo', Tone.primary),
        ('GATE Exam Prep', Tone.neutral),
        ('Play Store & App Store', Tone.secondary),
        ('Flutter', Tone.neutral),
      ],
      title: 'PannaseCHE',
      lead: [
        .text(
          'A GATE Chemical Engineering exam-prep app I owned end to end — architecture, '
          'development and release — now live on both stores with ',
        ),
        strong([.text('1K+ downloads')]),
        .text(
          '. Topic-wise practice questions, timed mock tests, previous-year question banks '
          'and performance analytics, with content delivered through a backend API.',
        ),
      ],
      metrics: const [
        ('1K+', 'Downloads', Tone.primary),
        ('2 Stores', 'Android + iOS', Tone.secondary),
        ('End to End', 'Solo Ownership', Tone.tertiary),
      ],
      actions: [
        if (Profile.pannasechePlayStore.isNotEmpty)
          primaryButton('Get it on Google Play', Profile.pannasechePlayStore, 'shop', extra: 'px-6 py-2.5')
        else
          primaryButton('Ask me about it', '#contact', 'arrow_forward', extra: 'px-6 py-2.5'),
        if (Profile.pannasecheAppStore.isNotEmpty)
          quietButton('Download on the App Store', Profile.pannasecheAppStore, 'arrow_outward')
        else
          div(
            classes: 'inline-flex items-center gap-2 text-on-surface font-label-md text-label-md',
            [
              icon('shop', classes: 'text-primary text-[20px]'),
              span([.text('Live on Google Play & the App Store')]),
            ],
          ),
      ],
    );
  }

  // --- Pressfit client suite ----------------------------------------------

  Component _pressfit() {
    return _shell(
      mockupFirst: false,
      mockup: _phone([
        div(classes: 'flex items-center justify-between pt-2', [
          div(classes: 'flex items-center gap-2', [
            div(
              classes:
                  'w-7 h-7 rounded-lg bg-secondary text-on-secondary flex items-center '
                  'justify-center font-bold text-[12px]',
              [.text('PF')],
            ),
            span(
              classes: 'font-title-md text-label-md text-on-surface font-bold',
              [.text('Pressfit Connect')],
            ),
          ]),
          icon('notifications_active', classes: 'text-[20px] text-on-surface'),
        ]),
        div(classes: 'p-3 rounded-2xl bg-surface-container-low flex flex-col gap-1', [
          span(
            classes: 'font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider',
            [.text('Outstanding')],
          ),
          div(
            classes: 'font-headline-sm text-headline-sm text-on-surface font-extrabold',
            [.text('₹1,24,000')],
          ),
          div(
            classes: 'font-body-sm text-body-sm text-outline',
            [.text('Account ledger • synced today')],
          ),
        ]),
        div(classes: 'flex flex-col gap-2', [
          _lineItem('Invoice #PF-8842', '₹48,200'),
          _lineItem('Invoice #PF-8791', '₹75,800'),
        ]),
        div(
          classes:
              'w-full py-2.5 rounded-xl bg-secondary text-on-secondary font-label-md '
              'text-label-md flex items-center justify-center gap-2 mt-1',
          [
            icon('sync', classes: 'text-[16px]'),
            span([.text('Sync Documents')]),
          ],
        ),
      ]),
      tags: const [
        ('Client Work', Tone.primary),
        ('FMEG Manufacturer', Tone.neutral),
        ('Android + iOS', Tone.secondary),
      ],
      title: 'Pressfit Electrical Solutions',
      lead: [
        .text(
          'Pressfit is one of India’s fastest-growing FMEG brands — conduit pipes, '
          'casing-capping, switches, wires and cables. I maintain and enhance ',
        ),
        strong([.text('five of the Flutter apps')]),
        .text(
          ' their channel partners, sales teams and B2B customers use every day, across '
          'Android and iOS: shipping features, scheduling local notifications for time-specific '
          'reminders, integrating REST APIs, and carrying user-reported bugs through to store '
          'release.',
        ),
      ],
      metrics: const [
        ('5 Apps', 'Maintained by me', Tone.primary),
        ('10K+', 'Catalogs installs', Tone.secondary),
        ('4.9 ★', 'Connect rating', Tone.tertiary),
      ],
      actions: [
        primaryButton('All apps on Google Play', pressfitPlayDeveloper, 'arrow_outward', extra: 'px-6 py-2.5'),
        quietButton('On the App Store', pressfitAppStoreDeveloper, 'arrow_outward'),
      ],
      extra: _appSuite(pressfitApps, 'The apps I look after'),
    );
  }

  /// The apps in a client's suite, each with whichever store listings are live.
  Component _appSuite(List<ClientApp> apps, String label) {
    return div(
      classes: 'flex flex-col gap-space-md border-t border-outline-variant/40 pt-space-lg',
      [
        div(classes: 'flex items-center gap-2', [
          icon('apps', classes: 'text-[18px] text-primary'),
          span(
            classes: 'font-label-md text-label-md text-on-surface-variant uppercase tracking-wider',
            [.text(label)],
          ),
        ]),
        div(classes: 'grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-3', [
          for (final app in apps) _appCard(app),
        ]),
      ],
    );
  }

  Component _appCard(ClientApp app) {
    return div(
      classes: 'p-4 rounded-2xl bg-surface-container-low flex flex-col gap-2 h-full',
      [
        div(classes: 'flex items-center justify-between gap-2', [
          div(classes: 'flex items-center gap-2.5 min-w-0', [
            div(
              classes:
                  'w-9 h-9 shrink-0 rounded-xl bg-surface-container-lowest text-primary '
                  'flex items-center justify-center shadow-xs',
              [icon(app.icon, classes: 'text-[20px]')],
            ),
            span(
              classes: 'font-label-md text-label-md text-on-surface font-bold truncate',
              [.text(app.name)],
            ),
          ]),
          if (app.note.isNotEmpty)
            span(
              classes: 'shrink-0 font-label-sm text-label-sm text-on-surface-variant',
              [.text(app.note)],
            ),
        ]),
        p(
          classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed grow',
          [.text(app.body)],
        ),
        div(classes: 'flex flex-wrap gap-1.5 pt-1', [
          if (app.play.isNotEmpty) _linkPill('Google Play', 'shop', app.play),
          if (app.appStore.isNotEmpty) _linkPill('App Store', 'phone_iphone', app.appStore),
        ]),
      ],
    );
  }

  /// Small outbound link pill — store listings and repos both use it.
  Component _linkPill(String label, String iconName, String href) {
    return a(
      href: href,
      target: Target.blank,
      classes:
          'inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full '
          'bg-surface-container-lowest text-on-surface-variant hover:text-primary '
          'font-label-sm text-label-sm transition-colors shadow-xs',
      [
        icon(iconName, classes: 'text-[14px] text-primary'),
        span([.text(label)]),
      ],
    );
  }

  // --- Dial4242 legacy maintenance -----------------------------------------

  Component _dial4242() {
    return _shell(
      mockup: _phone([
        div(classes: 'flex items-center justify-between pt-2', [
          div(classes: 'flex items-center gap-2', [
            icon('emergency', classes: 'text-[20px] text-primary'),
            span(
              classes: 'font-title-md text-label-md text-on-surface font-bold tracking-tight',
              [.text('DIAL 4242')],
            ),
          ]),
          span(
            classes:
                'px-2 py-0.5 rounded-full bg-primary-fixed/50 text-on-primary-fixed '
                'font-label-sm text-[11px]',
            [.text('On the way')],
          ),
        ]),
        div(classes: 'p-3.5 rounded-2xl bg-surface-container-low flex flex-col gap-1', [
          span(
            classes: 'font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider',
            [.text('Arriving in')],
          ),
          div(
            classes: 'font-headline-sm text-headline-sm text-on-surface font-extrabold',
            [.text('6 min')],
          ),
          div(
            classes: 'font-body-sm text-body-sm text-outline',
            [.text('MH-04 · Basic Life Support')],
          ),
        ]),
        div(
          classes:
              'p-3 rounded-xl bg-surface-container-lowest flex items-center justify-between '
              'shadow-xs',
          [
            div(classes: 'flex items-center gap-2.5', [
              div(
                classes:
                    'w-8 h-8 rounded-full bg-surface-container-high text-on-surface-variant '
                    'flex items-center justify-center',
                [icon('person', classes: 'text-[18px]')],
              ),
              div(classes: 'flex flex-col', [
                span(
                  classes: 'font-label-md text-label-md text-on-surface font-bold',
                  [.text('Driver assigned')],
                ),
                span(
                  classes: 'font-body-sm text-[12px] text-outline',
                  [.text('Estimated fare ₹1,250')],
                ),
              ]),
            ]),
            icon('call', classes: 'text-[18px] text-primary'),
          ],
        ),
        div(
          classes:
              'w-full py-2.5 rounded-xl bg-primary text-on-primary font-label-md '
              'text-label-md flex items-center justify-center gap-2 mt-1',
          [
            icon('my_location', classes: 'text-[16px]'),
            span([.text('Track Ambulance')]),
          ],
        ),
      ]),
      tags: const [
        ('Client Work', Tone.primary),
        ('Legacy Maintenance', Tone.neutral),
        ('Native Android', Tone.secondary),
        ('Java + XML', Tone.neutral),
      ],
      title: 'Dial4242 — Ambulance Booking Platform',
      lead: [
        .text(
          'An emergency service that books and tracks the nearest ambulance, with apps for '
          'riders, drivers and fleet owners. This one is older than my Flutter work and stays '
          'that way: ',
        ),
        strong([.text('native Android, Java and XML')]),
        .text(
          '. I keep it running — fixing bugs and adding small features to a live medical '
          'service without destabilising a codebase I did not write.',
        ),
      ],
      metrics: const [
        ('10K+', 'Rider installs', Tone.primary),
        ('3 Apps', 'Rider · Driver · Owner', Tone.secondary),
        ('Java + XML', 'Native Android', Tone.tertiary),
      ],
      actions: [
        primaryButton('See them on Google Play', dial4242PlayDeveloper, 'arrow_outward', extra: 'px-6 py-2.5'),
      ],
      extra: _appSuite(dial4242Apps, 'The three apps'),
    );
  }

  // --- Payments ------------------------------------------------------------

  Component _payments() {
    return _shell(
      mockupFirst: false,
      mockup: _phone(padding: 'p-5 gap-4', [
        div(classes: 'flex justify-center pt-2', [
          div(
            classes:
                'w-14 h-14 rounded-full bg-primary-fixed flex items-center '
                'justify-center text-primary',
            [icon('check_circle', classes: 'text-[32px]')],
          ),
        ]),
        div(classes: 'text-center', [
          span(
            classes: 'font-label-sm text-label-sm text-outline uppercase tracking-wider',
            [.text('Payment Successful')],
          ),
          div(
            classes:
                'font-display-hero-mobile text-display-hero-mobile text-on-surface '
                'font-extrabold mt-1',
            [.text('₹12,400')],
          ),
          span(
            classes: 'font-body-sm text-body-sm text-on-surface-variant',
            [.text('Order #PF-8842')],
          ),
        ]),
        div(classes: 'p-3.5 rounded-2xl bg-surface-container-low flex flex-col gap-2', [
          _receiptRow(
            'Gateway',
            span(classes: 'font-semibold text-on-surface', [.text('HDFC HyperSDK')]),
          ),
          _receiptRow('Mode', span(classes: 'font-semibold text-on-surface', [.text('UPI')])),
          _receiptRow(
            'Txn ID',
            span(classes: 'font-mono text-[12px] text-outline', [.text('TXN-90281-OK')]),
          ),
        ]),
        div(
          classes:
              'w-full py-2.5 rounded-xl bg-primary text-on-primary font-label-md '
              'text-label-md flex items-center justify-center gap-1.5 shadow-sm',
          [
            icon('receipt_long', classes: 'text-[16px]'),
            span([.text('View Receipt')]),
          ],
        ),
      ]),
      tags: const [
        ('Payments', Tone.primary),
        ('HDFC HyperSDK', Tone.secondary),
        ('In Production', Tone.neutral),
      ],
      title: 'Secure In-App Payments',
      lead: [
        .text('Integrated the '),
        strong([.text('HDFC HyperSDK (JustPay)')]),
        .text(
          ' payment gateway into a production Flutter application, enabling secure in-app '
          'transactions — checkout flow, gateway callbacks and every transaction state handled '
          'end to end.',
        ),
      ],
      metrics: const [
        ('HyperSDK', 'HDFC / JustPay', Tone.primary),
        ('In-App', 'Native Checkout', Tone.secondary),
      ],
      actions: [
        quietButton('Ask about integrations', '#contact', 'arrow_forward'),
      ],
    );
  }

  // --- Build Hub (in development) ------------------------------------------

  Component _buildHub() {
    return _shell(
      mockupFirst: false,
      mockup: _console([
        // Pipeline stage tracker.
        div(classes: 'grid grid-cols-5 gap-1 pt-1', [
          _stage('merge', done: true),
          _stage('build', done: true),
          _stage('test', done: true),
          _stage('approve', done: true),
          _stage('play', done: false),
        ]),
        // Release awaiting the sealed approval.
        div(classes: 'p-3 rounded-xl bg-surface-container-low flex flex-col gap-1.5', [
          div(
            classes: 'flex justify-between items-center text-label-sm font-label-sm text-outline',
            [
              span([.text('PannaseCHE')]),
              span([.text('#15')]),
            ],
          ),
          div(
            classes: 'flex justify-between items-center text-label-md font-label-md text-on-surface',
            [
              span([.text('Version 1.0.15')]),
              div(
                classes:
                    'flex items-center gap-1 px-2 py-0.5 rounded-full bg-tertiary-fixed/50 '
                    'text-tertiary font-label-sm text-[11px]',
                [
                  icon('verified', classes: 'text-[12px]'),
                  span([.text('Sealed')]),
                ],
              ),
            ],
          ),
        ]),
        // Decision log lines.
        div(classes: 'flex flex-col gap-1.5 pt-1', [
          _logLine('shield', "CI identity: GitHub OIDC — no secrets in any repo", 'text-primary'),
          _logLine('key', 'Approval seal verified · HMAC-SHA256', 'text-tertiary'),
          _logLine('fact_check', 'race check: guarded transition won', 'text-outline'),
        ]),
      ]),
      tags: const [
        ('In Development', Tone.primary),
        ('CI/CD Infrastructure', Tone.neutral),
        ('GitHub OIDC', Tone.secondary),
        ('AWS Lambda + Postgres', Tone.neutral),
      ],
      title: 'Build Hub — Merge-to-Play Release Pipeline',
      lead: [
        .text(
          'The release backbone I\u2019m building for our team\u2019s Flutter apps: a merge '
          'into the build branch triggers CI to build once, testers install that exact '
          'build, a human approves, and the same AAB uploads to Google Play ',
        ),
        strong([.text('with zero release secrets in any git repository')]),
        .text(
          '. CI never writes state: it is identified by GitHub\u2019s OIDC token and asks '
          'the API, which owns every decision. Approvals carry an HMAC seal the deploy step '
          're-verifies along with the approver\u2019s current role, every status change is a '
          'guarded transaction so two approvers or two CI runs can never win at once, and '
          'testers\u2019 install links are signed by their phone\u2019s Keystore key. Built on '
          'Hono + AWS Lambda, Neon Postgres behind a small Firestore-compatible document '
          'store, an outbox that runs the follow-up steps after every build change, and '
          'S3 presigned uploads so files never pass through the server.',
        ),
      ],
      metrics: const [
        ('0 Secrets', 'Stored in app repos', Tone.primary),
        ('HMAC Seal', 'Every approval verified', Tone.secondary),
        ('Guarded', 'Race-safe status changes', Tone.tertiary),
      ],
      actions: [
        div(
          classes:
              'inline-flex items-center gap-2 text-on-surface-variant '
              'font-label-md text-label-md',
          [
            icon('lock', classes: 'text-primary text-[20px]'),
            span([.text('Private internal tool')]),
          ],
        ),
      ],
    );
  }

  /// One pipeline stage in the console mockup: a dot with a label under it.
  Component _stage(String label, {required bool done}) {
    return div(
      classes: 'flex flex-col items-center gap-1',
      [
        done
            ? icon('check_circle', classes: 'text-[20px] text-primary')
            : icon('radio_button_unchecked', classes: 'text-[20px] text-outline'),
        span(
          classes:
              'font-label-sm text-[9px] uppercase tracking-wide '
              '${done ? 'text-primary' : 'text-outline'}',
          [.text(label)],
        ),
      ],
    );
  }

  /// A styled decision-log row inside the console mockup.
  Component _logLine(String iconName, String message, String iconColor) {
    return div(
      classes: 'p-2 rounded-lg bg-surface-container-lowest flex items-center gap-2 shadow-xs',
      [
        icon(iconName, classes: 'text-[13px] $iconColor'),
        span(
          classes: 'font-mono text-[10px] text-on-surface-variant truncate',
          [.text(message)],
        ),
      ],
    );
  }

  // --- Side projects -------------------------------------------------------

  /// Personal builds, each with the repo to read.
  Component _alsoBuilt() {
    return div(
      classes: 'flex flex-col gap-space-md border-t border-outline-variant/40 pt-space-lg',
      [
        div(classes: 'flex flex-wrap items-center justify-between gap-space-sm', [
          div(classes: 'flex items-center gap-2', [
            icon('build', classes: 'text-[18px] text-primary'),
            span(
              classes:
                  'font-label-md text-label-md text-on-surface-variant uppercase '
                  'tracking-wider',
              [.text('Also built')],
            ),
          ]),
          p(
            classes: 'font-body-sm text-body-sm text-outline',
            [.text('Side projects, source included.')],
          ),
        ]),
        div(classes: 'grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-3', [
          for (final project in sideProjects) _sideProjectCard(project),
        ]),
      ],
    );
  }

  Component _sideProjectCard(SideProject project) {
    return div(
      classes: 'p-4 rounded-2xl bg-surface-container-low flex flex-col gap-2 h-full',
      [
        div(classes: 'flex items-center justify-between gap-2', [
          div(classes: 'flex items-center gap-2.5 min-w-0', [
            div(
              classes:
                  'w-9 h-9 shrink-0 rounded-xl bg-surface-container-lowest text-primary '
                  'flex items-center justify-center shadow-xs',
              [icon(project.icon, classes: 'text-[20px]')],
            ),
            span(
              classes: 'font-label-md text-label-md text-on-surface font-bold',
              [.text(project.title)],
            ),
          ]),
          if (project.note.isNotEmpty)
            span(
              classes: 'shrink-0 font-label-sm text-label-sm text-on-surface-variant',
              [.text(project.note)],
            ),
        ]),
        p(
          classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed grow',
          [.text(project.body)],
        ),
        div(classes: 'flex flex-wrap gap-1.5', [
          for (final tag in project.tags) chip(tag, size: 'px-2.5 py-1'),
        ]),
        if (project.repo.isNotEmpty) div(classes: 'pt-1', [_linkPill('View on GitHub', 'code', project.repo)]),
      ],
    );
  }

  // --- Building blocks -----------------------------------------------------

  /// Card shell: device mockup on one side, the story on the other.
  Component _shell({
    required Component mockup,
    required List<(String, Tone)> tags,
    required String title,
    required List<Component> lead,
    required List<(String, String, Tone)> metrics,
    required List<Component> actions,
    bool mockupFirst = true,
    Component? extra,
  }) {
    final mockupColumn = div(
      classes:
          'lg:col-span-5 flex justify-center items-center '
          '${mockupFirst ? '' : 'order-1 lg:order-2'}',
      [mockup],
    );
    final story = div(
      classes:
          'lg:col-span-7 flex flex-col items-start gap-space-md '
          '${mockupFirst ? '' : 'order-2 lg:order-1'}',
      [
        div(classes: 'flex flex-wrap items-center gap-2', [
          for (final (label, tone) in tags) chip(label, tone: tone),
        ]),
        h3(
          classes:
              'font-headline-lg text-headline-lg-mobile md:text-headline-lg '
              'text-on-surface font-bold tracking-tight',
          [.text(title)],
        ),
        p(classes: 'font-body-lg text-body-lg text-on-surface-variant leading-relaxed', lead),
        div(classes: 'grid grid-cols-2 sm:grid-cols-3 gap-3 w-full py-2', [
          for (final (index, metric) in metrics.indexed)
            div(
              classes:
                  'p-3 rounded-xl bg-surface-container-low '
                  '${index == 2 ? 'col-span-2 sm:col-span-1' : ''}',
              [
                span(
                  classes: 'block font-title-md text-title-md ${toneText(metric.$3)} font-bold',
                  [.text(metric.$1)],
                ),
                span(
                  classes: 'font-label-sm text-label-sm text-on-surface-variant',
                  [.text(metric.$2)],
                ),
              ],
            ),
        ]),
        div(classes: 'flex flex-wrap items-center gap-space-md pt-2', actions),
      ],
    );

    return div(
      classes:
          'w-full bg-surface-container-lowest rounded-3xl p-6 lg:p-10 shadow-sm '
          'flex flex-col gap-space-lg',
      [
        div(
          classes: 'grid grid-cols-1 lg:grid-cols-12 gap-space-lg items-center',
          mockupFirst ? [mockupColumn, story] : [story, mockupColumn],
        ),
        if (extra != null) extra,
      ],
    );
  }

  /// Stylised phone frame that wraps the simulated app screens.
  Component _phone(List<Component> children, {String padding = 'p-4 gap-3'}) {
    return div(
      classes:
          'w-[280px] sm:w-[310px] bg-inverse-surface rounded-[40px] p-3 '
          'shadow-[0_20px_40px_-8px_rgba(0,104,95,0.18)]',
      [
        div(classes: 'bg-surface rounded-[32px] overflow-hidden flex flex-col $padding', children),
      ],
    );
  }

  /// Terminal-window style frame for the Build Hub console mockup.
  Component _console(List<Component> children) {
    return div(
      classes:
          'w-[300px] sm:w-[340px] bg-inverse-surface rounded-2xl p-2.5 '
          'shadow-[0_20px_40px_-8px_rgba(0,104,95,0.18)]',
      [
        // Window title bar: traffic-light dots + the browser-tab label.
        div(
          classes: 'flex items-center gap-1.5 px-2 pb-2 pt-1',
          [
            div(classes: 'w-2.5 h-2.5 rounded-full bg-red-400', []),
            div(classes: 'w-2.5 h-2.5 rounded-full bg-yellow-400', []),
            div(classes: 'w-2.5 h-2.5 rounded-full bg-green-400', []),
            span(
              classes: 'ml-2 font-mono text-[10px] text-on-surface-variant truncate',
              [.text('build-hub-internal · pipeline')],
            ),
          ],
        ),
        div(
          classes: 'bg-surface rounded-xl overflow-hidden flex flex-col p-4 gap-3',
          children,
        ),
      ],
    );
  }

  Component _answer(String label, {required bool selected}) {
    return div(
      classes:
          'p-3 rounded-xl flex items-center justify-between text-label-md font-label-md '
          '${selected ? 'bg-primary text-on-primary shadow-sm' : 'bg-surface-container-lowest text-on-surface-variant shadow-xs'}',
      [
        span([.text(label)]),
        icon(
          selected ? 'check_circle' : 'radio_button_unchecked',
          classes: selected ? 'text-[16px] text-on-primary' : 'text-[16px] text-outline',
        ),
      ],
    );
  }

  Component _lineItem(String label, String quantity) {
    return div(
      classes:
          'p-2.5 rounded-xl bg-surface-container-lowest flex items-center justify-between '
          'text-body-sm text-on-surface shadow-xs',
      [
        span(classes: 'font-label-md text-label-md', [.text(label)]),
        span(classes: 'font-semibold text-primary', [.text(quantity)]),
      ],
    );
  }

  Component _receiptRow(String label, Component value) {
    return div(
      classes: 'flex justify-between items-center text-body-sm text-on-surface-variant',
      [
        span([.text(label)]),
        value,
      ],
    );
  }
}
