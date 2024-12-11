import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Findride extends StatefulWidget {
  const Findride({super.key});

  @override
  State<Findride> createState() => _FindrideState();
}

class _FindrideState extends State<Findride> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController passengersController = TextEditingController();
  bool isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(), // Only allow today or future dates
      lastDate: DateTime(2101), // Define an upper limit for date selection
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // Function to perform the search request
  Future<void> _searchRide() async {
    print("Search Ride Function Called!"); // Debug message

    setState(() {
      isLoading = true;
    });

    String url = 'https://task-4-2.onrender.com/search';
    Map<String, String> requestBody = {
      'from': pickupController.text,
      'to': dropController.text,
      'travelDate': "${selectedDate.toLocal()}".split(' ')[0],
      'travelTime': selectedTime.format(context),
    };

    try {
      print('Sending request to $url with body: $requestBody');

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        print('Response Status: ${response.statusCode}');
        print('Response Body: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
        print('Error Body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                          controller: pickupController,
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
                          controller: dropController,
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
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Row(
                  children: [
                    Image.asset("images/calendar_today.png"),
                    SizedBox(width: 8),
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Row(
                        children: [
                          Image.asset("images/Group.png"),
                          SizedBox(width: 8),
                          Text(
                            "${selectedTime.format(context)}",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Divider(
                color: Color(0xff00ACC1),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passengersController,
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
                  onPressed: isLoading ? null : _searchRide,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00ACC1),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
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
