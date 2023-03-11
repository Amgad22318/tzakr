import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/view/widgets/options_buttons.dart';

class OptionsDialog extends StatelessWidget {
  const OptionsDialog(
      {super.key,
      required this.message,
      required this.greyBtnTxt,
      required this.blueBtnTxt,
      this.greyBtnOnPressed,
      this.blueBtnOnPressed});

  final String greyBtnTxt;
  final String blueBtnTxt;
  final void Function()? greyBtnOnPressed;
  final void Function()? blueBtnOnPressed;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          DefaultText(
            message,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: grey7, fontWeight: FontWeight.normal, fontSize: 16.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          OptionsButtons(
            greyBtnTxt: greyBtnTxt,
            blueBtnTxt: blueBtnTxt,
            blueBtnOnPressed: blueBtnOnPressed,
            greyBtnOnPressed: greyBtnOnPressed,
          ),
        ]),
      ),
    );
  }
}
