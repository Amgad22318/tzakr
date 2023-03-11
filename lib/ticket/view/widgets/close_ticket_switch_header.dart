import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/view/widgets/dialogs/options_dialog.dart';
import 'package:tzaker_task/ticket/view/widgets/dialogs/rate_dialog.dart';

import 'ticket_details/close_ticket_switch.dart';

class CloseTicketSwitchHeader extends StatefulWidget {
  const CloseTicketSwitchHeader({super.key, required this.onTicketClose});
  final ValueChanged<bool> onTicketClose;

  @override
  State<CloseTicketSwitchHeader> createState() =>
      _CloseTicketSwitchHeaderState();
}

class _CloseTicketSwitchHeaderState extends State<CloseTicketSwitchHeader> {
  bool? ticketSwitch;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: grey,
        elevation: 1,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 5.h,
            bottom: 5.h,
            start: 20.w,
            end: 12.w,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 29.w),
                margin: EdgeInsets.symmetric(
                  vertical: 5.r,
                ),
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(6.r)),
                child: DefaultText(
                  'التذاكر',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: DefaultText(
                'عندما تتم خدمتك أغلق التذكرة',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                    color: blue1),
              )),
              SizedBox(
                width: 8.w,
              ),
              CloseTicketSwitch(
                value: ticketSwitch ?? false,
                onChanged: (value) {
                  if (value) {
                    showDialog(
                        context: context,
                        builder: (context) => OptionsDialog(
                          message:
                          'هل أنت متأكد من اغلاق التذكرة',
                          greyBtnTxt: 'نعم',
                          blueBtnTxt: 'لا',
                          greyBtnOnPressed: () {
                            setState(() {
                              ticketSwitch = true;
                              widget.onTicketClose.call(true);
                              Navigator.pop(context);
                              showDialog(context: context, builder: (context) => RateDialog(),);
                            });

                          },
                          blueBtnOnPressed: () {
                            setState(() {
                              ticketSwitch = false;
                            });
                            Navigator.pop(context);


                          },
                        ));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
