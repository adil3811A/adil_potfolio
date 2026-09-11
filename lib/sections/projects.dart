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
      classes: 'w-full py-space-xl max-w-[1200px] mx-auto px-margin-mobile lg:px-margin '
          'flex flex-col gap-space-lg lg:gap-space-xl',
      [
        sectionHeading(
          badge: 'Proven Work',
          badgeIcon: 'apps',
          title: 'Apps in Production',
          lead: 'Cross-platform apps I have built, published and keep running — one published '
              'entirely on my own, five maintained for a client every day.',
          tone: Tone.secondary,
        ),
        _pannaseche(),
        _pressfit(),
        _payments(),
        _alsoBuilt(),
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
            classes: 'flex items-center gap-1 bg-primary-fixed/50 px-2 py-0.5 rounded-full '
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
            [.text('Which unit operation separates a liquid mixture using differences in '
                'relative volatility?')],
          ),
        ]),
        // Answers.
        div(classes: 'flex flex-col gap-2', [
          _answer('A. Absorption', selected: false),
          _answer('B. Distillation', selected: true),
          _answer('C. Leaching', selected: false),
        ]),
        div(
          classes: 'w-full py-2.5 rounded-xl bg-surface-container-highest text-on-surface '
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
        .text('A GATE Chemical Engineering exam-prep app I owned end to end — architecture, '
            'development and release — now live on both stores with '),
        strong([.text('500+ downloads')]),
        .text('. Topic-wise practice questions, timed mock tests, previous-year question banks '
            'and performance analytics, with content delivered through a backend API.'),
      ],
      metrics: const [
        ('500+', 'Downloads', Tone.primary),
        ('2 Stores', 'Android + iOS', Tone.secondary),
        ('End to End', 'Solo Ownership', Tone.tertiary),
      ],
      actions: [
        if (Profile.pannasechePlayStore.isNotEmpty)
          primaryButton('Get it on Google Play', Profile.pannasechePlayStore, 'shop',
              extra: 'px-6 py-2.5')
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
              classes: 'w-7 h-7 rounded-lg bg-secondary text-on-secondary flex items-center '
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
          classes: 'w-full py-2.5 rounded-xl bg-secondary text-on-secondary font-label-md '
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
        .text('Pressfit is one of India’s fastest-growing FMEG brands — conduit pipes, '
            'casing-capping, switches, wires and cables. I maintain and enhance '),
        strong([.text('five of the Flutter apps')]),
        .text(' their channel partners, sales teams and B2B customers use every day, across '
            'Android and iOS: shipping features, scheduling local notifications for time-specific '
            'reminders, integrating REST APIs, and carrying user-reported bugs through to store '
            'release.'),
      ],
      metrics: const [
        ('5 Apps', 'Maintained by me', Tone.primary),
        ('10K+', 'Catalogs installs', Tone.secondary),
        ('4.9 ★', 'Connect rating', Tone.tertiary),
      ],
      actions: [
        primaryButton('All apps on Google Play', pressfitPlayDeveloper, 'arrow_outward',
            extra: 'px-6 py-2.5'),
        quietButton('On the App Store', pressfitAppStoreDeveloper, 'arrow_outward'),
      ],
      extra: _appSuite(),
    );
  }

  /// The five apps, each with whichever store listings are actually live.
  Component _appSuite() {
    return div(classes: 'flex flex-col gap-space-md border-t border-outline-variant/40 pt-space-lg', [
      div(classes: 'flex items-center gap-2', [
        icon('apps', classes: 'text-[18px] text-primary'),
        span(
          classes: 'font-label-md text-label-md text-on-surface-variant uppercase tracking-wider',
          [.text('The apps I look after')],
        ),
      ]),
      div(classes: 'grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-3', [
        for (final app in pressfitApps) _appCard(app),
      ]),
    ]);
  }

  Component _appCard(ClientApp app) {
    return div(
      classes: 'p-4 rounded-2xl bg-surface-container-low flex flex-col gap-2 h-full',
      [
        div(classes: 'flex items-center justify-between gap-2', [
          div(classes: 'flex items-center gap-2.5 min-w-0', [
            div(
              classes: 'w-9 h-9 shrink-0 rounded-xl bg-surface-container-lowest text-primary '
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
      classes: 'inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full '
          'bg-surface-container-lowest text-on-surface-variant hover:text-primary '
          'font-label-sm text-label-sm transition-colors shadow-xs',
      [
        icon(iconName, classes: 'text-[14px] text-primary'),
        span([.text(label)]),
      ],
    );
  }

  // --- Payments ------------------------------------------------------------

  Component _payments() {
    return _shell(
      mockup: _phone(padding: 'p-5 gap-4', [
        div(classes: 'flex justify-center pt-2', [
          div(
            classes: 'w-14 h-14 rounded-full bg-primary-fixed flex items-center '
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
            classes: 'font-display-hero-mobile text-display-hero-mobile text-on-surface '
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
          classes: 'w-full py-2.5 rounded-xl bg-primary text-on-primary font-label-md '
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
        .text(' payment gateway into a production Flutter application, enabling secure in-app '
            'transactions — checkout flow, gateway callbacks and every transaction state handled '
            'end to end.'),
      ],
      metrics: const [
        ('HyperSDK', 'HDFC / JustPay', Tone.primary),
        ('In-App', 'Native Checkout', Tone.secondary),
        ('Live', 'Production Traffic', Tone.tertiary),
      ],
      actions: [
        quietButton('Ask about integrations', '#contact', 'arrow_forward'),
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
              classes: 'font-label-md text-label-md text-on-surface-variant uppercase '
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
              classes: 'w-9 h-9 shrink-0 rounded-xl bg-surface-container-lowest text-primary '
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
        if (project.repo.isNotEmpty)
          div(classes: 'pt-1', [_linkPill('View on GitHub', 'code', project.repo)]),
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
      classes: 'lg:col-span-5 flex justify-center items-center '
          '${mockupFirst ? '' : 'order-1 lg:order-2'}',
      [mockup],
    );
    final story = div(
      classes: 'lg:col-span-7 flex flex-col items-start gap-space-md '
          '${mockupFirst ? '' : 'order-2 lg:order-1'}',
      [
        div(classes: 'flex flex-wrap items-center gap-2', [
          for (final (label, tone) in tags) chip(label, tone: tone),
        ]),
        h3(
          classes: 'font-headline-lg text-headline-lg-mobile md:text-headline-lg '
              'text-on-surface font-bold tracking-tight',
          [.text(title)],
        ),
        p(classes: 'font-body-lg text-body-lg text-on-surface-variant leading-relaxed', lead),
        div(classes: 'grid grid-cols-2 sm:grid-cols-3 gap-3 w-full py-2', [
          for (final (index, metric) in metrics.indexed)
            div(
              classes: 'p-3 rounded-xl bg-surface-container-low '
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
      classes: 'w-full bg-surface-container-lowest rounded-3xl p-6 lg:p-10 shadow-sm '
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
      classes: 'w-[280px] sm:w-[310px] bg-inverse-surface rounded-[40px] p-3 '
          'shadow-[0_20px_40px_-8px_rgba(0,104,95,0.18)]',
      [
        div(classes: 'bg-surface rounded-[32px] overflow-hidden flex flex-col $padding', children),
      ],
    );
  }

  Component _answer(String label, {required bool selected}) {
    return div(
      classes: 'p-3 rounded-xl flex items-center justify-between text-label-md font-label-md '
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
      classes: 'p-2.5 rounded-xl bg-surface-container-lowest flex items-center justify-between '
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
