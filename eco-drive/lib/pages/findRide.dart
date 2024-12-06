import 'dart:math';

import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';

class Findride extends StatelessWidget {
  const Findride({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Text(
                  "Find a ride",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xff6BCCD8),
                      ),
                      Container(
                        width: 2,
                        height: 55,
                        color: Color(0xff6BCCD8),
                      ),
                      Icon(Icons.location_pin, color: Color(0xff7C6DDD)),
                    ],
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter pickup location',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff00ACC1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff00ACC1),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter drop location',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff00ACC1),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff00ACC1),
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Image.asset("images/calendar_today.png"),
                  SizedBox(width: 8),
                  Text(
                    "02 Dec 2024",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Spacer(),
                  Image.asset("images/Group.png"),
                  SizedBox(width: 8),
                  Text(
                    "01:00pm",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Divider(
                color: Color(0xff00ACC1),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.supervisor_account),
                  hintText: "Number of Passengers",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff00ACC1)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff00ACC1)),
                  ),
                ),
              ),
              SizedBox(height: 6),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
