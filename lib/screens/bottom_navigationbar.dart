import 'package:flutter/material.dart';

class BottomNavigationTab extends StatefulWidget {
  const BottomNavigationTab({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTab> createState() => _BottomNavigationTabState();
}

class _BottomNavigationTabState extends State<BottomNavigationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const []),
    );
  }
}
