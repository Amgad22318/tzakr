import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/screens.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_network_image.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';

class AttachmentDetails extends StatelessWidget {
  const AttachmentDetails(
      {super.key, required this.imageUrl,  this.isPlatform=false});

  final String imageUrl;
  final bool isPlatform;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: DefaultText(
          'صورة مرفق تفاصيل العملية',
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.normal, color: isPlatform?green:blue1 ),
        )),
        InkWell(
            onTap: () {

              Navigator.pushNamed(context, openImageRoute, arguments: imageUrl);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 40.h,
              width: 67.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
              child: Hero(

                  tag: imageUrl,
                  child: DefaultNetworkImage(imageUrl: imageUrl)),
            ))
      ],
    );
  }
}
