import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tzaker_task/core/constants/constant_methods.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';

class TicketFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final bool enabled;
  final String? initialValue;
  final String? hintText;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool isDottedBorder;
  final bool isOptional;
  final bool expands;
  final bool? filled;
  final Color? fillColor;
  final TextAlignVertical? textAlignVertical;

  const TicketFormField(
      {Key? key,
      required this.controller,
      this.validator,
      this.onTap,
      required this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.initialValue,
      required this.hintText,
      this.maxLines = 1,
      this.enabled = true,
      this.contentPadding,
      this.maxLength,
      this.textInputAction,
      this.isDottedBorder = false,
      this.isOptional = false,
      this.expands = false,
      this.filled,
      this.fillColor, this.textAlignVertical=TextAlignVertical.center})
      : super(key: key);

  @override
  State<TicketFormField> createState() => _TicketFormFieldState();
}

class _TicketFormFieldState extends State<TicketFormField> {
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: widget.expands,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      textAlignVertical: widget.textAlignVertical,
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      textDirection: textDirection ?? Directionality.of(context),
      onChanged: (value) {
        if (textDirection != checkLanguage(value, context)) {
          setState(() {
            textDirection = checkLanguage(value, context);
          });
        }
      },
      onTap: widget.onTap,
      style: TextStyle(
          color: darkBlue2, fontWeight: FontWeight.normal, fontSize: 15.sp),
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.filled,
        hintStyle: TextStyle(
          color: darkBlueHint,
          fontSize: 15.sp,
          fontWeight: FontWeight.normal
        ),
        hintText: widget.hintText,
        label: widget.isOptional
            ? const SizedBox.shrink()
            : DefaultSvg(
                imagePath: 'assets/svg/star-fill.svg', height: 8.r, width: 8.r),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: blue2, width: 0.5.r)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: blue2, width: 0.5.r)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: blue2, width: 0.5.r)),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.r, vertical: 10.r),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
