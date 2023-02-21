import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_appointment_app/constant/constant.dart';
import 'package:medical_appointment_app/constant/text_widget.dart';
import 'package:medical_appointment_app/screens/appintment_complete.dart';
import 'package:medical_appointment_app/screens/calling_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool animate = false;
  bool visible = false;
  bool doctorName = false;
  bool tapAppointment = false;
  bool getAppointment = false;

  double opacity = 0.1;
  double doctorWidth = 0;
  double doctorHeight = 0;
  double calenderWidth = 0;
  double appointmentW = 0;
  double appointmentH = 0;
  double medicineTimeW = 0;
  double height = 0.h;
  double listViewHeight = 0.h;
  double testH = 0.h;
  double medicineImageW = 0.h;
  double medicineImageH = 0.h;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      opacity = 1;
      height = 150.h;
      listViewHeight = 150.h;
      testH = 73.h;
    });
  }

  Future doctorProfileAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      doctorName = true;
      doctorWidth = 70.h;
      doctorHeight = 70.h;
      calenderWidth = 300.h;
      medicineTimeW = 115.w;
      medicineImageW = 45.h;
      medicineImageH = 45.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// profile list tile
              ListTile(
                leading: Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/images/girl_profile.jpg"), fit: BoxFit.cover)),
                ),
                horizontalTitleGap: 10.w,
                minLeadingWidth: 30.w,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
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
              SizedBox(height: 15.h),

              /// appointment title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomText(
                  'Upcoming appointment',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// doctor profile container
              SizedBox(
                height: /*getAppointment ?*/ 240.h /*: 190.h*/,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: height,
                      width: double.infinity,
                      onEnd: () async {
                        setState(() {
                          visible = true;
                          doctorProfileAnimation();
                        });
                        if (tapAppointment) {
                          if (!getAppointment) {
                            getAppointment = true;

                            appointmentH = 0.h;
                            appointmentW = 0.w;
                            await Future.delayed(const Duration(microseconds: 10));
                            appointmentH = 35.h;
                            appointmentW = 300.w;
                          }
                        }
                      },
                      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: visible == false
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                      width: 70.h,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: AnimatedContainer(
                                              duration: const Duration(seconds: 1),
                                              height: doctorHeight,
                                              width: doctorWidth,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.r),
                                                image:
                                                    const DecorationImage(image: AssetImage('assets/images/doctor_profile.jpg'), fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Stack(
                                      children: [
                                        // AnimatedOpacity(
                                        //   opacity: opacity,
                                        //   duration: const Duration(milliseconds: 800),
                                        //   curve: Curves.easeIn,
                                        //   child:
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            AnimatedOpacity(
                                              opacity: opacity,
                                              duration: const Duration(milliseconds: 800),
                                              curve: Curves.easeIn,
                                              child: CustomText(
                                                'Dr.Jonathan Bells',
                                                fontSize: 17.sp,
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                                        // ),
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (!getAppointment) {
                                        height = 200;
                                        tapAppointment = true;
                                      } else {
                                        getAppointment = false;
                                        height = 150;
                                        tapAppointment = false;
                                      }
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(seconds: 1),
                                    height: 35.h,
                                    width: calenderWidth,
                                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: getAppointment
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.electric_bolt, size: 20.sp, color: kWhiteColor),
                                              SizedBox(width: 7.w),
                                              CustomText("It's began! The doctor is waiting for you.",
                                                  color: kWhiteColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Icon(Icons.date_range, size: 20.sp, color: kWhiteColor),
                                              SizedBox(width: 3.w),
                                              CustomText('Today, September 2', color: kWhiteColor, fontSize: 11.sp, fontWeight: FontWeight.w300),
                                              const Spacer(),
                                              Icon(Icons.access_time_filled, size: 20.sp, color: kWhiteColor),
                                              SizedBox(width: 3.w),
                                              CustomText('10:00 - 11:00 AM', color: kWhiteColor, fontSize: 11.sp, fontWeight: FontWeight.w300),
                                            ],
                                          ),
                                  ),
                                ),
                                getAppointment
                                    ? Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                curve: Curves.easeInOut,
                                                type: PageTransitionType.scale,
                                                alignment: Alignment.center,
                                                duration: const Duration(milliseconds: 800),
                                                child: const CallingScreen(),
                                              ),
                                            );
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            height: appointmentH,
                                            width: appointmentW,
                                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                                            margin: EdgeInsets.only(top: 15.h),
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius: BorderRadius.circular(8.r),
                                            ),
                                            child: Center(
                                                child:
                                                    CustomText('Go to appointment', color: kLightBlue, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                    ),
                  ],
                ),
              ),

              /// medicine title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomText(
                  "Today's Medicines",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              /// medicine listview
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: SizedBox(
                  height: 150.h,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: listViewHeight,
                        child: ListView.builder(
                          itemCount: medicineList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              // duration: const Duration(seconds: 1),
                              height: listViewHeight,
                              width: 145.w,
                              margin: EdgeInsets.only(right: 15.w, left: index == 0 ? 15.w : 0),
                              padding: EdgeInsets.all(15.w),
                              decoration: BoxDecoration(
                                color: kLightGrey,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: visible == false
                                  ? const SizedBox()
                                  : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 45.h,
                                          child: Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Center(
                                                    child: AnimatedContainer(
                                                        duration: const Duration(seconds: 1),
                                                        height: medicineImageH,
                                                        width: medicineImageW,
                                                        alignment: Alignment.center,
                                                        padding: EdgeInsets.all(10.r),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8.r),
                                                          color: medicineList[index].color,
                                                        ),
                                                        child: Image.asset(
                                                          medicineList[index].image!,
                                                          color: kWhiteColor,
                                                          fit: BoxFit.fill,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 7.h),
                                        CustomText(
                                          medicineList[index].name!,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(height: 3.h),
                                        CustomText(medicineList[index].scheduleTime!, color: kGreyColor, fontSize: 13.sp),
                                        SizedBox(height: 12.h),
                                        AnimatedContainer(
                                          duration: const Duration(seconds: 1),
                                          height: 22.h,
                                          width: medicineTimeW,
                                          decoration: BoxDecoration(
                                            color: medicineList[index].time! != 'Taken' ? kOrange : kLightBlue,
                                            borderRadius: BorderRadius.circular(13.r),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CustomText(medicineList[index].time!, color: kWhiteColor, fontSize: 10.sp, fontWeight: FontWeight.w400),
                                              SizedBox(width: 3.w),
                                              Icon(medicineList[index].time! == 'Taken' ? Icons.download_done_outlined : Icons.access_time_filled,
                                                  size: 15.sp, color: kWhiteColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// medical test title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "Medical Test",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      "All",
                      fontSize: 16.sp,
                      color: kLightBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              /// medical test list
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      curve: Curves.easeInOut,
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 800),
                      child: const AppointmentCompleteScreen(),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: testH,
                  width: 330.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: kLightGrey,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: !visible
                      ? SizedBox()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 15.h,
                                  width: 15.h,
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.r),
                                    color: kLightRed,
                                    //     fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 7.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  'biochemical blood test',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    CustomText('Deviation', fontWeight: FontWeight.w500, color: kLightRed, fontSize: 13.sp),
                                    SizedBox(width: 5.w),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kLightRed,
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                                      child: Row(
                                        children: [
                                          Icon(Icons.arrow_upward, color: kWhiteColor, size: 12.sp),
                                          SizedBox(width: 3.w),
                                          CustomText(
                                            '35%',
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: kWhiteColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kGreyColor,
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Medicine> medicineList = [
    Medicine(name: 'Coldact', scheduleTime: '3 capsules/day', time: 'Taken', color: kLightGreen, image: 'assets/images/capsule.png'),
    Medicine(name: 'Ibuprofen', scheduleTime: '1 tablet/day', time: '02:00 PM', color: kLightRed, image: 'assets/images/tablets.png'),
    Medicine(name: 'Licorice root', scheduleTime: '2 spoons', time: '05:00 PM', color: kLightBlue, image: 'assets/images/syrup_botle.png'),
    Medicine(name: 'Coldact', scheduleTime: '3 capsules/day', time: '07:00 PM', color: kLightGreen, image: 'assets/images/capsule.png'),
    Medicine(name: 'Ibuprofen', scheduleTime: '2 tablet/day', time: 'Taken', color: kLightRed, image: 'assets/images/tablets.png'),
    Medicine(name: 'Licorice', scheduleTime: '1 spoons', time: '03:00 PM', color: kLightBlue, image: 'assets/images/syrup_botle.png'),
  ];
}

class Medicine {
  String? name;
  Color? color;
  String? image;
  String? time;
  String? scheduleTime;

  Medicine({this.name, this.color, this.scheduleTime, this.time, this.image});
}
