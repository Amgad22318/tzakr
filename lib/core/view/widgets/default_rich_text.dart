import 'package:flutter/material.dart';

class DefaultRichText extends StatelessWidget {
  const DefaultRichText({
    super.key,
    required this.text,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.textDirection ,
  });
  final InlineSpan text;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
