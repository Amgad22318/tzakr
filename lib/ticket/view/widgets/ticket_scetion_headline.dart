import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';

class TicketSectionHeadline extends StatelessWidget {
  const TicketSectionHeadline({Key? key, required this.headline}) : super(key: key);
final String headline;
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      DefaultSvg(imagePath: 'assets/svg/blue_ellipse.svg',height: 10.r,width: 10.r,color: blue1),
      SizedBox(width: 9.w,),
      Flexible(child: DefaultText(headline,style: TextStyle(color: blue1,fontSize: 16.sp,fontWeight: FontWeight.normal),))
    ],);
  }
}
