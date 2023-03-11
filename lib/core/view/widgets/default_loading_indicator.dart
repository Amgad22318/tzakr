import 'package:flutter/material.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({super.key, this.color, this.value,  this.strokeWidth=4.0});
  final Color? color;
  final double? value;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(strokeWidth: strokeWidth,
      color: color,
      value: value,
    ));
  }
}
