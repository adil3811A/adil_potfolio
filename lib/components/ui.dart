import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/profile.dart';

/// A Material Symbols glyph.
///
/// Sizing/colour classes are passed in literally (e.g. `'text-[18px] text-primary'`)
/// so Tailwind can still find them when it scans these Dart files.
Component icon(String name, {String classes = 'text-[20px]'}) {
  return span(classes: 'material-symbols-outlined $classes', [.text(name)]);
}

/// Small rounded tag — used for tech stacks and project attributes.
Component chip(String label, {Tone tone = Tone.neutral, String size = 'px-3 py-1'}) {
  return span(
    classes: '$size rounded-full font-label-sm text-label-sm ${_chipTone(tone)}',
    [.text(label)],
  );
}

String _chipTone(Tone tone) => switch (tone) {
      Tone.primary => 'bg-primary-fixed/40 text-on-primary-fixed-variant',
      Tone.secondary => 'bg-secondary-fixed/40 text-on-secondary-fixed-variant',
      Tone.tertiary => 'bg-tertiary-fixed/40 text-on-tertiary-fixed-variant',
      Tone.neutral => 'bg-surface-container text-on-surface-variant',
    };

/// The little labelled badge that sits above every section heading.
Component eyebrow(String label, String iconName, {Tone tone = Tone.primary}) {
  return div(
    classes: 'inline-flex items-center gap-1.5 px-3 py-1 rounded-full w-max '
        'font-label-sm text-label-sm ${_chipTone(tone)}',
    [
      icon(iconName, classes: 'text-[14px]'),
      span([.text(label)]),
    ],
  );
}

/// Rounded square that holds a feature icon.
Component iconTile(String name, Tone tone, {String size = 'w-14 h-14 rounded-2xl', String glyph = 'text-[28px]'}) {
  return div(
    classes: '$size flex items-center justify-center ${_tileTone(tone)}',
    [icon(name, classes: glyph)],
  );
}

String _tileTone(Tone tone) => switch (tone) {
      Tone.primary => 'bg-primary-fixed/50 text-primary',
      Tone.secondary => 'bg-secondary-fixed/50 text-secondary',
      Tone.tertiary => 'bg-tertiary-fixed/50 text-tertiary',
      Tone.neutral => 'bg-surface-container text-on-surface',
    };

/// Colour for a headline number (hero stats, project metrics).
String toneText(Tone tone) => switch (tone) {
      Tone.primary => 'text-primary',
      Tone.secondary => 'text-secondary',
      Tone.tertiary => 'text-tertiary',
      Tone.neutral => 'text-on-surface',
    };

/// Pill-shaped primary action.
Component primaryButton(String label, String href, String iconName, {String extra = ''}) {
  return a(
    href: href,
    classes: 'inline-flex items-center gap-2 px-7 py-3 rounded-full bg-primary text-on-primary '
        'font-label-md text-label-md hover:bg-primary-container transition-all '
        'shadow-[0_4px_20px_-4px_rgba(0,104,95,0.35)] hover:-translate-y-0.5 $extra',
    [
      span([.text(label)]),
      icon(iconName, classes: 'text-[18px]'),
    ],
  );
}

/// Pill-shaped secondary action.
Component quietButton(String label, String href, String iconName, {String extra = ''}) {
  return a(
    href: href,
    classes: 'inline-flex items-center gap-2 px-6 py-2.5 rounded-full bg-surface-container-high '
        'text-on-surface font-label-md text-label-md hover:bg-surface-container '
        'hover:text-primary transition-all $extra',
    [
      span([.text(label)]),
      icon(iconName, classes: 'text-[16px]'),
    ],
  );
}

/// Section heading block: eyebrow + title + optional lead paragraph.
Component sectionHeading({
  required String badge,
  required String badgeIcon,
  required String title,
  String? lead,
  Tone tone = Tone.primary,
}) {
  return div(classes: 'flex flex-col gap-2', [
    eyebrow(badge, badgeIcon, tone: tone),
    h2(
      classes: 'font-headline-lg text-headline-lg-mobile md:text-headline-lg '
          'text-on-surface tracking-tight',
      [.text(title)],
    ),
    if (lead != null)
      p(classes: 'font-body-md text-body-md text-on-surface-variant max-w-xl', [.text(lead)]),
  ]);
}
