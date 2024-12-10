import 'dart:convert';
import 'package:eco_drive/pages/password.dart';
import 'package:eco_drive/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Emailpass extends StatefulWidget {
  const Emailpass({super.key});

  @override
  State<Emailpass> createState() => _EmailpassState();
}

class _EmailpassState extends State<Emailpass> {
  final TextEditingController emailController = TextEditingController();
  String message = ''; // Message to show server response or error

  void forgotPassword() async {
    String email = emailController.text;

    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      setState(() {
        message = 'Please enter a valid email address.';
      });
      return;
    }

    setState(() {
      message = 'Sending request...';
    });

    var url = 'https://task-4-2.onrender.com/schema/forgot-password';
    var data = {'email': email};
    var body = json.encode(data);

    try {
      print('Sending request to $url with body: $body');
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          var responseData = jsonDecode(response.body);
          setState(() {
            message = responseData['message'] ?? 'Email sent successfully.';
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Password(
                token: responseData['token'],
              ),
            ),
          );
        } catch (e) {
          setState(() {
            message = 'Invalid response from server.';
          });
          print('JSON decoding error: $e');
        }
      } else {
        try {
          var errorData = jsonDecode(response.body);
          setState(() {
            message = errorData['message'] ?? 'Failed to send email.';
          });
        } catch (e) {
          setState(() {
            message = 'Unexpected error from server.';
          });
          print('Error data decoding: $e');
        }
      }
    } catch (e) {
      setState(() {
        message = 'An error occurred: $e';
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
                child: Icon(Icons.arrow_back),
              ),
              Center(
                child: Text(
                  "LOGO",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "Share Rides, Save Costs",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6BCCD8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Verify Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Center(
                child: Text(
                  "Verify email for new password",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text("Email:"),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff00ACC1),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(0xff00ACC1),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              if (message.isNotEmpty)
                Center(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: message.contains('success')
                          ? Colors.green
                          : Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: forgotPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00ACC1),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'SAVE',
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
