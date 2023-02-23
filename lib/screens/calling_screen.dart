import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_appointment_app/constant/text_widget.dart';
import 'package:medical_appointment_app/screens/appintment_complete.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../constant/constant.dart';

List<CameraDescription>? cameras;

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  VideoPlayerController? controller;
  CameraController? cameraCtrl;
  late Timer timer;
  Duration duration = const Duration();
  Duration countdownDuration = const Duration();

  double opacity = 0.0;
  String seconds = '0';
  String minutes = '0';
  String hours = '0';
  var time;

  @override
  void initState() {
    startCall();
    super.initState();
  }

  @override
  void dispose() {
    cameraCtrl!.dispose();
    timer.cancel();
    super.dispose();
  }

  Future startCall() async {
    if (await Permission.microphone.request().isGranted && await Permission.camera.request().isGranted) {
      controller = VideoPlayerController.asset('assets/video/doctor_video.mp4')
        ..initialize()
        ..setLooping(true)
        ..play();

      cameraCtrl = CameraController(cameras![1], ResolutionPreset.high);
      cameraCtrl!.initialize().then((_) {
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              break;
            default:
              break;
          }
        }
      });

      startTimer();
      animationOpacity();
    }
  }

  animationOpacity() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      opacity = 1;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  Future<void> addTime() async {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    hours = twoDigits(duration.inHours);
    minutes = twoDigits(duration.inMinutes.remainder(60));
    seconds = twoDigits(duration.inSeconds.remainder(60));
    time = '$hours:$minutes:$seconds';
    return CustomText('$minutes:$seconds', fontSize: 15.sp, fontWeight: FontWeight.w400);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 3.h,
                decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.5),
                  border: Border.all(color: kLightBlue, width: 3.r),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
                child: controller != null
                    ?
                    // ? AspectRatio(
                    //     aspectRatio: controller!.value.aspectRatio,
                    //     child:
                    VideoPlayer(controller!)
                    // )
                    : const SizedBox(),
              ),
              SizedBox(height: 6.h),
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 3.h,
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                ),
                child: cameraCtrl != null
                    ? AspectRatio(aspectRatio: MediaQuery.of(context).size.height / 2, child: CameraPreview(cameraCtrl!))
                    : const SizedBox(),
              ),
            ],
          ),
          Positioned(
            top: 50.h,
            left: 15.w,
            // right: 100.w,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              child: Container(
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(color: kLightGrey, borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 5.r, backgroundColor: kLightRed),
                    SizedBox(width: 8.w),
                    buildTime(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 2.36),
            left: 15.w,
            // right: 100.w,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: kLightBlue,
                child: Lottie.asset('assets/lottie/calling.json'),
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 80.w,
            left: 80.w,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: kWhiteColor,
                    child: Icon(Icons.videocam_off, color: kDarkGrey, size: 22.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          curve: Curves.easeInOut,
                          type: PageTransitionType.scale,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 800),
                          child: const AppointmentCompleteScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 26.r,
                      backgroundColor: kLightRed,
                      child: Icon(Icons.call_end_rounded, color: kWhiteColor, size: 20.sp),
                    ),
                  ),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: kWhiteColor,
                    child: Icon(
                      Icons.mic_off_rounded,
                      color: kDarkGrey,
                      size: 22.sp,
                    ),
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
