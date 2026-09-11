import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/ui.dart';
import '../constants/profile.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'about',
      classes: 'w-full py-space-xl max-w-[1200px] mx-auto px-margin-mobile lg:px-margin',
      [
        div(classes: 'grid grid-cols-1 lg:grid-cols-12 gap-space-lg items-stretch', [
          _bio(),
          _personal(),
        ]),
      ],
    );
  }

  Component _bio() {
    return div(
      classes: 'lg:col-span-7 p-space-lg rounded-3xl bg-surface-container-lowest shadow-sm '
          'flex flex-col justify-between gap-space-md',
      [
        div(classes: 'flex flex-col gap-space-sm', [
          div(classes: 'flex items-center gap-3', [
            img(
              src: Profile.portrait,
              alt: Profile.name,
              classes: 'w-16 h-16 rounded-full object-cover shadow-sm',
            ),
            div([
              h3(
                classes: 'font-headline-sm text-headline-sm text-on-surface font-bold',
                [.text(Profile.name)],
              ),
              p(classes: 'font-label-md text-label-md text-primary', [.text(Profile.title)]),
            ]),
          ]),
          p(
            classes: 'font-body-lg text-body-lg text-on-surface-variant leading-relaxed pt-2',
            [
              .text('I build mobile apps for a living. Right now that means Codes ’n’ Coffee Tech '
                  'in Thane, where I keep five production Flutter apps healthy for a client and '
                  'ship features to real users every week.'),
            ],
          ),
          p(
            classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed',
            [
              .text('I started in native Android with Kotlin and Jetpack Compose, which still '
                  'shapes how I think about the platform underneath Flutter. I care about clean '
                  'architecture, readable code, and getting releases through app review without '
                  'drama.'),
            ],
          ),
        ]),
        div(
          classes: 'inline-flex items-center gap-2 px-4 py-2 rounded-full bg-surface-container '
              'text-on-surface font-label-md text-label-md w-max',
          [
            icon('explore', classes: 'text-primary text-[20px]'),
            span([.text('${Profile.location} • Open to remote roles & relocation')]),
          ],
        ),
      ],
    );
  }

  Component _personal() {
    return div(
      classes: 'lg:col-span-5 p-space-lg rounded-3xl bg-surface-container-high shadow-sm '
          'flex flex-col justify-between gap-space-md relative overflow-hidden',
      [
        div(
          classes: 'absolute -bottom-10 -right-10 w-44 h-44 rounded-full bg-primary-fixed/30 '
              'blur-2xl pointer-events-none',
          [],
        ),
        div(classes: 'flex flex-col gap-space-sm', [
          div(
            classes: 'w-12 h-12 rounded-2xl bg-surface-container-lowest text-primary '
                'flex items-center justify-center shadow-xs text-[24px]',
            [.text('🛠️')],
          ),
          h4(
            classes: 'font-title-md text-headline-sm text-on-surface font-bold',
            [.text('Away from client work')],
          ),
          p(
            classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed',
            [
              .text('Side projects are where I try things the day job hasn’t asked for yet — a '
                  'recipe discovery app on the Spoonacular API with Firebase auth, and a real-time '
                  'chat on the Firebase Realtime Database, both native Kotlin and Jetpack Compose.'),
            ],
          ),
        ]),
        div(
          classes: 'relative p-4 rounded-2xl bg-surface-container-lowest/80 backdrop-blur-sm '
              'flex items-center gap-3',
          [
            icon('lightbulb', classes: 'text-primary text-[24px]'),
            span(
              classes: 'font-body-sm text-body-sm text-on-surface',
              [.text('Currently: taking a legacy native Android app to React Native, end to end.')],
            ),
          ],
        ),
      ],
    );
  }
}
