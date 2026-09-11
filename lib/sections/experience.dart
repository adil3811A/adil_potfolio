import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

/// Career timeline, degree, and the things built outside work hours.
class Experience extends StatelessComponent {
  const Experience({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'experience',
      classes: 'w-full py-space-xl max-w-[1200px] mx-auto px-margin-mobile lg:px-margin '
          'flex flex-col gap-space-lg',
      [
        sectionHeading(
          badge: 'Track Record',
          badgeIcon: 'work_history',
          title: 'Experience & Education',
          lead: 'Where the production apps, the store releases and the CI pipelines actually '
              'came from.',
        ),
        div(classes: 'grid grid-cols-1 lg:grid-cols-12 gap-space-lg items-start', [
          div(classes: 'lg:col-span-8 flex flex-col gap-space-md', [
            for (final role in roles) _role(role),
          ]),
          div(classes: 'lg:col-span-4 flex flex-col gap-space-md', [
            _education(),
            _sideProjects(),
          ]),
        ]),
      ],
    );
  }

  Component _role(Role role) {
    return div(
      classes: 'relative p-space-lg rounded-3xl bg-surface-container-lowest shadow-sm '
          'flex flex-col gap-space-sm',
      [
        div(classes: 'flex flex-wrap items-start justify-between gap-space-sm', [
          div(classes: 'flex flex-col gap-1', [
            h3(
              classes: 'font-headline-sm text-headline-sm text-on-surface font-bold',
              [.text(role.title)],
            ),
            div(
              classes: 'flex flex-wrap items-center gap-2 font-label-md text-label-md text-primary',
              [
                span([.text(role.org)]),
                span(classes: 'text-outline', [.text('•')]),
                span(classes: 'text-on-surface-variant', [.text(role.place)]),
              ],
            ),
          ]),
          div(
            classes: 'flex items-center gap-1.5 px-3 py-1 rounded-full font-label-sm text-label-sm '
                '${role.current ? 'bg-primary-fixed/40 text-on-primary-fixed-variant' : 'bg-surface-container text-on-surface-variant'}',
            [
              if (role.current)
                span(classes: 'w-2 h-2 rounded-full bg-primary animate-pulse', []),
              span([.text(role.period)]),
            ],
          ),
        ]),
        div(classes: 'flex flex-col gap-2 pt-1', [
          for (final point in role.points)
            div(classes: 'flex items-start gap-2.5', [
              icon('check_circle', classes: 'text-[18px] text-primary shrink-0 mt-0.5'),
              span(
                classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed',
                [.text(point)],
              ),
            ]),
        ]),
      ],
    );
  }

  Component _education() {
    return div(
      classes: 'p-space-lg rounded-3xl bg-surface-container-high shadow-sm flex flex-col '
          'gap-space-sm relative overflow-hidden',
      [
        div(
          classes: 'absolute -top-8 -right-8 w-32 h-32 rounded-full bg-primary-fixed/30 '
              'blur-2xl pointer-events-none',
          [],
        ),
        div(classes: 'relative flex items-center gap-3', [
          iconTile('school', Tone.neutral, size: 'w-12 h-12 rounded-2xl', glyph: 'text-[24px]'),
          h3(
            classes: 'font-title-md text-title-md text-on-surface font-bold',
            [.text('Education')],
          ),
        ]),
        div(classes: 'relative flex flex-col gap-1', [
          span(
            classes: 'font-headline-sm text-headline-sm text-on-surface font-bold',
            [.text(education.degree)],
          ),
          span(
            classes: 'font-body-md text-body-md text-on-surface-variant',
            [.text(education.school)],
          ),
          span(classes: 'font-label-md text-label-md text-primary', [.text(education.period)]),
        ]),
      ],
    );
  }

  Component _sideProjects() {
    return div(
      classes: 'p-space-lg rounded-3xl bg-surface-container-lowest shadow-sm flex flex-col '
          'gap-space-md',
      [
        div(classes: 'flex items-center gap-2', [
          icon('rocket_launch', classes: 'text-[20px] text-primary'),
          h3(
            classes: 'font-title-md text-title-md text-on-surface font-bold',
            [.text('Built after hours')],
          ),
        ]),
        for (final project in sideProjects)
          div(classes: 'flex flex-col gap-2 pb-space-sm last:pb-0', [
            span(
              classes: 'font-label-md text-label-md text-on-surface font-bold',
              [.text(project.title)],
            ),
            p(
              classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed',
              [.text(project.body)],
            ),
            div(classes: 'flex flex-wrap gap-1.5', [
              for (final tag in project.tags) chip(tag, size: 'px-2.5 py-1'),
            ]),
          ]),
      ],
    );
  }
}
