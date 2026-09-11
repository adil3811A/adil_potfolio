import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/profile.dart';
import 'ui.dart';

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    const links = [
      ('GitHub', 'terminal', Profile.github),
      ('LinkedIn', 'badge', Profile.linkedin),
      ('WhatsApp', 'chat', Profile.whatsapp),
      ('Email', 'mail', Profile.mailto),
    ];

    return footer(classes: 'w-full bg-surface-container-low py-space-xl', [
      div(classes: 'max-w-[1200px] mx-auto px-margin-mobile lg:px-margin', [
        div(
          classes: 'flex flex-col md:flex-row items-center justify-between gap-space-lg pb-space-lg',
          [
            div(classes: 'flex items-center gap-space-sm', [
              div(
                classes: 'w-7 h-7 rounded-xl bg-primary text-on-primary flex items-center '
                    'justify-center font-label-sm text-label-sm font-extrabold',
                [.text('AA')],
              ),
              span(classes: 'font-title-md text-title-md text-on-surface', [.text(Profile.name)]),
              span(
                classes: 'hidden sm:inline font-body-sm text-body-sm text-outline',
                [.text('• ${Profile.title}')],
              ),
            ]),
            div(classes: 'flex flex-wrap justify-center items-center gap-space-sm', [
              for (final (label, iconName, href) in links)
                a(
                  href: href,
                  target: href.startsWith('mailto:') ? null : Target.blank,
                  classes: 'px-3 py-1.5 rounded-full bg-surface-container-lowest font-label-sm '
                      'text-label-sm text-on-surface-variant hover:text-primary transition-colors '
                      'flex items-center gap-1.5',
                  [
                    icon(iconName, classes: 'text-[16px]'),
                    span([.text(label)]),
                  ],
                ),
            ]),
          ],
        ),
        div(
          classes: 'flex flex-col sm:flex-row items-center justify-between gap-space-sm pt-space-md',
          [
            p(
              classes: 'font-body-sm text-body-sm text-on-surface-variant',
              [.text('© ${DateTime.now().year} ${Profile.name}. All rights reserved.')],
            ),
            p(
              classes: 'font-body-sm text-body-sm text-outline flex items-center gap-1',
              [.text('Built with Dart & Jaspr')],
            ),
          ],
        ),
      ]),
    ]);
  }
}
