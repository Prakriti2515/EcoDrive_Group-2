// activity.dart

import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  final String fromLocation;
  final String toLocation;
  final String travelDate;
  final String travelTime;
  final int? availableSeats;
  final List<Map<String, dynamic>> vehicleList;

  const Activity({
    super.key,
    required this.fromLocation,
    required this.toLocation,
    required this.travelDate,
    required this.travelTime,
    required this.availableSeats,
    required this.vehicleList,
  });

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool showUpcomingRides = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
            (route) => false,
          );
          return Future.value(false);
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 18, right: 18),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffA9E9F1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showUpcomingRides = true;
                          });
                        },
                        child: Text(
                          "Upcoming Rides",
                          style: TextStyle(
                            color:
                                showUpcomingRides ? Colors.black : Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showUpcomingRides = false;
                          });
                        },
                        child: Text(
                          "Ride History",
                          style: TextStyle(
                            color:
                                !showUpcomingRides ? Colors.black : Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                if (showUpcomingRides)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff6BCCD8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images'),
                            ),
                            title: Text(
                              'Tester Driver',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                              ),
                            ),
                            trailing: Column(
                              children: [
                                Text('\$500',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff6BCCD8))),
                                Text('${widget.availableSeats} Seat(s)',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Center(
                    child: Text(
                      "No ride history available.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
