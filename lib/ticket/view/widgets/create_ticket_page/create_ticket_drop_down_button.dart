import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';

class CreateTicketDropDownButton extends StatelessWidget {
  const CreateTicketDropDownButton(
      {Key? key, required this.items, this.onChanged, required this.hint})
      : super(key: key);

  final List<DropdownMenuItem<Object>> items;
  final void Function(Object?)? onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(

      menuMaxHeight: 0.2.sh,
      iconEnabledColor: blue1,
      hint: Text(hint,
          style: TextStyle(
            color: darkBlueHint,
          )),
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(
            end: 8.r, start: 14.r, bottom: 12.r, top: 8.r),
        label: DefaultSvg(
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
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
