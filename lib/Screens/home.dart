import 'package:SetLink/Screens/SetSearch/setsearch.dart';
import 'package:flutter/material.dart';
import 'package:SetLink/Screens/constants.dart';
import 'SetDisplay/setdisplay.dart';
import 'UserProfile/profilepage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navIndex == 0 ? SetDisplay() : ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kbackgroundColor,
        unselectedItemColor: Colors.black38,
        elevation: 10.0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: navIndex,
        selectedItemColor: kprimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: kprimaryColor,
        child: Icon(
          Icons.search,
          color: kinsidePrimaryColor,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SetSearch()));
        },
      ),
    );
  }
}
