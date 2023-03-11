import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tzaker_task/core/constants/constant_methods.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_material_button.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/model/file_picker_model.dart';
import 'package:tzaker_task/ticket/view/widgets/advertisers_appbar/advertisers_app_bar.dart';
import 'package:tzaker_task/ticket/view/widgets/create_ticket_page/create_ticket_drop_down_button.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_form_field.dart';
import 'package:tzaker_task/ticket/view/widgets/create_ticket_page/create_ticket_form_field_dotted_border.dart';
import 'package:tzaker_task/ticket/view/widgets/new_attachment.dart';
import 'package:tzaker_task/ticket/view/widgets/options_buttons.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_scetion_headline.dart';
import 'package:tzaker_task/ticket/view/widgets/create_ticket_page/urgent_button.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({
    super.key,
  });

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  late bool _isUrgent;

  @override
  void initState() {
    _isUrgent = false;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppBarWidget(
        isBack: true,
      ),
      body: Column(children: [
        Material(
            color: grey,
            elevation: 1,
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.r, horizontal: 16.r),
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
                )
              ],
            )),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.r, vertical: 8.r),
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(8.r)),
              child: Column(children: [
                Column(
                  children: [
                    const TicketSectionHeadline(
                        headline: 'بيانات العميل الزائر'),
                    SizedBox(
                      height: 15.h,
                    ),
                    TicketFormField(
                      textInputAction: TextInputAction.next,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      hintText: 'الاسم',
                      validator: (text) {
                        if (text!.length <= 3) {
                          return 'الاسم يجب ان لا يقل عن 3 حروف';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TicketFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'الايميل',
                      validator: (text) {
                        if (text!.isEmail) {
                          return 'الرجاء ادخال ايميل صحيح';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TicketFormField(
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: 'رقم الجوال',
                      validator: (text) {
                        if (text!.isPhoneNumber) {
                          return 'الرجاء ادخال رقم صحيح';
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
                const TicketSectionHeadline(headline: 'بيانات التذكرة'),
                SizedBox(
                  height: 15.h,
                ),
                CreateTicketDropDownButton(
                  onChanged: (value) {},
                  hint: 'نوع التذكرة',
                  items: List.generate(
                    30,
                    (index) => DropdownMenuItem(
                        value: "Canada$index",
                        child: Text(
                          "Canada $index",
                          style: TextStyle(
                              color: darkBlue2,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CreateTicketDropDownButton(
                  onChanged: (value) {},
                  hint: 'قسم التذكرة',
                  items: List.generate(
                    30,
                    (index) => DropdownMenuItem(
                        value: "Usa$index",
                        child: Text(
                          "USA $index",
                          style: TextStyle(
                              color: darkBlue2,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CreateTicketFormFieldDottedBorder(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  hintText: 'الوصف / اشرح طلبك',
                ),
                SizedBox(
                  height: 15.h,
                ),
                const NewAttachment(),




                SizedBox(
                  height: 15.h,
                ),
                const TicketSectionHeadline(headline: 'الحالة'),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Flexible(
                      flex: 4,
                      child: UrgentButton(
                          value: true,
                          selected: _isUrgent == true,
                          onChange: (value) {
                            setState(() {
                              _isUrgent = true;
                            });
                          },
                          text: 'مستعجل'),
                    ),
                    const Spacer(flex: 2),
                    Flexible(
                      flex: 4,
                      child: UrgentButton(
                          value: false,
                          selected: _isUrgent == false,
                          onChange: (value) {
                            setState(() {
                              _isUrgent = false;
                            });
                          },
                          text: 'غير مستعجل'),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 106.h,
                ),
                OptionsButtons(
                  greyBtnTxt: 'حفظ ارسال',
                  blueBtnTxt: 'الغاء',
                  blueBtnOnPressed: () {},
                  greyBtnOnPressed: () {},
                ),
                SizedBox(
                  height: 17.h,
                ),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
