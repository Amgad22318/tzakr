// import 'dart:async';
//
// import 'package:advertisers/app_core/network/requests/GetAdvertisersCoponsRequest.dart';
// import 'package:advertisers/app_core/network/responses/CoponsResponse.dart';
// import 'package:advertisers/main.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:logger/logger.dart';
//
// class DiscountPageController extends GetxController {
//   var isOpend = false;
//   var position = -1;
//   RestClient? client;
//   Dio? dio;
//   List<CoponModelResponse>? coponsResponse;
//   String myToken = storage.read("token");
//   final PagingController<int, CoponModelResponse> pagingController = PagingController(firstPageKey: 1);
//
//   @override
//   Future<void> onInit() async {
//     dio = Dio();
//     client = RestClient(dio!);
//      pagingController.addPageRequestListener((pageKey) async {
//        await fetchPage(pageKey);
//      });
//     super.onInit();
//   }
//
//   void copyCoupon(String code){
//       Clipboard.setData(ClipboardData(text: code)).then((_){
//         Fluttertoast.showToast(
//             msg: " تم نسخ الكود $code",
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.BOTTOM,
//             fontSize: 16.0
//         );
//       });
//   }
//
//   Future<List<CoponModelResponse>> getCopons({int? pageKey}) async {
//     CoponsResponse response = await client!.getAppCopons(GetAdvertisersCoponsRequest(page: pageKey).toJson(),"Bearer " + myToken);
//     final completer = Completer<List<CoponModelResponse>>();
//     List<CoponModelResponse> notifications = [];
//     if(response.data!=null && response.data!.isNotEmpty) {
//       notifications = response.data!;
//     }
//     completer.complete(notifications);
//     return completer.future;
//   }
//
//   Future<void> fetchPage(int pageKey) async {
//     myToken = await storage.read("token");
//     try {
//       List<CoponModelResponse> newItems = await getCopons(pageKey: pageKey);
//       bool isLastPage = newItems.isEmpty;
//       if (isLastPage) {
//         pagingController.appendLastPage(newItems);
//       } else {
//         int nextPageKey = ++pageKey;
//         pagingController.appendPage(newItems, nextPageKey);
//       }
//     } catch (error) {
//       pagingController.error = error;
//     }
//   }
//
//   void changeStatus(bool isOpend,int position) {
//     this.isOpend = isOpend;
//     this.position = position;
//     update();
//   }
//
//   void likeCopon(int? id) {
//     client!.likeCopon(id!,"Bearer "+myToken).then((value) {
//       if(value.status==200){
//         Logger().i(value.data.toString());
//       }
//     });
//   }
//
//   void disLike(int? id) {
//     client!.dislikeCopon(id!,"Bearer "+myToken).then((value) {
//       if(value.status==200){
//         Logger().i(value.data.toString());
//       }
//     });
//   }
//
//   void useCopon(int? id) {
//     client!.useCopon(id!,"Bearer "+myToken).then((value) {
//       if(value.status==200){
//         Logger().i(value.data.toString());
//       }
//     });
//   }
// }