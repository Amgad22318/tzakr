import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(this.text,{
    super.key,
    this.maxLines = 1,
    this.style,
    this.textAlign,
    this.textScaleFactor,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration,
    this.softWrap,
  });
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final bool? softWrap;

  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
    );
  }
}
