import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/screens.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/view/widgets/advertisers_appbar/advertisers_app_bar.dart';
import 'package:tzaker_task/ticket/view/widgets/dialogs/options_dialog.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => OptionsDialog(
                message:
                    'عزيزي المستخدم أنت غير مسجل دخول يمكنك تسجيل الدخول أو الاستمرار كزائر',
                greyBtnTxt: 'تسجيل دخول',
                blueBtnTxt: 'الاستمرار كزائر',
                greyBtnOnPressed: () {},
                blueBtnOnPressed: () {},
              ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, createTicketRoute);
        },
        backgroundColor: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: grey,
              shape: BoxShape.circle,
              border: Border.all(color: grey4.withOpacity(0.37), width: 1.r)),
          child: Container(
            margin: EdgeInsets.all(8.r),
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
            child: Icon(Icons.add, color: Colors.white, size: 40.r),
          ),
        ),
      ),
      appBar: const AppBarWidget(
        isSearchBar: true,
        isFilter: true,
        isBack: true,
      ),
      body: Column(children: [
        Material(
            color: grey,
            elevation: 1,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 16.r),
                margin: EdgeInsets.symmetric(vertical: 5.r, horizontal: 34.r),
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(6.r)),
                child: DefaultText(
                  'تذاكر الدعم',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.r),
          child: ListView.builder(
              itemBuilder: (context, index) => Ticket(
                    ticketMargin:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 5.w),
                    onTap: () {
                      Navigator.pushNamed(context, ticketDetailsRoute);
                    },
                  )),
        ))
      ]),
    );
  }
}
