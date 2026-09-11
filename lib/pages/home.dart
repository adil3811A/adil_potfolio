import 'package:jaspr/jaspr.dart';

import '../sections/about.dart';
import '../sections/contact.dart';
import '../sections/experience.dart';
import '../sections/hero.dart';
import '../sections/projects.dart';
import '../sections/skills.dart';
import '../sections/what_i_do.dart';

/// The whole portfolio is one scrolling page; the nav links jump between
/// these sections.
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment(const [
      Hero(),
      WhatIDo(),
      Projects(),
      Experience(),
      Skills(),
      About(),
      Contact(),
    ]);
  }
}
