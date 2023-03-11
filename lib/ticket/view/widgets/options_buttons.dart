import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_material_button.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';

class OptionsButtons extends StatelessWidget {
  const OptionsButtons({super.key, required this.greyBtnTxt, required this.blueBtnTxt, this.greyBtnOnPressed, this.blueBtnOnPressed});
  final String  greyBtnTxt;
  final String  blueBtnTxt;
  final void Function()? greyBtnOnPressed;
  final void Function()? blueBtnOnPressed;


  @override
  Widget build(BuildContext context) {
    return             Row(
      children: [
        const Spacer(),
        Flexible(
          flex: 4,
          child: DefaultMaterialButton(
            width:  double.infinity,

            background: grey5,
            onPressed: greyBtnOnPressed,
            child: DefaultText(greyBtnTxt,
                style: TextStyle(
                    color: lightBlue3,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp)),
          ),
        ),
        const Spacer(flex: 1),
        Flexible(
          flex: 4,
          child: DefaultMaterialButton(
            width:  double.infinity,
            background: blue2,
            onPressed: blueBtnOnPressed,
            child: DefaultText(blueBtnTxt,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp)),
          ),
        ),
        const Spacer(),
      ],
    )
    ;
  }
}
