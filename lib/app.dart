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
  // The opening exchange is scripted; anything the visitor sends is streamed
  // back from the chat API. If that fails, the reply points at Adil's inbox.
  const widget = document.getElementById('chat-widget');
  const panel = document.getElementById('chat-panel');
  const chatLog = document.getElementById('chat-log');
  const chatForm = document.getElementById('chat-form');
  const chatInput = document.getElementById('chat-input');
  const launcher = document.getElementById('chat-launcher');
  if (!widget || !panel || !chatLog || !chatForm || !chatInput) return;

  const api = widget.dataset.api;
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

  // Typing indicator while the model thinks.
  const addTyping = () => {
    const row = node('div', 'flex items-start gap-2.5');
    const avatar = node('div', 'w-7 h-7 rounded-xl bg-primary-fixed shrink-0 flex items-center justify-center text-primary');
    avatar.appendChild(node('span', 'material-symbols-outlined text-[16px]', 'smart_toy'));
    const bubble = node('div', 'p-3.5 rounded-2xl rounded-tl-none bg-surface-container-lowest shadow-xs flex items-center gap-1');
    ['animate-bounce', 'animate-bounce [animation-delay:-0.15s]', 'animate-bounce [animation-delay:-0.3s]'].forEach((motion) => {
      bubble.appendChild(node('span', 'w-1.5 h-1.5 rounded-full bg-outline ' + motion));
    });
    row.appendChild(avatar);
    row.appendChild(bubble);
    chatLog.appendChild(row);
    scrollToEnd();
    return row;
  };

  const botBubble = () => {
    const row = node('div', 'flex items-start gap-2.5');
    const avatar = node('div', 'w-7 h-7 rounded-xl bg-primary-fixed shrink-0 flex items-center justify-center text-primary');
    avatar.appendChild(node('span', 'material-symbols-outlined text-[16px]', 'smart_toy'));
    const bubble = node('div', 'p-3.5 rounded-2xl rounded-tl-none bg-surface-container-lowest shadow-xs text-on-surface text-body-sm leading-relaxed max-w-[85%] flex flex-col gap-2');
    row.appendChild(avatar);
    row.appendChild(bubble);
    chatLog.appendChild(row);
    return bubble;
  };

  // Used whenever the answer does not arrive — the question still gets to Adil.
  const addFallback = (question, reason) => {
    const bubble = botBubble();
    bubble.appendChild(node('span', '', reason || 'I could not reach the assistant just now. Adil reads everything himself, so send it straight to him:'));

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
    scrollToEnd();
  };

  const sendButton = chatForm.querySelector('button[type="submit"]');
  let pending = false;

  chatForm.addEventListener('submit', async (event) => {
    event.preventDefault();
    const question = chatInput.value.trim();
    if (!question || pending) return;

    pending = true;
    if (sendButton) sendButton.disabled = true;
    chatInput.value = '';
    addVisitorMessage(question);
    const typing = addTyping();

    // Idle timeout: restarted on every chunk, so a long answer that keeps
    // streaming is never cut off — only a stalled connection is.
    const controller = new AbortController();
    let timeout;
    const armTimeout = () => {
      clearTimeout(timeout);
      timeout = setTimeout(() => controller.abort(), 45000);
    };
    armTimeout();

    const rateLimited = 'I have hit my request limit for the moment — give it a minute and ask again. Or send it straight to Adil:';
    let answer = null; // the <span> the streamed text is written into

    try {
      const response = await fetch(api + '/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: question }),
        signal: controller.signal,
      });
      if (!response.ok || !response.body) {
        typing.remove();
        addFallback(question, response.status === 429 ? rateLimited : undefined);
        return;
      }

      // The reply arrives as Server-Sent Events: `data: {"text":"..."}\n\n`
      // frames, closed by `data: [DONE]`. A network chunk can end mid-frame,
      // so keep the unfinished tail in `buffer` until the rest arrives.
      const reader = response.body.getReader();
      const decoder = new TextDecoder();
      let buffer = '';

      while (true) {
        const { value, done } = await reader.read();
        if (done) break;
        armTimeout();
        buffer += decoder.decode(value, { stream: true });
        const frames = buffer.split('\n\n');
        buffer = frames.pop();

        for (const frame of frames) {
          const line = frame.trim();
          if (!line.startsWith('data:')) continue;
          const data = line.slice(5).trim();
          if (data === '[DONE]') continue;

          const message = JSON.parse(data);
          if (message.error) {
            const error = new Error(message.detail || message.error);
            error.status = message.status;
            throw error;
          }
          if (!message.text) continue;

          // First token: swap the typing dots for a real bubble.
          if (!answer) {
            typing.remove();
            answer = node('span', 'whitespace-pre-wrap');
            botBubble().appendChild(answer);
          }
          answer.textContent += message.text; // textContent, never innerHTML
          scrollToEnd();
        }
      }

      if (!answer) throw new Error('Empty reply');
    } catch (error) {
      typing.remove();
      if (answer) {
        // Part of the answer already showed — keep it rather than replace it.
        answer.parentElement.appendChild(node('span', 'text-[11px] text-outline italic', '(The answer was cut off — try asking again.)'));
        scrollToEnd();
      } else {
        addFallback(question, error.status === 429 ? rateLimited : undefined);
      }
    } finally {
      clearTimeout(timeout);
      if (sendButton) sendButton.disabled = false;
      pending = false;
    }
  });
})();
''';
