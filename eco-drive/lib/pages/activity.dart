import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool showUpcomingRides = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          color: showUpcomingRides ? Colors.black : Colors.grey,
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
                                      fontSize: 14, color: Color(0xff6BCCD8))),
                              Text('1 Seat', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Color(0xff6BCCD8),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 10,
                                    color: Color(0xff6BCCD8),
                                  ),
                                  Icon(Icons.location_pin,
                                      color: Color(0xff7C6DDD)),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ghaziabad',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Noida',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff6BCCD8),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('11:30 AM, 04 Dec 2024',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff6BCCD8))),
                                  Text('Audi A4 | Black',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff6BCCD8))),
                                ],
                              ),
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
    );
  }
}
