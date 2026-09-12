import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/footer.dart';
import 'components/chat_widget.dart';
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
      const ChatWidget(),
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

  // --- Portfolio assistant ------------------------------------------------
  // Interface only for now: the opening exchange is scripted and anything the
  // visitor sends gets a reply pointing at Adil's real inbox.
  const widget = document.getElementById('chat-widget');
  const panel = document.getElementById('chat-panel');
  const chatLog = document.getElementById('chat-log');
  const chatForm = document.getElementById('chat-form');
  const chatInput = document.getElementById('chat-input');
  const launcher = document.getElementById('chat-launcher');
  if (!widget || !panel || !chatLog || !chatForm || !chatInput) return;

  const email = widget.dataset.email;
  const whatsapp = widget.dataset.whatsapp;

  const node = (tag, className, text) => {
    const element = document.createElement(tag);
    if (className) element.className = className;
    if (text) element.textContent = text;
    return element;
  };

  const scrollToEnd = () => { chatLog.scrollTop = chatLog.scrollHeight; };

  const setOpen = (open) => {
    panel.classList.toggle('hidden', !open);
    if (launcher) launcher.setAttribute('aria-expanded', String(open));
    if (open) { scrollToEnd(); chatInput.focus(); }
  };

  document.querySelectorAll('[data-chat-toggle]').forEach((element) => {
    element.addEventListener('click', () => setOpen(panel.classList.contains('hidden')));
  });

  document.querySelectorAll('[data-chat-suggest]').forEach((element) => {
    element.addEventListener('click', () => {
      chatInput.value = element.dataset.chatSuggest;
      chatInput.focus();
    });
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && !panel.classList.contains('hidden')) setOpen(false);
  });

  const addVisitorMessage = (text) => {
    const row = node('div', 'flex items-start justify-end gap-2.5');
    row.appendChild(node('div', 'p-3.5 rounded-2xl rounded-tr-none bg-primary text-on-primary text-body-sm leading-relaxed max-w-[85%] shadow-sm', text));
    row.appendChild(node('div', 'w-7 h-7 rounded-xl bg-surface-container-high shrink-0 flex items-center justify-center text-on-surface text-[11px] font-bold', 'HR'));
    chatLog.appendChild(row);
    scrollToEnd();
  };

  const addReply = (question) => {
    const row = node('div', 'flex items-start gap-2.5');
    const avatar = node('div', 'w-7 h-7 rounded-xl bg-primary-fixed shrink-0 flex items-center justify-center text-primary');
    avatar.appendChild(node('span', 'material-symbols-outlined text-[16px]', 'smart_toy'));
    const bubble = node('div', 'p-3.5 rounded-2xl rounded-tl-none bg-surface-container-lowest shadow-xs text-on-surface text-body-sm leading-relaxed max-w-[85%] flex flex-col gap-2');
    bubble.appendChild(node('span', '', 'The live assistant is not wired up yet, so I cannot answer that one automatically — but Adil reads everything himself. Send it straight to him:'));

    const links = node('div', 'flex flex-wrap gap-1.5 pt-1');
    const pill = 'inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-surface-container text-on-surface-variant hover:text-primary font-label-sm text-label-sm transition-colors';

    const mail = node('a', pill, 'Email this question');
    mail.href = 'mailto:' + email + '?subject=' + encodeURIComponent('Question from your portfolio') + '&body=' + encodeURIComponent(question);
    links.appendChild(mail);

    const chat = node('a', pill, 'WhatsApp');
    chat.href = whatsapp;
    chat.target = '_blank';
    chat.rel = 'noopener noreferrer';
    links.appendChild(chat);

    bubble.appendChild(links);
    row.appendChild(avatar);
    row.appendChild(bubble);
    chatLog.appendChild(row);
    scrollToEnd();
  };

  chatForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const question = chatInput.value.trim();
    if (!question) return;
    addVisitorMessage(question);
    chatInput.value = '';
    setTimeout(() => addReply(question), 450);
  });
})();
''';
