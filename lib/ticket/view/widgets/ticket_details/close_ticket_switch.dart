import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/styles/colors.dart';

class CloseTicketSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CloseTicketSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  CloseTicketSwitchState createState() => CloseTicketSwitchState();
}

class CloseTicketSwitchState extends State<CloseTicketSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentGeometryTween(
            begin: widget.value
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            end: widget.value
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    widget.value
        ? _animationController.forward()
        : _animationController.reverse();
    // if (_animationController.isCompleted) {
    //   _animationController.reverse();
    // } else {
    //   _animationController.forward();
    // }
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 45.0.w,
            height: 24.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0.r),
              gradient:
                  _circleAnimation.value == AlignmentDirectional.centerStart
                      ? const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                              Color(0xffc1e2e7),
                              Color(0xff9daad0),
                            ])
                      : const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                              Color(0xff6fd3de),
                              Color(0xff486ac7),
                            ]),
            ),
            child: Align(
              alignment: _circleAnimation.value,
              child: Container(
                width: 24.0.w,
                height: 24.0.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          grey6,
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: black,
                          offset: Offset(0, 1.h),
                          blurRadius: 1.r,
                          spreadRadius: 2.r)
                    ],
                    shape: BoxShape.circle,
                    color: grey),
              ),
            ),
          ),
        );
      },
    );
  }
}
