import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton({
    super.key,
    required this.onPressed,
    this.width,
    this.background,
    this.borderRadius,
    this.child,
    this.splashColor,
    this.padding,
    this.margin,
    this.height,
    this.elevation = 3,
    this.disabledColor,
    this.innerPadding,
    this.minWidth,
    this.btnHeight, this.materialTapTargetSize,
  });

  final double? width;
  final double? minWidth;
  final double? height;
  final double? btnHeight;
  final BorderRadiusGeometry? borderRadius;
  final Color? background;
  final Color? splashColor;
  final Color? disabledColor;
  final VoidCallback? onPressed; // voidCallback = void Function()
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? innerPadding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final MaterialTapTargetSize? materialTapTargetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      child: MaterialButton(
        materialTapTargetSize:materialTapTargetSize ,
        height: btnHeight,
        minWidth: minWidth,
        padding: innerPadding,
        disabledColor: disabledColor,
        elevation: elevation,
        splashColor: splashColor,
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(7.r),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
