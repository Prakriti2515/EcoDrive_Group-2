import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';

class Offerride extends StatefulWidget {
  const Offerride({super.key});

  @override
  State<Offerride> createState() => _OfferrideState();
}

class _OfferrideState extends State<Offerride> {
  int? _selectedSeats;
  int? _selectedPrice;
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
                  "Offer a ride",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Available seats",
                        style: TextStyle(
                          color: Color(0xff00ACC1),
                        ),
                      ),
                      DropdownButton<int>(
                        value: _selectedSeats,
                        hint: Text('Seats'),
                        items: List.generate(10, (index) {
                          int seatCount = index + 1;
                          return DropdownMenuItem<int>(
                            value: seatCount,
                            child: Text('$seatCount'),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            _selectedSeats = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Price per seats",
                        style: TextStyle(
                          color: Color(0xff00ACC1),
                        ),
                      ),
                      DropdownButton<int>(
                        value: _selectedPrice,
                        hint: Text('Press to select'),
                        items: List.generate(6, (index) {
                          int priceCount = (index + 1) * 50;
                          return DropdownMenuItem<int>(
                            value: priceCount,
                            child: Text('$priceCount'),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            _selectedPrice = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Color(0xff00ACC1),
              ),
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
                    'NEXT',
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
