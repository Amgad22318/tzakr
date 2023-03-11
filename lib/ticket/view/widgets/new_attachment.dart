import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tzaker_task/ticket/view/widgets/ticket_form_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/constants/constant_methods.dart';
import 'package:tzaker_task/core/styles/colors.dart';
import 'package:tzaker_task/core/view/widgets/default_svg.dart';
import 'package:tzaker_task/core/view/widgets/default_text.dart';
import 'package:tzaker_task/ticket/model/file_picker_model.dart';

class NewAttachment extends StatefulWidget {
  const NewAttachment({super.key});

  @override
  State<NewAttachment> createState() => _NewAttachmentState();
}

class _NewAttachmentState extends State<NewAttachment> {
  List<FilePickerModel> attachments = [];
  final _attachmentNameController = TextEditingController();

  @override
  void dispose() {
    _attachmentNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TicketFormField(
                isOptional: true,
                textInputAction: TextInputAction.next,
                controller: _attachmentNameController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'إضافة اسم / وصف / رابط ... المرفق',
                onFieldSubmitted: (text) async {
                  PlatformFile? file = await pickFile();
                  if (file != null) {
                    setState(() {
                      attachments.add(FilePickerModel(
                          file,
                          _attachmentNameController.text.isNotEmpty
                              ? _attachmentNameController.text
                              : file.name));
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () async {
                PlatformFile? file = await pickFile();
                if (file != null) {
                  setState(() {
                    attachments.add(FilePickerModel(
                        file,
                        _attachmentNameController.text.isNotEmpty
                            ? _attachmentNameController.text
                            : file.name));
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 13.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    border: Border.all(color: blue1, width: 0.5.r)),
                child: Row(children: [
                  const DefaultSvg(imagePath: 'assets/svg/link-line.svg'),
                  SizedBox(
                    width: 12.w,
                  ),
                  const DefaultSvg(imagePath: 'assets/svg/plus-circle.svg'),
                ]),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            6.r,
                          ),
                          border: Border.all(color: blue1, width: 0.5.r)),
                      child: DefaultText(attachments[index].fileName,
                          style: TextStyle(
                              color: darkBlue2,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 70.w,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3.r),
                            child: Image.file(
                              File(attachments[index].file.path!),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                      child: DefaultText(
                                attachments[index].file.extension!,
                                style: TextStyle(
                                    color: darkBlue2,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal),
                              )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  attachments.removeAt(index);
                                });
                              },
                              child: DefaultSvg(
                                  height: 18.h,
                                  width: 18.w,
                                  imagePath: 'assets/svg/delete.svg')),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
            itemCount: attachments.length),
      ],
    );
  }
}
