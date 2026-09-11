import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/footer.dart';
import 'components/header.dart';
import 'pages/home.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen bg-background text-on-surface', [
      const SiteHeader(),
      // Top padding clears the fixed header, bottom padding the mobile tab bar.
      main_(classes: 'w-full pt-16 lg:pt-20 pb-16 lg:pb-0', [
        const Home(),
        const SiteFooter(),
      ]),
      const MobileNav(),
      script(content: _enhancements),
    ]);
  }
}

/// Two small progressive enhancements: copy-to-clipboard on the contact button
/// and highlighting whichever nav entry matches the section in view.
const _enhancements = r'''
(() => {
  const button = document.getElementById('copy-email');
  const label = document.getElementById('copy-email-label');
  if (button && label) {
    button.addEventListener('click', () => {
      const email = button.dataset.email;
      navigator.clipboard.writeText(email).then(() => {
        label.textContent = 'Copied!';
        setTimeout(() => { label.textContent = 'Copy Email'; }, 2000);
      }).catch(() => { window.location.href = 'mailto:' + email; });
    });
  }

  const links = Array.from(document.querySelectorAll('[data-nav]'));
  const sections = Array.from(document.querySelectorAll('section[id]'));
  if (!links.length || !sections.length) return;

  const sync = () => {
    const line = window.scrollY + window.innerHeight * 0.3;
    let current = sections[0].id;
    for (const section of sections) {
      if (section.offsetTop <= line) current = section.id;
    }
    for (const link of links) {
      link.classList.toggle('is-active', link.dataset.nav === '#' + current);
    }
  };

  sync();
  window.addEventListener('scroll', sync, { passive: true });
  window.addEventListener('resize', sync);
})();
''';
