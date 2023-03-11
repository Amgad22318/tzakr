import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/constant_methods.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_material_button.dart';
import 'package:tzaker_task/core/view/widgets/default_network_image.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';

class RateDialog extends StatefulWidget {
  const RateDialog({super.key});

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.all(10.r),
          color: grey,
          child: Column(children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                radius: 40.r,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 30.r,
                    width: 30.r,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: grey8),
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                    )),
              ),
            ),
            Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: blue2,
                          width: 1.r,
                          strokeAlign: StrokeAlign.outside)),
                  child: DefaultNetworkImage(
                      height: 45.r,
                      width: 45.r,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLZJQwDd47bhzU-PN-wTdjuM05pk22m4JzhA&usqp=CAU'),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: DefaultText(
                    'تقييم الموظف',
                    style: TextStyle(
                        color: blue1,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp),
                  ),
                ),
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  itemSize: 20.r,
                  itemCount: 5,
                  allowHalfRating: true,
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: amber,
                    ),
                    half: Icon(Icons.star_half,
                        color: amber,
                        textDirection:
                            Directionality.of(context) == TextDirection.rtl
                                ? TextDirection.ltr
                                : TextDirection.rtl),
                    empty: const Icon(
                      Icons.star_border,
                      color: amber,
                    ),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {},
                )
              ],
            )
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
          child: Row(
            children: [
              Container(
                width: 9.r,
                height: 9.r,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff6fd3de),
                        Color(0xff486ac7),
                      ]),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Expanded(
                child: DefaultText(
                  'تقييم الخدمة',
                  style: TextStyle(
                      color: blue1,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp),
                ),
              ),
              RatingBar(
                initialRating: 3,
                direction: Axis.horizontal,
                itemSize: 20.r,
                itemCount: 5,
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: amber,
                  ),
                  half: Icon(Icons.star_half,
                      color: amber,
                      textDirection:
                          Directionality.of(context) == TextDirection.rtl
                              ? TextDirection.ltr
                              : TextDirection.rtl),
                  empty: const Icon(
                    Icons.star_border,
                    color: amber,
                  ),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          margin:
              EdgeInsetsDirectional.only(start: 10.w, end: 10.w, bottom: 16.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                    color: grey9,
                    blurRadius: 10.r,
                    spreadRadius: 3.r,
                    offset: Offset(0, 3.h))
              ],
              border: Border.all(
                  color: blue2,
                  width: 0.5.r,
                  strokeAlign: StrokeAlign.outside)),
          child: Column(
            children: [
              SizedBox(
                height: 62.h,
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  style: TextStyle(
                      color: darkBlue2,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp),
                  textDirection: textDirection ?? Directionality.of(context),
                  onChanged: (value) {
                    if (textDirection != checkLanguage(value, context)) {
                      setState(() {
                        textDirection = checkLanguage(value, context);
                      });
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: grey4.withOpacity(0.58),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                      hintText: 'اكتب تعليقك هنا'),
                ),
              ),
              DefaultMaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                borderRadius: BorderRadius.zero,
                background: grey7,
                onPressed: () {},
                child: Row(children: [
                  const DefaultSvg(imagePath: 'assets/svg/send_arrow.svg'),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: DefaultText(
                    'إرسال',
                    style: TextStyle(
                        color: yellow,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal),
                  )),
                  DefaultMaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    background: grey5,
                    minWidth: 112.w,

                    innerPadding: EdgeInsets.symmetric(horizontal: 40.w,),
                    padding: EdgeInsets.symmetric(vertical: 5.h,),
                    onPressed: () {},
                    child: DefaultText('الغاء',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            color: lightBlue3)),
                  )
                ]),
              )
            ],
          ),
        )
      ]),
    );
  }
}
