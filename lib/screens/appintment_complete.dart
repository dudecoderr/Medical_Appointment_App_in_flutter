import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_appointment_app/constant/constant.dart';
import 'package:medical_appointment_app/constant/text_widget.dart';

class AppointmentCompleteScreen extends StatefulWidget {
  const AppointmentCompleteScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentCompleteScreen> createState() => _AppointmentConpleteScreenState();
}

class _AppointmentConpleteScreenState extends State<AppointmentCompleteScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  bool isComplete = false;
  bool animate = false;

  double opacity = 0.2;
  double buttonW = 0;
  double buttonH = 0;

  buttonOpacity() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      opacity = 1;
    });
  }

  startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      buttonW = 330.w;
      buttonH = 50.h;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    // _controller!.duration = _controller!.duration!.forward();
    // _controller!.addListener(() {
    // if (_controller!.isCompleted) {
    //   _controller!.stop();
    // }
    // });
    buttonOpacity();
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object  111 ${isComplete}");
    return Scaffold(
      backgroundColor: kLightBlue,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    margin: EdgeInsets.only(top: 90.h, bottom: 20.h),
                    decoration: BoxDecoration(
                      color: kLightGreen,
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Lottie.asset(
                      'assets/lottie/completed.json',
                      // controller: _controller,
                      // onLoaded: (composition) {
                      //   _controller!
                      //     ..duration = composition.duration
                      //     ..stop();
                      // },
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  child: CustomText(
                    "The appointment \nis completed",
                    fontSize: 33.sp,
                    // fontWeight: FontWeight.w00,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(height: 30.h),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  child: CustomText(
                    "Recommendations and referrals :",
                    fontSize: 18.sp,
                    // fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Spacer(),

                /// ok button
                Center(
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: buttonH,
                      width: buttonW,
                      margin: EdgeInsets.only(top: 90.h, bottom: 30.h),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: CustomText(
                          'Ok, thanks',
                          fontSize: 16.sp,
                          color: kLightBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            top: 320.h,
            right: animate ? 15.w : -330.w,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 65.h,
              width: 330.h,
              margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: kWhiteColor,
                      //     fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.event_note_rounded,
                        size: 25.sp,
                        color: kLightBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        'Protocol',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: kWhiteColor,
                      ),
                      // SizedBox(height: 5.h),
                      CustomText(
                        'diagnostic consultation',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: kWhiteColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            top: 400.h,
            right: animate ? 15.w : -330.w,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 65.h,
              width: 330.h,
              margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: kWhiteColor,
                      //     fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.edit_calendar_sharp,
                        size: 25.sp,
                        color: kLightBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        'Referral',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: kWhiteColor,
                      ),
                      // SizedBox(height: 5.h),
                      CustomText(
                        'ultrasound examination',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: kWhiteColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            top: 480.h,
            right: animate ? 15.w : -330.w,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 50.h,
              width: 330.h,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    'Other recommendations',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: kWhiteColor,
                  ),
                  // SizedBox(height: 5.h),

                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: kWhiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
