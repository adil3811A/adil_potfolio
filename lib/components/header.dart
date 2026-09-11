import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/profile.dart';
import 'ui.dart';

/// Fixed top bar. The link row collapses on small screens — phones get the
/// bottom bar in [MobileNav] instead.
class SiteHeader extends StatelessComponent {
  const SiteHeader({super.key});

  @override
  Component build(BuildContext context) {
    return header(
      classes: 'fixed top-0 left-0 right-0 w-full z-50 pt-safe bg-surface/85 '
          'backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)]',
      [
        div(
          classes: 'h-16 lg:h-20 max-w-[1200px] mx-auto px-margin-mobile lg:px-margin '
              'flex items-center justify-between gap-space-md',
          [
            _brand(),
            _links(),
            _actions(),
          ],
        ),
      ],
    );
  }

  Component _brand() {
    return div(classes: 'flex items-center gap-space-md min-w-0', [
      a(href: '#top', classes: 'flex items-center gap-space-sm min-w-0', [
        div(
          classes: 'w-9 h-9 shrink-0 rounded-2xl bg-primary text-on-primary '
              'flex items-center justify-center font-title-md text-title-md font-extrabold '
              'shadow-[0_4px_12px_-2px_rgba(0,104,95,0.35)]',
          [.text('AA')],
        ),
        span(
          classes: 'font-title-md text-title-md text-on-surface tracking-tight truncate',
          [.text(Profile.name)],
        ),
      ]),
      div(
        classes: 'hidden xl:flex items-center gap-1.5 px-3 py-1 rounded-full '
            'bg-secondary-fixed/40 text-on-secondary-fixed-variant font-label-sm text-label-sm',
        [
          span(classes: 'w-2 h-2 rounded-full bg-primary animate-pulse', []),
          span([.text('Available for Work')]),
        ],
      ),
    ]);
  }

  Component _links() {
    return nav(
      classes: 'hidden lg:flex items-center gap-space-xs p-1 rounded-full bg-surface-container-low',
      [
        for (final item in navItems)
          a(
            href: item.href,
            classes: 'nav-link px-4 py-2 rounded-full font-label-md text-label-md '
                'text-on-surface-variant hover:text-on-surface hover:bg-surface-container '
                'transition-colors',
            attributes: {'data-nav': item.href},
            [.text(item.label)],
          ),
      ],
    );
  }

  Component _actions() {
    return div(classes: 'flex items-center gap-space-sm shrink-0', [
      a(
        href: '#contact',
        classes: 'inline-flex items-center justify-center px-5 lg:px-6 py-2.5 rounded-full '
            'bg-primary text-on-primary font-label-md text-label-md '
            'hover:bg-primary-container transition-all active:scale-95 '
            'shadow-[0_4px_16px_-4px_rgba(0,104,95,0.3)]',
        [
          span(classes: 'hidden sm:inline', [.text("Let's Talk")]),
          span(classes: 'sm:hidden', [.text('Hire')]),
        ],
      ),
      img(
        src: Profile.portrait,
        alt: Profile.name,
        classes: 'w-9 h-9 rounded-full object-cover ring-2 ring-primary/20',
      ),
    ]);
  }
}

/// Bottom tab bar for phones, mirroring the mobile design.
class MobileNav extends StatelessComponent {
  const MobileNav({super.key});

  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'lg:hidden fixed bottom-0 left-0 right-0 w-full z-50 pb-safe bg-surface/90 '
          'backdrop-blur-xl shadow-[0_-2px_12px_rgba(0,0,0,0.05)]',
      [
        div(classes: 'flex justify-around items-center h-16 px-gutter-mobile', [
          for (final item in mobileNavItems)
            a(
              href: item.href,
              classes: 'mobile-nav-link flex flex-col items-center justify-center '
                  'min-w-[44px] min-h-[44px] gap-1 text-on-surface-variant transition-colors',
              attributes: {'data-nav': item.href},
              [
                icon(item.icon, classes: 'text-[22px]'),
                span(classes: 'font-label-sm text-label-sm', [.text(item.label)]),
              ],
            ),
        ]),
      ],
    );
  }
}
