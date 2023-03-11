import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';

class UrgentButton extends StatefulWidget {
  const UrgentButton({
    Key? key,
    required this.value,
    required this.onChange,
    required this.text,
    required this.selected,
  }) : super(key: key);
  final bool value;
  final ValueChanged<bool> onChange;
  final String text;
  final bool selected;

  @override
  State<UrgentButton> createState() => _UrgentButtonState();
}

class _UrgentButtonState extends State<UrgentButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onChange.call(widget.value);
        },
        child: Container(
          height: 33.h,
          decoration: BoxDecoration(
              color: widget.selected ? grey : Colors.white,
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              border: Border.all(color: blue1, width: 0.5.r)),
          child:
              Row( children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 11.w),
              height: 18.5.w,
              width: 18.5.w,
              decoration: widget.selected
                  ? const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff6fd3de),
                            Color(0xff486ac7),
                          ]),
                    )
                  : BoxDecoration(
                      color: grey,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: lightBlue2.withOpacity(0.5), width: 2.r)),
              child: Visibility(
                  visible: widget.selected,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12.w,
                  )),
            ),
            Expanded(
              child: DefaultText(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: darkBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
            )
          ]),
        ));
  }
}
