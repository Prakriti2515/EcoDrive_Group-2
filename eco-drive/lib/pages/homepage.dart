import 'dart:convert';
import 'package:eco_drive/pages/activity.dart';
import 'package:eco_drive/pages/chat.dart';
import 'package:eco_drive/pages/findRide.dart';
import 'package:eco_drive/pages/offerRide.dart';
import 'package:eco_drive/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomepageContent(), // Placeholder for the homepage content
    Activity(),
    Chat(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: _pages[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.0),
            topRight: Radius.circular(14.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xffC9E8EC),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.refresh),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class HomepageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 380,
          decoration: BoxDecoration(
            color: Color(0xff00ACC1),
            image: DecorationImage(
              image: AssetImage("images/Isolation_Mode (1).png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
        ),
        SizedBox(height: 80),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Directly navigate to FindRide page when clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Findride()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff00ACC1),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              minimumSize: Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Find a Ride',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Directly navigate to OfferRide page when clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offerride()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff00ACC1),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              minimumSize: Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Offer a Ride',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
