import 'dart:convert';
import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Offerride extends StatefulWidget {
  const Offerride(
      {super.key, required Null Function(dynamic vehicle) addVehicleCallback});

  @override
  _OfferrideState createState() => _OfferrideState();
}

class _OfferrideState extends State<Offerride> {
  int? _selectedSeats;
  int? _selectedPrice;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();

  // Success message display
  String successMessage = '';
  bool isLoading = false; // Added a variable to show a loading indicator

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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

  // Function to send the POST request
  Future<void> listVehicle() async {
    setState(() {
      isLoading = true; // Start loading
    });

    String fromLocation = pickupController.text;
    String toLocation = dropController.text;
    String travelDate =
        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    String travelTime = "${selectedTime.hour}:${selectedTime.minute}";
    String availableSeats = _selectedSeats.toString();

    var url = Uri.parse(
        'https://task-4-2.onrender.com/list_vehicle/6756bc7ea9b007bb21ac2f98');
    var data = {
      'from': fromLocation,
      'to': toLocation,
      'travelDate': travelDate,
      'travelTime': travelTime,
      'availableSeats': availableSeats,
    };
    var body = json.encode(data);

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      print("Response Status: ${response.statusCode}");
      print(
          "Response Body: ${response.body}"); // Log the response body for debugging

      setState(() {
        isLoading = false; // Stop loading
      });

      if (response.statusCode == 200) {
        // Parse the response
        var responseData = json.decode(response.body);
        String message = responseData['message'];

        setState(() {
          successMessage = message; // Set the success message from the server
          // Clear the text fields
          pickupController.clear();
          dropController.clear();
          _selectedSeats = null;
          _selectedPrice = null;
        });
      } else {
        // Handle failure
        setState(() {
          successMessage = 'Failed to list vehicle. Please try again later.';
        });
        print('Failed to list vehicle: ${response.body}');
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading
        successMessage = 'Network Error: $e';
      });
      print('Network Error: $e');
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
                  onPressed: isLoading ? null : () => listVehicle(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00ACC1),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                ),
              ),
              // Display success message
              if (successMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    successMessage,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
