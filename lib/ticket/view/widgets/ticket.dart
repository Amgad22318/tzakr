import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/screens.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_network_image.dart';
import 'package:tzaker_task/core/view/widgets/default_rich_text.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/core/view/widgets/default_text_span.dart';

class Ticket extends StatelessWidget {
  const Ticket({
    Key? key, required this.ticketMargin, this.onTap,
  }) : super(key: key);

final EdgeInsetsGeometry ticketMargin;
final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                  color: grey3, blurRadius: 6.r, offset: const Offset(1, 1))
            ]),
        margin: ticketMargin,
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: DefaultText(
                    'رقم التذكرة 0000000',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: grey4,
                        fontWeight: FontWeight.normal),
                  )),
              Flexible(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 26.w),
                      decoration: BoxDecoration(
                          color: grey2,
                          borderRadius: BorderRadius.circular(18.r)),
                      child: DefaultText(
                        'قيد المداولة',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: blue1,
                            fontWeight: FontWeight.normal),
                      ))),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 13.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 12.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                            color: grey3,
                            blurRadius: 4.r,
                            offset: const Offset(2, 2))
                      ]),
                  clipBehavior: Clip.antiAlias,
                  child: DefaultNetworkImage(
                    imageUrl:
                        'https://images.squarespace-cdn.com/content/v1/5f9306f63ef8480c49f3993c/1634914282419-KFNAEPZ568V9SO8QR9JS/Avatar+-+Khalid.jpg',
                    height: 45.h,
                    width: 45.h,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        'حمدي محمد الحربي',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: DefaultRichText(
                                  text: defaultTextSpan(children: [
                            defaultTextSpan(
                                text: 'النوع / ',
                                style: const TextStyle(
                                    color: greyText1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                            defaultTextSpan(
                                text: 'دعم',
                                style: const TextStyle(
                                    color: darkBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ]))),
                          Expanded(
                              child: DefaultRichText(
                                  text: defaultTextSpan(children: [
                            defaultTextSpan(
                                text: 'القسم / ',
                                style: const TextStyle(
                                    color: greyText1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                            defaultTextSpan(
                                text: 'دعم فني',
                                style: const TextStyle(
                                    color: darkBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ]))),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child:DefaultRichText(
                      text: defaultTextSpan(children: [
                        defaultTextSpan(
                            text: 'تم الانشاء  ',
                            style: const TextStyle(
                                color: grey4,
                                fontSize: 14,
                                fontWeight: FontWeight.normal)),
                        defaultTextSpan(
                            text: '10/7/2022',
                            style: const TextStyle(
                                color: greyText2,
                                fontSize: 14,
                                fontWeight: FontWeight.normal)),
                      ]))),
              Flexible(
                  child: DefaultText(
                    'اخر مداولة منذ 4 ساعة',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: brown,
                        fontWeight: FontWeight.normal),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
