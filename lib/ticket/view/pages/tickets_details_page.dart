import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/screens.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_material_button.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/view/widgets/advertisers_appbar/advertisers_app_bar.dart';
import 'package:tzaker_task/ticket/view/widgets/attachment_details.dart';
import 'package:tzaker_task/ticket/view/widgets/close_ticket_switch_header.dart';
import 'package:tzaker_task/ticket/view/widgets/new_attachment.dart';
import 'package:tzaker_task/ticket/view/widgets/options_buttons.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_details/close_ticket_switch.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_form_field.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_reply.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_scetion_headline.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({Key? key}) : super(key: key);

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  late bool _addReply;
  late bool _showReplies;
  late bool _ticketClosed;

  final _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _addReply = false;
    _showReplies = false;
    _ticketClosed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_showReplies) {
          setState(() {
            _showReplies = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar:  AppBarWidget(
          isBack: true,
          backPressed: () {
            if (_showReplies) {
              setState(() {
                _showReplies = false;
              });
            }
            else{Navigator.pop(context);}
          },
        ),
        body: Column(children: [
           CloseTicketSwitchHeader(onTicketClose: (bool value) { if (value){
             setState(() {
               _ticketClosed=value;
               _showReplies=false;
             });
           }  },),
          Ticket(
            ticketMargin: EdgeInsets.symmetric(vertical: 11.h),
          ),
          Visibility(
            visible: _showReplies,
            replacement: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 12.w,
                          end: 12.w,
                          top: 6.h,
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          children: [
                            Row(children: [
                              const Flexible(
                                  child: TicketSectionHeadline(
                                      headline: 'وصف التذكرة')),
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: DefaultMaterialButton(
                                    innerPadding: EdgeInsets.symmetric(
                                        vertical: 4.h, horizontal: 12.w),
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(18.r),
                                    background: grey2,
                                    onPressed: () {
                                      setState(() {
                                        _showReplies = true;
                                      });
                                    },
                                    child: DefaultText('عرض الردود والمرفقات',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: blue1,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13.sp)),
                                  ),
                                ),
                              )
                            ]),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(6.r),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 10.w),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.r)),
                                  child: DefaultText(
                                    'مرحبا .. السلام عليكم .. انا قدمت تذكرة بخصوص الخصم المكتسب .. حيث خصم مني مبلغ في الفاتورة رقم 52630 بقيمة 1210 تحت مسمى خصم مكتسب حبيت استفسر ليش يتم الخصم مني وليس من المنصة',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: greyText1),
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                            ),
                            const TicketSectionHeadline(headline: 'المرفقات'),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    const AttachmentDetails(
                                        imageUrl:
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7pGSfGJsnI-LQBbtLqcsTdv7j1skv1b2KiQ&usqp=CAU'),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: 3)
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 12.w,
                          end: 12.w,
                          top: 6.h,
                          bottom: 12.h,
                        ),
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          children: [
                            TicketReply(withArrow: false),
                            SizedBox(
                              height: 17.h,
                            ),
                            Visibility(
                              visible: !_ticketClosed,
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: DefaultMaterialButton(
                                  btnHeight: 0,
                                  innerPadding: EdgeInsets.symmetric(
                                      vertical: 0.h, horizontal: 10.w),
                                  borderRadius: BorderRadius.circular(18.r),
                                  background: grey7,
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DefaultSvg(
                                            imagePath:
                                                'assets/svg/plus-circle.svg',
                                            color: yellow,
                                            height: 14.r,
                                            width: 14.r),
                                        SizedBox(width: 10.w),
                                        DefaultText('اضف رد',
                                            style: TextStyle(
                                                color: yellow,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal)),
                                      ]),
                                  onPressed: () {
                                    setState(() {
                                      _addReply = true;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                                visible: _addReply,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 75.h,
                                      child: TicketFormField(
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        maxLines: null,
                                        expands: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        controller: _replyController,
                                        keyboardType: TextInputType.text,
                                        hintText: 'يمكنك إضافة رد هنا',
                                        isOptional: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    const NewAttachment(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    OptionsButtons(
                                      greyBtnTxt: 'حفظ ارسال',
                                      blueBtnTxt: 'الغاء',
                                      blueBtnOnPressed: () {
                                        setState(() {
                                          _addReply = false;
                                        });
                                      },
                                      greyBtnOnPressed: () {},
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Expanded(
                child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 3.h),
                    margin: EdgeInsets.symmetric(
                      horizontal: 11.w,
                    ),
                    decoration: BoxDecoration(
                        color: blue1,
                        borderRadius: BorderRadius.circular(18.r)),
                    child: DefaultText('سجل الردود والمرفقات',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(height: 11.h),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          TicketReply(isPlatform: index % 2 == 0),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      separatorBuilder: (context, index) => Divider(
                          indent: 8.w, endIndent: 8.w, thickness: 1.5.h),
                      itemCount: 20),
                )
              ],
            )),
          )
        ]),
      ),
    );
  }
}
