import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? sizeAnimation;
  Animation? colorAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    super.initState();
  }

  // ang (){
  //   sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.5)));
  //   colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: controller!, curve: Interval(0.5, 1.0)));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: sizeAnimation!.value,
              width: sizeAnimation!.value,
              color: colorAnimation!.value,
            ),
            ElevatedButton(
                onPressed: () {
                  sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.5)));
                  colorAnimation =
                      ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: controller!, curve: Interval(0.5, 1.0)));
                },
                child: Text("bfg"))
          ],
        ),
      ),
    );
  }
}
