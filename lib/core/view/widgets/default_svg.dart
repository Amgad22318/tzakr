import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultSvg extends StatelessWidget {
  const DefaultSvg(
      {super.key,
      required this.imagePath,
      this.width,
      this.height,
      this.color,
      this.alignment = Alignment.center,
      this.fit = BoxFit.contain});
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(

      imagePath,
      width: width,
      height: height,
      color: color,
      alignment: alignment,
      fit: fit,
    );
  }
}
