import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_appointment_app/constant/text_widget.dart';

import '../constant/constant.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 4.h,
                decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.5),
                  border: Border.all(color: kLightBlue, width: 4.r),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 4.h,
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 50.h,
            left: 20.w,
            // right: 100.w,
            child: Container(
              height: 30.h,
              width: 80.w,
              decoration: BoxDecoration(color: kLightGrey, borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 5.r, backgroundColor: kLightRed),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText('00:15', fontSize: 15.sp, fontWeight: FontWeight.w400)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70.h,
            left: 100.w,
            right: 100.w,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: kWhiteColor,
                ),
                CircleAvatar(
                  backgroundColor: kWhiteColor,
                ),
                CircleAvatar(
                  backgroundColor: kWhiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
