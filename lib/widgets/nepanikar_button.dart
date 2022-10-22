import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

enum ButtonType {
  primary,
  primaryAsync,
  secondary,
  secondaryAsync;

  bool get isPrimary => this == ButtonType.primary || this == ButtonType.primaryAsync;

  bool get isSecondary => this == ButtonType.secondary || this == ButtonType.secondaryAsync;

  bool get isAsync => this == ButtonType.primaryAsync || this == ButtonType.secondaryAsync;

  bool get isOutlined => this == ButtonType.secondary || this == ButtonType.secondaryAsync;
}

class NepanikarButton extends StatefulWidget {
  const NepanikarButton({
    super.key,
    required VoidCallback this.onTap,
    required this.text,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.expandToContentWidth = false,
  })  : buttonType = ButtonType.primary,
        onTapAsync = null;

  const NepanikarButton.async({
    super.key,
    required AsyncCallback this.onTapAsync,
    required this.text,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.expandToContentWidth = false,
  })  : buttonType = ButtonType.primaryAsync,
        onTap = null;

  const NepanikarButton.secondary({
    super.key,
    required VoidCallback this.onTap,
    required this.text,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.expandToContentWidth = false,
  })  : buttonType = ButtonType.secondary,
        onTapAsync = null;

  const NepanikarButton.secondaryAsync({
    super.key,
    required AsyncCallback this.onTapAsync,
    required this.text,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.expandToContentWidth = false,
  })  : buttonType = ButtonType.secondaryAsync,
        onTap = null;

  final AsyncCallback? onTapAsync;
  final VoidCallback? onTap;
  final String text;
  final bool enabled;
  final SvgGenImage? leadingIcon;
  final SvgGenImage? trailingIcon;
  final bool expandToContentWidth;
  final ButtonType buttonType;

  @override
  State<NepanikarButton> createState() => _NepanikarButtonState();
}

class _NepanikarButtonState extends State<NepanikarButton> with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  late final AnimationController _animController;

  bool get _isButtonInteractive => widget.enabled && !_isLoading;

  Future<void> _onTap() async {
    if (widget.buttonType.isAsync) {
      if (mounted) setState(() => _isLoading = true);
      unawaited(_animController.repeat());
      await widget.onTapAsync?.call();
      if (mounted) {
        _animController.reset();
        setState(() => _isLoading = false);
      }
    } else {
      widget.onTap?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onPressed = _isButtonInteractive ? _onTap : null;
    return widget.buttonType.isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            child: _buildButtonContent(),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: _buildButtonContent(),
          );
  }

  Widget _buildButtonContent() {
    const iconSize = 20.0;
    final iconColor = widget.buttonType.isPrimary
        ? Colors.white
        : _isButtonInteractive
            ? NepanikarColors.primary
            : NepanikarColors.primarySwatch.shade500;

    return _isLoading
        ? SizedBox(
            width: widget.expandToContentWidth ? double.infinity : null,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_animController),
              child: widget.buttonType.isPrimary
                  ? Assets.icons.spinner.svg(width: iconSize, color: iconColor)
                  : Assets.icons.warningWavy.svg(width: iconSize, color: iconColor),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: widget.expandToContentWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (widget.leadingIcon != null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: widget.leadingIcon!.svg(width: iconSize / 3, color: iconColor),
                ),
              Flexible(child: Text(widget.text)),
              if (widget.trailingIcon != null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: widget.trailingIcon!.svg(width: iconSize / 3, color: iconColor),
                ),
            ],
          );
  }
}
