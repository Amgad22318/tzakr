import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_network_image.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/view/widgets/attachment_details.dart';

class TicketReply extends StatelessWidget {
  const TicketReply({super.key, this.isPlatform=false,  this.withArrow =true,  this.padding=EdgeInsets.zero});
  final bool isPlatform;
  final bool withArrow;
  final EdgeInsetsGeometry padding;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                  child: DefaultNetworkImage(
                      height: 23.h,
                      width: 23.h,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTttv-84wJJ0bokwKLlxp4VatKbYsDPAwNOZw&usqp=CAU')),
              SizedBox(
                width: 7.w,
              ),
              Expanded(
                  child: DefaultText(
                'BE TREND',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color:isPlatform? green:black2, fontSize: 15.sp),
              )),
              Expanded(
                  child: DefaultText(
                'آخر رد قبل 4.4 ساعة',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: black2.withOpacity(0.6),
                  fontSize: 10.sp,
                ),
                textAlign: TextAlign.end,
              )),
            ],
          ),
          DefaultText(
            'مرفق لك صورة تفاصيل عملية الموافقة من سستم المنصة باليوم والساعة والدقيقة .. والذي نفذ العملية هو موظف لديك لديه الصلاحية للموافقة والدقيقة .. والذي نفذ العملية هو موظف لديك لديه الصلاحية للموافقة والدقيقة .. والذي نفذ العملية هو موظف لديك لديه الصلاحية للموافقة والدقيقة الموظف محمد السلامة',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: isPlatform?green:blue1,
              fontSize: 15.sp,
            ),
            maxLines: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>  AttachmentDetails(
                isPlatform: isPlatform,
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7pGSfGJsnI-LQBbtLqcsTdv7j1skv1b2KiQ&usqp=CAU'),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 10.h),
              itemCount: 2)

        ],
      ),
    );
  }
}
