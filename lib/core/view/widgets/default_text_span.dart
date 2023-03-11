import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan defaultTextSpan({
  final String? text,
  final List<InlineSpan>? children,
  final GestureRecognizer? recognizer,
  final MouseCursor? mouseCursor,
  final void Function(PointerEnterEvent)? onEnter,
  final void Function(PointerExitEvent)? onExit,
  final String? semanticsLabel,
  final Locale? locale,
  final bool? spellOut,
  final FontWeight? fontWeight = FontWeight.w600,
  final double? fontSize,
  final TextDecoration? textDecoration,
  final TextStyle? style,
}) {
  return TextSpan(
      text: text,
      children: children,
      locale: locale,
      mouseCursor: mouseCursor,
      onEnter: onEnter,
      onExit: onExit,
      recognizer: recognizer,
      semanticsLabel: semanticsLabel,
      style: style,
      spellOut: spellOut);
}
