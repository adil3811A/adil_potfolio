import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

class Contact extends StatelessComponent {
  const Contact({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'contact',
      classes: 'w-full pb-space-xl max-w-[1200px] mx-auto px-margin-mobile lg:px-margin',
      [
        div(
          classes: 'relative w-full rounded-3xl bg-surface-container-lowest shadow-xl '
              'p-8 lg:p-14 overflow-hidden',
          [
            div(
              classes: 'absolute top-0 right-0 w-96 h-96 bg-primary-fixed/25 rounded-full '
                  'blur-3xl pointer-events-none',
              [],
            ),
            div(
              classes: 'absolute bottom-0 left-0 w-80 h-80 bg-secondary-fixed/30 rounded-full '
                  'blur-3xl pointer-events-none',
              [],
            ),
            div(
              classes: 'relative z-10 flex flex-col items-center text-center max-w-2xl '
                  'mx-auto gap-space-md',
              [
                div(
                  classes: 'inline-flex items-center gap-2 px-4 py-1.5 rounded-full '
                      'bg-primary-fixed/50 text-on-primary-fixed-variant font-label-sm text-label-sm',
                  [
                    span(classes: 'w-2 h-2 rounded-full bg-primary animate-ping', []),
                    span([.text("Let's collaborate")]),
                  ],
                ),
                h2(
                  classes: 'font-display-hero text-headline-lg lg:text-display-hero text-on-surface '
                      'font-extrabold tracking-tight leading-tight',
                  [.text('Let’s build something together.')],
                ),
                p(
                  classes: 'font-body-lg text-body-lg text-on-surface-variant leading-relaxed',
                  [
                    .text('Have an app idea from scratch, need to upgrade your existing mobile '
                        'product, or looking to add a dedicated Flutter developer to your team? '
                        'Let’s chat.'),
                  ],
                ),
                _actions(),
                _directLines(),
                _socials(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _actions() {
    return div(
      classes: 'flex flex-col sm:flex-row items-center gap-space-sm pt-space-xs w-full sm:w-auto',
      [
        a(
          href: Profile.mailto,
          classes: 'w-full sm:w-auto inline-flex items-center justify-center gap-2 px-8 py-3.5 '
              'rounded-full bg-primary text-on-primary font-title-md text-title-md '
              'hover:bg-primary-container transition-all '
              'shadow-[0_6px_24px_-4px_rgba(0,104,95,0.4)]',
          [
            icon('outgoing_mail', classes: 'text-[20px]'),
            span([.text('Say Hello via Email')]),
          ],
        ),
        // Progressively enhanced by the script in app.dart; without JS it still
        // reads as a plain label next to the mailto button.
        button(
          id: 'copy-email',
          classes: 'w-full sm:w-auto inline-flex items-center justify-center gap-2 px-6 py-3.5 '
              'rounded-full bg-surface-container text-on-surface font-label-md text-label-md '
              'hover:bg-surface-container-high transition-all cursor-pointer',
          attributes: {'data-email': Profile.email},
          [
            icon('content_copy', classes: 'text-[18px]'),
            span(id: 'copy-email-label', [.text('Copy Email')]),
          ],
        ),
      ],
    );
  }

  /// The two addresses worth reading off the page.
  Component _directLines() {
    return div(
      classes: 'flex flex-col sm:flex-row items-center gap-space-sm font-body-sm text-body-sm '
          'text-on-surface-variant',
      [
        a(
          href: Profile.mailto,
          classes: 'flex items-center gap-2 hover:text-primary transition-colors',
          [
            icon('mail', classes: 'text-[16px] text-primary'),
            span([.text(Profile.email)]),
          ],
        ),
        span(classes: 'hidden sm:inline text-outline', [.text('•')]),
        a(
          href: Profile.whatsapp,
          target: Target.blank,
          classes: 'flex items-center gap-2 hover:text-primary transition-colors',
          [
            icon('call', classes: 'text-[16px] text-primary'),
            span([.text(Profile.phone)]),
          ],
        ),
      ],
    );
  }

  Component _socials() {
    const links = [
      ('WhatsApp', 'chat', Profile.whatsapp),
      ('LinkedIn', 'badge', Profile.linkedin),
      ('GitHub', 'terminal', Profile.github),
    ];

    return div(classes: 'flex flex-wrap justify-center items-center gap-space-sm pt-space-md', [
      for (final (label, iconName, href) in links)
        a(
          href: href,
          target: href.startsWith('mailto:') ? null : Target.blank,
          classes: 'flex items-center gap-2 px-4 py-2 rounded-full bg-surface-container-low '
              'text-on-surface hover:text-primary transition-colors font-label-md text-label-md',
          [
            icon(iconName, classes: 'text-[18px] text-primary'),
            span([.text(label)]),
          ],
        ),
    ]);
  }
}
