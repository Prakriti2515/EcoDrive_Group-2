import 'package:eco_drive/pages/findRide.dart';
import 'package:eco_drive/pages/offerRide.dart';
import 'package:flutter/material.dart';
import 'package:eco_drive/pages/activity.dart';
import 'package:eco_drive/pages/chat.dart';
import 'package:eco_drive/pages/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> vehicleList = [];

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomepageContent(addVehicleCallback: _addVehicle), // Pass _addVehicle here
      Activity(vehicleList: vehicleList),
      Chat(),
      Profile(),
    ]);
  }

  void _addVehicle(Map<String, dynamic> vehicle) {
    setState(() {
      vehicleList.add(vehicle);
      _pages[1] = Activity(vehicleList: vehicleList); // Update Activity
    });
  }

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
  final Function(Map<String, dynamic>) addVehicleCallback;

  const HomepageContent({Key? key, required this.addVehicleCallback})
      : super(key: key);

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Offerride(addVehicleCallback: addVehicleCallback),
                ),
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
