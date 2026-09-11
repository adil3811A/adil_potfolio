import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

class Skills extends StatelessComponent {
  const Skills({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'w-full bg-surface-container-low py-space-xl', [
      div(
        classes: 'max-w-[1200px] mx-auto px-margin-mobile lg:px-margin flex flex-col gap-space-lg',
        [
          sectionHeading(
            badge: 'Technical Fluency',
            badgeIcon: 'psychology',
            title: 'Skills & Superpowers',
            lead: 'Not just raw syntax — practical tools engineered to turn client roadmaps '
                'into high-performing mobile applications.',
          ),
          div(classes: 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-space-md', [
            for (final skill in skills) _card(skill),
          ]),
        ],
      ),
    ]);
  }

  Component _card(Capability skill) {
    return div(
      classes: 'p-6 rounded-3xl bg-surface-container-lowest shadow-sm '
          'flex flex-col justify-between',
      [
        div([
          div(classes: 'mb-4 w-max', [
            iconTile(skill.icon, skill.tone, size: 'w-12 h-12 rounded-xl', glyph: 'text-[24px]'),
          ]),
          h3(
            classes: 'font-title-md text-title-md text-on-surface font-bold mb-2',
            [.text(skill.title)],
          ),
          p(
            classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed mb-4',
            [.text(skill.body)],
          ),
        ]),
        div(classes: 'flex flex-wrap gap-1.5', [
          for (final tag in skill.tags)
            chip(tag, size: 'px-2.5 py-1'),
        ]),
      ],
    );
  }
}
