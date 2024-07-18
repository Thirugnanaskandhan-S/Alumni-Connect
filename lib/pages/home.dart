import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/profile/profilepage.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [const SearchPage(), const MyProfile()];
  int currentindex = 0;
  void ontap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        onTap: ontap,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}
