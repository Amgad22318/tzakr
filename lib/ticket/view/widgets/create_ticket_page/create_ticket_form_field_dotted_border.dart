import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tzaker_task/core/constants/constant_methods.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';

class CreateTicketFormFieldDottedBorder extends StatefulWidget {
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

  const CreateTicketFormFieldDottedBorder(
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
      this.isDottedBorder = false})
      : super(key: key);

  @override
  State<CreateTicketFormFieldDottedBorder> createState() =>
      _CreateTicketFormFieldDottedBorderState();
}

class _CreateTicketFormFieldDottedBorderState
    extends State<CreateTicketFormFieldDottedBorder> {
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          color: blue2,

          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            child: SizedBox(
              height: 75.h,
              child: TextFormField(

                maxLines: null,
                expands: true,
                textInputAction: widget.textInputAction,
                maxLength: widget.maxLength,
                enabled: widget.enabled,
                textAlignVertical: TextAlignVertical.top,
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

                  hintStyle: TextStyle(
                    color: darkBlueHint,
                  ),
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  contentPadding: widget.contentPadding ??
                      EdgeInsets.symmetric(horizontal: 12.r, vertical: 10.r),
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          start: 12.w,
          top: -4.5.r,
          child: Container(
    height: 7.r, width: 14.r,
    color: grey,
            child: DefaultSvg(
                imagePath: 'assets/svg/star-fill.svg', height: 7.r, width: 7.r),
          ),
        ),

      ],
    );
  }
}
