import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_appointment_app/constant/constant.dart';
import 'package:medical_appointment_app/screens/Home_screen.dart';

class BottomNavigationTab extends StatefulWidget {
  const BottomNavigationTab({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTab> createState() => _BottomNavigationTabState();
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  int currentIndex = 0;
  List screens = [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: false,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          itemCornerRadius: 10.r,
          iconSize: 22.sp,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(icon: const Icon(Icons.home), title: const Text('Home'), activeColor: kLightBlue),
            BottomNavyBarItem(icon: const Icon(Icons.grid_view_rounded), title: const Text('Category'), activeColor: kLightBlue),
            BottomNavyBarItem(icon: const Icon(Icons.favorite), title: const Text('Favorite'), activeColor: kLightBlue),
            BottomNavyBarItem(icon: const Icon(Icons.more_horiz), title: const Text('More'), activeColor: kLightBlue),
          ],
        ));
  }
}
