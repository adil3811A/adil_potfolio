import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'top',
      classes: 'w-full max-w-[1200px] mx-auto px-margin-mobile lg:px-margin '
          'pt-space-lg lg:pt-space-xl pb-space-xl relative',
      [
        // Ambient backdrop gradients.
        div(
          classes: 'absolute -top-16 -left-20 w-96 h-96 rounded-full bg-primary-fixed/20 '
              'blur-3xl pointer-events-none -z-10',
          [],
        ),
        div(
          classes: 'absolute top-1/2 right-0 w-80 h-80 rounded-full bg-secondary-fixed/25 '
              'blur-3xl pointer-events-none -z-10',
          [],
        ),
        div(
          classes: 'grid grid-cols-1 lg:grid-cols-12 gap-space-lg lg:gap-gutter items-center',
          [
            _pitch(),
            _showcase(),
          ],
        ),
      ],
    );
  }

  Component _pitch() {
    return div(classes: 'lg:col-span-7 flex flex-col items-start gap-space-md', [
      div(
        classes: 'inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-surface-container '
            'text-on-surface-variant font-label-md text-label-md shadow-sm',
        [
          span(classes: 'inline-block w-2.5 h-2.5 rounded-full bg-primary animate-pulse', []),
          span([.text('Available for projects & full-time roles')]),
        ],
      ),
      h1(
        classes: 'font-display-hero text-display-hero-mobile md:text-display-hero '
            'text-on-surface tracking-tight leading-[1.08] text-balance',
        [
          .text('Hi, I’m Adil — I build mobile apps that people '),
          span(
            classes: 'text-primary underline decoration-primary-fixed decoration-wavy '
                'decoration-2 underline-offset-8',
            [.text('actually enjoy')],
          ),
          .text(' using.'),
        ],
      ),
      p(
        classes: 'font-body-lg text-body-lg text-on-surface-variant max-w-xl leading-relaxed',
        [
          .text('Application Development Engineer at Codes ’n’ Coffee Tech. I build and ship '
              'production Flutter apps for Android and iOS — five live client apps, plus one I '
              'architected, published and maintain entirely on my own.'),
        ],
      ),
      div(classes: 'flex flex-wrap items-center gap-space-md pt-space-xs', [
        primaryButton('See My Work', '#projects', 'arrow_downward'),
        a(
          href: '#contact',
          classes: 'inline-flex items-center gap-2 px-7 py-3 rounded-full '
              'bg-surface-container-lowest text-on-surface font-label-md text-label-md '
              'hover:bg-surface-container hover:text-primary transition-all shadow-sm',
          [
            span([.text('Contact Me')]),
            icon('chat', classes: 'text-[18px]'),
          ],
        ),
      ]),
      div(
        classes: 'flex items-center gap-2 text-on-surface-variant font-body-sm text-body-sm pt-space-xs',
        [
          icon('location_on', classes: 'text-primary text-[18px]'),
          span([.text('Based in Thane, Mumbai • Open to Remote & Relocation')]),
        ],
      ),
      // Proof metrics.
      div(classes: 'grid grid-cols-3 gap-space-sm md:gap-space-md w-full pt-space-md', [
        for (final stat in heroStats)
          div(
            classes: 'p-space-sm md:p-space-md rounded-2xl bg-surface-container-lowest '
                'shadow-sm flex flex-col gap-1',
            [
              div(
                classes: 'font-headline-md text-headline-sm md:text-headline-md '
                    '${toneText(stat.tone)} font-extrabold tracking-tight',
                [.text(stat.value)],
              ),
              div(
                classes: 'font-label-sm text-label-sm text-on-surface-variant uppercase tracking-wider',
                [.text(stat.label)],
              ),
            ],
          ),
      ]),
    ]);
  }

  Component _showcase() {
    return div(classes: 'lg:col-span-5 relative flex justify-center items-center py-space-md', [
      div(
        classes: 'absolute inset-0 bg-linear-to-tr from-primary/10 via-secondary/5 '
            'to-surface-container-high rounded-3xl -rotate-2 scale-95',
        [],
      ),
      div(
        classes: 'relative w-full max-w-sm rounded-3xl bg-surface-container-lowest p-5 '
            'shadow-xl flex flex-col gap-4',
        [
          // Portrait with a name plate.
          div(
            classes: 'relative w-full aspect-square rounded-2xl overflow-hidden '
                'bg-surface-container-high',
            [
              img(
                src: Profile.portrait,
                alt: '${Profile.name} portrait',
                classes: 'w-full h-full object-cover object-center hover:scale-105 '
                    'transition-transform duration-500',
              ),
              div(
                classes: 'absolute bottom-3 left-3 right-3 bg-surface/90 backdrop-blur-md '
                    'px-3.5 py-2 rounded-xl flex items-center justify-between shadow-sm',
                [
                  div(classes: 'flex items-center gap-2', [
                    span(classes: 'w-2.5 h-2.5 rounded-full bg-primary animate-pulse', []),
                    span(
                      classes: 'font-label-md text-label-md text-on-surface font-semibold',
                      [.text(Profile.name)],
                    ),
                  ]),
                  span(classes: 'font-label-sm text-label-sm text-outline', [.text('Flutter Dev')]),
                ],
              ),
            ],
          ),
          // Floating specialist badge.
          div(
            classes: 'absolute -top-4 -right-4 px-4 py-2 rounded-full bg-primary text-on-primary '
                'font-label-md text-label-md shadow-lg flex items-center gap-1.5 '
                'hover:rotate-2 transition-transform',
            [
              icon('bolt', classes: 'text-[18px]'),
              span([.text('Flutter Specialist')]),
            ],
          ),
          // Mini app card.
          div(
            classes: 'w-full bg-surface-container-low rounded-2xl p-4 flex items-center '
                'justify-between gap-3 shadow-sm',
            [
              div(classes: 'flex items-center gap-3', [
                div(
                  classes: 'w-10 h-10 rounded-xl bg-primary-fixed text-on-primary-fixed '
                      'flex items-center justify-center',
                  [icon('phone_iphone', classes: 'text-[22px]')],
                ),
                div(classes: 'flex flex-col', [
                  span(
                    classes: 'font-title-md text-label-md text-on-surface font-bold',
                    [.text('PannaseCHE')],
                  ),
                  span(
                    classes: 'font-body-sm text-body-sm text-on-surface-variant',
                    [.text('Live on Play Store & App Store')],
                  ),
                ]),
              ]),
              div(
                classes: 'flex items-center gap-1 px-2.5 py-1 rounded-full '
                    'bg-surface-container-lowest text-primary font-label-sm text-label-sm shadow-xs',
                [
                  icon('download', classes: 'text-[14px]'),
                  span([.text('500+')]),
                ],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
