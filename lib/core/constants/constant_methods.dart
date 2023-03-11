import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants.dart';

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

void showToastMsg({required String msg, required ToastStates toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: Colors.black,
      fontSize: 16.0);
}

Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.cyanAccent;
      break;
    case ToastStates.WARNING:
      color = Colors.white;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

TextDirection? checkLanguage(String text, BuildContext context) {
  if (text.isNotEmpty) {
    if (RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$').hasMatch(text[text.length - 1])) {
      return TextDirection.ltr;
    } else if (RegExp('[\u0621-\u064A]+', unicode: true)
        .hasMatch(text[text.length - 1])) {
      return TextDirection.rtl;
    }
  }
  return Directionality.of(context);
}

Future<PlatformFile?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    PlatformFile file = result.files.first;

    return file;
  }
  return null;
}
// extension DateOnlyCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//   }
// }
