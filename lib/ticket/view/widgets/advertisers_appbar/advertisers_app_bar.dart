import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  // final double? my_height;
  final TextEditingController? controller;
  final bool? isBack,
      isSearchBar,
      isSideMenu,
      isFilter,
      isNotification,
      searchBarBigLeft,
      searchBarBigRight,
      isNotificationCenter;
  final VoidCallback? backPressed,
      searchPressed,
      filterPressed,
      sideMenuPresses,
      notificationPresses;
  final void Function(String text)? onChangeTextField;
  final String? searchHint;
  final Widget? widgetInsteadSearchBar;

  const AppBarWidget({
    Key? key,
    this.controller,
    this.onChangeTextField,
    // this.my_height,
    this.widgetInsteadSearchBar,
    this.isBack = true,
    this.searchBarBigLeft = true,
    this.searchBarBigRight = false,
    this.isSearchBar = false,
    this.isSideMenu = false,
    this.isFilter = true,
    this.isNotification = false,
    this.backPressed,
    this.filterPressed,
    this.searchHint,
    this.searchPressed,
    this.sideMenuPresses,
    this.notificationPresses,
    this.isNotificationCenter,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(90.r);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.r,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 17.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isSideMenu == true)
                Row(
                  children: [
                    InkWell(
                      onTap: sideMenuPresses,
                      child: Image.asset(
                        "images/Nav.png",
                        height: 35.6, width: 32.w,
                        // color: AppStyle.blueTextButton,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              widgetInsteadSearchBar ?? Container(),
              if (isSearchBar == true)
                Expanded(
                  child: SizedBox(
                    height: 34.h,
                    child: Row(
                      children: [
                        if (searchBarBigRight == false)
                          Container(
                            width: 50,
                          ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: TextFormField(
                              controller: controller,
                              onChanged: onChangeTextField,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(fontSize: 15.sp, height: 1.3),
                              // textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                                hintText: searchHint,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: searchPressed,
                                    child: SvgPicture.asset(
                                      "assets/svg/bx-search-alt.svg",
                                      height: 20.81,
                                    ),
                                  ),
                                ),
                                suffixIcon: isFilter == true
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: filterPressed,
                                          child: SvgPicture.asset(
                                            "assets/svg/filter.svg",
                                            height: 17,
                                          ),
                                        ),
                                      )
                                    : Container(),
                                filled: true,
                                fillColor: Colors.white.withOpacity(.9),
                                hintStyle: TextStyle(
                                    color: const Color(
                                      0xffA5A5A5,
                                    ),
                                    fontSize: 15.sp),
                              ),
                            ),
                          ),
                        ),
                        if (searchBarBigLeft == false)
                          Container(
                            width: 50,
                          ),
                      ],
                    ),
                  ),
                ),
              if (isNotificationCenter == true)
                Center(
                  child: InkWell(
                    /// To Do side menu on pressed
                    onTap: sideMenuPresses,
                    child: Container(
                      width: 100,
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        "images/my notification.svg",
                        height: 55.6, width: 52.w,
                        // color: AppStyle.blueTextButton,
                      ),
                    ),
                  ),
                ),
              if (isNotification == false)
                if (isBack == true)
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          backPressed != null
                              ? backPressed!()
                              :  Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svg/back-opacity.svg',
                          // matchTextDirection: true,
                          height: 40, fit: BoxFit.fitHeight,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              if (isBack == false)
                if (isNotification == true)
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: notificationPresses,
                        child: SvgPicture.asset(
                          "images/appBarNotifiactions.svg",
                          // matchTextDirection: true,
                          // height: 50,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
