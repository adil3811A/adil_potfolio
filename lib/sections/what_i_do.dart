import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

class WhatIDo extends StatelessComponent {
  const WhatIDo({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'what-i-do', classes: 'w-full bg-surface-container-low py-space-xl', [
      div(classes: 'max-w-[1200px] mx-auto px-margin-mobile lg:px-margin', [
        div(
          classes: 'flex flex-col md:flex-row md:items-end justify-between mb-space-lg gap-space-sm',
          [
            div(classes: 'flex flex-col gap-2', [
              eyebrow('Core Competence', 'layers'),
              h2(
                classes: 'font-headline-lg text-headline-lg-mobile md:text-headline-lg '
                    'text-on-surface tracking-tight',
                [.text('Zero Tech Headaches. Just Pure Delivery.')],
              ),
            ]),
            p(
              classes: 'font-body-md text-body-md text-on-surface-variant max-w-md',
              [
                .text('I bridge design, code, and deployment so you can launch stable '
                    'mobile apps without friction.'),
              ],
            ),
          ],
        ),
        div(classes: 'grid grid-cols-1 md:grid-cols-3 gap-space-lg', [
          for (final service in services) _card(service),
        ]),
      ]),
    ]);
  }

  Component _card(Capability service) {
    return div(
      classes: 'group p-space-lg rounded-3xl bg-surface-container-lowest shadow-sm '
          'hover:shadow-md transition-all duration-300 flex flex-col justify-between '
          'hover:-translate-y-1',
      [
        div([
          div(classes: 'mb-space-md group-hover:scale-110 transition-transform w-max', [
            iconTile(service.icon, service.tone),
          ]),
          h3(
            classes: 'font-headline-sm text-headline-sm text-on-surface mb-2 font-bold',
            [.text(service.title)],
          ),
          p(
            classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed mb-space-md',
            [.text(service.body)],
          ),
        ]),
        div(classes: 'flex flex-wrap gap-2 pt-space-sm', [
          for (final tag in service.tags) chip(tag),
        ]),
      ],
    );
  }
}
