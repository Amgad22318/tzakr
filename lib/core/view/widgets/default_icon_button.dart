import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
    this.splashColor,
    required this.icon,
    this.iconSize,
    this.iconColor,
    this.constraints,
    this.padding = const EdgeInsets.all(8),
  });

  final Widget icon;
  final Color? iconColor;
  final Color? splashColor;
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final double? iconSize;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      constraints: constraints,
      alignment: AlignmentDirectional.center,
      splashColor: splashColor,
      color: iconColor,
      onPressed: onPressed,
      iconSize: iconSize,
      icon: icon,
    );
  }
}
