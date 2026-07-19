import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// One tap-through batch of chat messages.
class ChatStep {
  const ChatStep({required this.messages, this.buttonLabel, this.enabled});

  final List<Widget> messages;

  /// Bottom button label while this step is the newest visible one.
  final String? buttonLabel;

  /// Optional gate — the bottom button stays disabled until it emits `true`
  /// (e.g. a form inside the step is filled in).
  final ValueListenable<bool>? enabled;
}

/// Day page in chat form: steps are revealed one batch at a time with a typing
/// indicator in between; a fixed bottom button drives the progression.
/// The user only receives messages — there is no text input.
class ChatDayPage extends StatefulWidget {
  const ChatDayPage({
    super.key,
    required this.steps,
    required this.onCompleted,
    this.defaultButtonLabel = 'Pokračovat',
  });

  final List<ChatStep> steps;
  final VoidCallback onCompleted;
  final String defaultButtonLabel;

  @override
  State<ChatDayPage> createState() => _ChatDayPageState();
}

class _ChatDayPageState extends State<ChatDayPage> {
  static const _typingDelay = Duration(milliseconds: 700);

  final ScrollController _scrollController = ScrollController();
  int _visibleSteps = 1;
  bool _isTyping = false;

  ChatStep get _currentStep => widget.steps[_visibleSteps - 1];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _onButtonPressed() async {
    if (_visibleSteps >= widget.steps.length) {
      widget.onCompleted();
      return;
    }
    setState(() => _isTyping = true);
    _scrollToBottom();
    await Future<void>.delayed(_typingDelay);
    if (!mounted) return;
    setState(() {
      _isTyping = false;
      _visibleSteps++;
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 16, bottom: 12),
              children: [
                const ChatDayStamp(label: 'Dnes'),
                for (var i = 0; i < _visibleSteps; i++)
                  _RevealedStep(
                    key: ValueKey('chat-step-$i'),
                    animate: i == _visibleSteps - 1 && i > 0,
                    children: widget.steps[i].messages,
                  ),
                if (_isTyping) const ChatTypingIndicator(),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 32), child: _buildButton(context)),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    final enabledListenable = _currentStep.enabled;
    if (enabledListenable == null) {
      return _BottomButton(
        label: _currentStep.buttonLabel ?? widget.defaultButtonLabel,
        enabled: !_isTyping,
        onPressed: _onButtonPressed,
      );
    }
    return ValueListenableBuilder<bool>(
      valueListenable: enabledListenable,
      builder: (context, enabled, _) {
        return _BottomButton(
          label: _currentStep.buttonLabel ?? widget.defaultButtonLabel,
          enabled: enabled && !_isTyping,
          onPressed: _onButtonPressed,
        );
      },
    );
  }
}

/// Step content fading & sliding in when it is first revealed.
class _RevealedStep extends StatelessWidget {
  const _RevealedStep({super.key, required this.children, required this.animate});

  final List<Widget> children;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final column = Column(crossAxisAlignment: CrossAxisAlignment.start, children: children);
    if (!animate) return column;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(offset: Offset(0, 12 * (1 - value)), child: child),
        );
      },
      child: column,
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({required this.label, required this.enabled, required this.onPressed});

  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade300,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: enabled ? 2 : 0,
        ),
        child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
