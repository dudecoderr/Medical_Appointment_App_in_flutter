import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_appointment_app/constant/constant.dart';
import 'package:medical_appointment_app/constant/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool animate = false;
  bool visible = false;
  bool doctorName = false;
  double doctorwidth = 0;
  double calenderWidth = 0;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  double height = 0.h;

  Future doctorProfileAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      doctorName = true;
      doctorwidth = 70.h;
      calenderWidth = 300.h;
    });
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      animate = true;
      height = 150.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                height: 35.h,
                width: 35.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/girl_profile.jpg"), fit: BoxFit.cover)),
              ),
              horizontalTitleGap: 10.w,
              minLeadingWidth: 30.w,
              contentPadding: EdgeInsets.zero,
              title: CustomText(
                "Anna Baker",
                fontWeight: FontWeight.w500,
                // color: kDarkBlue,
              ),
              trailing: Wrap(
                spacing: 10.w,
                children: <Widget>[
                  const Icon(
                    Icons.search,
                    color: kDarkBlue,
                  ), // icon-1
                  Stack(
                    children: [
                      Icon(Icons.notifications, color: kDarkBlue),
                      Positioned(top: 4.h, right: 4.w, child: CircleAvatar(radius: 3.r, backgroundColor: kLightBlue))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            CustomText(
              'Upcoming appointment',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: height,
              width: double.infinity,
              onEnd: () {
                setState(() {
                  visible = true;
                  doctorProfileAnimation();
                });
              },
              margin: EdgeInsets.symmetric(vertical: 20.h),
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: visible == false
                  ? const SizedBox()
                  : Container(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 70.h,
                                width: doctorwidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: const DecorationImage(image: AssetImage('assets/images/doctor_profile.jpg'), fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        'Dr.Jonathan Bells',
                                        fontSize: 17.sp,
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        'Therapist',
                                        fontSize: 14.sp,
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      SizedBox(height: 8.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star_rounded, color: Colors.amber, size: 12.sp),
                                            CustomText('4.8', fontSize: 10.sp, fontWeight: FontWeight.w600)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 27.h,
                                width: 27.h,
                                decoration: BoxDecoration(
                                  color: kWhiteColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Icon(Icons.more_horiz, size: 20.sp, color: kWhiteColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.w),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 35.h,
                            width: calenderWidth,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.date_range, size: 20.sp, color: kWhiteColor),
                                SizedBox(width: 3.w),
                                CustomText('Today, September 2', color: kWhiteColor, fontSize: 11.sp, fontWeight: FontWeight.w300),
                                Spacer(),
                                Icon(Icons.access_time_filled, size: 20.sp, color: kWhiteColor),
                                SizedBox(width: 3.w),
                                CustomText('10:00 - 11:00 AM', color: kWhiteColor, fontSize: 11.sp, fontWeight: FontWeight.w300),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            CustomText(
              "Today's Medicines",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150.h,
                    width: 130.h,
                    margin: EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: kLightGreen
                              // image: const DecorationImage(image: AssetImage('assets/images/doctor_profile.jpg'), fit: BoxFit.cover),
                              ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
