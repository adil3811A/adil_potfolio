import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/profile.dart';
import 'ui.dart';

/// Floating "Ask AI about Adil" assistant, from the Stitch design.
///
/// The opening exchange is scripted as a quick guide; everything a visitor
/// sends goes to the Gemini-backed API at [Profile.chatApi]. If that call fails
/// the assistant says so and hands over Adil's real contact details. The
/// behaviour lives in the enhancement script in `app.dart`.
class ChatWidget extends StatelessComponent {
  const ChatWidget({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      id: 'chat-widget',
      classes: 'fixed bottom-20 lg:bottom-6 right-4 lg:right-6 z-50 flex flex-col items-end gap-3',
      // Read by the enhancement script in app.dart.
      attributes: {
        'data-api': Profile.chatApi,
        'data-email': Profile.email,
        'data-whatsapp': Profile.whatsapp,
      },
      [
        _panel(),
        _launcher(),
      ],
    );
  }

  Component _panel() {
    return div(
      id: 'chat-panel',
      classes: 'hidden w-[360px] sm:w-[410px] max-w-[calc(100vw-32px)] max-h-[min(580px,70dvh)] '
          'bg-surface-container-lowest rounded-3xl overflow-hidden flex flex-col '
          'shadow-[0_20px_40px_-8px_rgba(0,104,95,0.25)] origin-bottom-right',
      attributes: {'role': 'dialog', 'aria-label': 'Portfolio assistant'},
      [
        _header(),
        _log(),
        _composer(),
      ],
    );
  }

  Component _header() {
    return div(
      classes: 'bg-primary p-4 text-on-primary flex items-center justify-between gap-2 shrink-0',
      [
        div(classes: 'flex items-center gap-3 min-w-0', [
          div(
            classes: 'relative w-10 h-10 shrink-0 rounded-2xl bg-primary-container '
                'flex items-center justify-center text-primary-fixed',
            [
              icon('smart_toy', classes: 'text-[24px]'),
              span(
                classes: 'absolute -bottom-0.5 -right-0.5 w-3 h-3 rounded-full '
                    'bg-secondary-container ring-2 ring-primary',
                [],
              ),
            ],
          ),
          div(classes: 'flex flex-col min-w-0', [
            div(classes: 'flex items-center gap-2', [
              span(
                classes: 'font-title-md text-label-md text-on-primary font-bold',
                [.text('Adil’s Portfolio AI')],
              ),
              span(
                classes: 'px-2 py-0.5 rounded-full bg-secondary-fixed/30 text-on-primary '
                    'font-label-sm text-[10px] uppercase font-bold tracking-wider',
                [.text('HR Bot')],
              ),
            ]),
            span(
              classes: 'font-body-sm text-[11px] text-on-primary/80 flex items-center gap-1',
              [
                span(classes: 'w-1.5 h-1.5 rounded-full bg-primary-fixed animate-pulse', []),
                .text('Ask about Adil’s work & availability'),
              ],
            ),
          ]),
        ]),
        button(
          classes: 'w-8 h-8 shrink-0 rounded-full bg-surface-container-lowest/15 '
              'hover:bg-surface-container-lowest/25 text-on-primary flex items-center '
              'justify-center transition-colors cursor-pointer',
          attributes: {'data-chat-toggle': '', 'aria-label': 'Close assistant'},
          [icon('close', classes: 'text-[18px]')],
        ),
      ],
    );
  }

  Component _log() {
    return div(
      id: 'chat-log',
      classes: 'p-4 overflow-y-auto flex flex-col gap-3 bg-surface-container-low/60 '
          'max-h-[min(380px,45dvh)] grow',
      [
        div(classes: 'text-center my-1', [
          span(
            classes: 'px-3 py-1 rounded-full bg-surface-container text-on-surface-variant '
                'font-label-sm text-[11px]',
            [.text('Recruiter & Hiring Quick Guide')],
          ),
        ]),
        _bot([
          span([
            .text('👋 Hi! I’m Adil’s portfolio assistant. Adil is an '),
            strong([.text('Application Development Engineer')]),
            .text(' working in Flutter and native Android — 1+ year in production, 500+ downloads '
                'on an app he published solo, and eight live client apps. How can I help your '
                'hiring team?'),
          ]),
        ]),
        _user('What are his core strengths and current availability?'),
        _bot([
          span([
            .text('✅ '),
            strong([.text('Availability:')]),
            .text(' open to full-time roles and contracts — Thane / Mumbai, or fully remote.'),
          ]),
          span([
            .text('🚀 '),
            strong([.text('Highlights:')]),
          ]),
          ul(classes: 'list-none pl-1 flex flex-col gap-1 text-[13px] text-on-surface-variant', [
            for (final (label, detail) in const [
              ('PannaseCHE:', '500+ downloads, published solo on both stores.'),
              ('Pressfit:', '5 live B2B Flutter apps, maintained daily.'),
              ('Dial4242:', 'legacy native Android ambulance platform, 3 apps.'),
              ('Payments:', 'HDFC HyperSDK (JustPay) running in production.'),
            ])
              li(classes: 'flex items-start gap-1.5', [
                .text('• '),
                strong([.text(label)]),
                .text(' $detail'),
              ]),
          ]),
        ]),
        _suggestions(),
      ],
    );
  }

  /// An assistant message.
  Component _bot(List<Component> children) {
    return div(classes: 'flex items-start gap-2.5', [
      div(
        classes: 'w-7 h-7 rounded-xl bg-primary-fixed shrink-0 flex items-center '
            'justify-center text-primary',
        [icon('smart_toy', classes: 'text-[16px]')],
      ),
      div(
        classes: 'p-3.5 rounded-2xl rounded-tl-none bg-surface-container-lowest shadow-xs '
            'text-on-surface text-body-sm leading-relaxed max-w-[85%] flex flex-col gap-2',
        children,
      ),
    ]);
  }

  /// A visitor message.
  Component _user(String text) {
    return div(classes: 'flex items-start justify-end gap-2.5', [
      div(
        classes: 'p-3.5 rounded-2xl rounded-tr-none bg-primary text-on-primary text-body-sm '
            'leading-relaxed max-w-[85%] shadow-sm',
        [.text(text)],
      ),
      div(
        classes: 'w-7 h-7 rounded-xl bg-surface-container-high shrink-0 flex items-center '
            'justify-center text-on-surface text-[11px] font-bold',
        [.text('HR')],
      ),
    ]);
  }

  Component _suggestions() {
    return div(classes: 'flex flex-col gap-1.5 pt-1', [
      span(
        classes: 'text-[11px] font-semibold text-outline uppercase tracking-wider px-1',
        [.text('Suggested questions')],
      ),
      div(classes: 'flex flex-wrap gap-1.5', [
        for (final (label, question) in chatSuggestions)
          button(
            classes: 'px-2.5 py-1 rounded-full bg-surface-container-lowest border '
                'border-outline-variant/50 hover:border-primary hover:text-primary text-[12px] '
                'font-medium text-on-surface-variant transition-colors text-left cursor-pointer',
            attributes: {'data-chat-suggest': question},
            [.text(label)],
          ),
      ]),
    ]);
  }

  Component _composer() {
    return form(
      id: 'chat-form',
      classes: 'p-3 bg-surface-container-lowest border-t border-surface-container flex '
          'items-center gap-2 shrink-0',
      [
        input(
          id: 'chat-input',
          type: InputType.text,
          classes: 'flex-1 min-w-0 px-3.5 py-2.5 rounded-full bg-surface-container-low '
              'text-body-sm text-on-surface placeholder:text-outline focus:outline-none '
              'focus:ring-2 focus:ring-primary/30',
          attributes: {
            'placeholder': 'Ask about the stack, notice period, or apps…',
            'autocomplete': 'off',
            'aria-label': 'Your question',
          },
        ),
        button(
          type: ButtonType.submit,
          classes: 'w-10 h-10 shrink-0 rounded-full bg-primary hover:bg-primary-container '
              'text-on-primary flex items-center justify-center transition-all shadow-sm '
              'cursor-pointer disabled:opacity-60 disabled:cursor-not-allowed',
          attributes: {'aria-label': 'Send'},
          [icon('send', classes: 'text-[18px]')],
        ),
      ],
    );
  }

  Component _launcher() {
    return button(
      id: 'chat-launcher',
      classes: 'flex items-center gap-2.5 px-4 sm:px-5 py-3 rounded-full bg-primary '
          'hover:bg-primary-container text-on-primary transition-all hover:-translate-y-0.5 '
          'shadow-[0_6px_24px_-4px_rgba(0,104,95,0.45)] group cursor-pointer',
      attributes: {'data-chat-toggle': '', 'aria-expanded': 'false'},
      [
        div(classes: 'relative flex items-center justify-center', [
          icon('auto_awesome', classes: 'text-[22px] group-hover:scale-110 transition-transform'),
          span(
            classes: 'absolute -top-1 -right-1 w-2.5 h-2.5 rounded-full bg-secondary-container '
                'animate-ping',
            [],
          ),
          span(
            classes: 'absolute -top-1 -right-1 w-2.5 h-2.5 rounded-full bg-secondary-container',
            [],
          ),
        ]),
        div(classes: 'hidden sm:flex flex-col items-start text-left', [
          span(
            classes: 'font-title-md text-label-md leading-tight font-bold',
            [.text('Ask AI about Adil')],
          ),
          span(
            classes: 'font-label-sm text-[11px] text-primary-fixed font-normal',
            [.text('Recruiter & HR Assistant')],
          ),
        ]),
      ],
    );
  }
}
