import 'dart:convert';

import 'package:eco_drive/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Password extends StatefulWidget {
  final String token; // Receive token via constructor

  const Password({super.key, required this.token});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController passwordController = TextEditingController();
  String message = ''; // Feedback message

  void resetPassword() async {
    String newPassword = passwordController.text;

    // Validate password
    if (newPassword.isEmpty ||
        newPassword.length < 8 ||
        !RegExp(r'(?=.*\d)(?=.*[@$!%*?&])').hasMatch(newPassword)) {
      setState(() {
        message =
            'Password must be at least 8 characters long and include a number and a special character.';
      });
      return;
    }

    setState(() {
      message = 'Processing...';
    });

    var url = 'http://localhost:3000/reset-password/${widget.token}';
    var data = {'newPassword': newPassword};
    var body = json.encode(data);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        setState(() {
          message = responseData['message'] ?? 'Password reset successfully.';
        });

        // Navigate back to Signin screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signin()),
        );
      } else {
        var errorData = jsonDecode(response.body);
        setState(() {
          message = errorData['message'] ?? 'Failed to reset password.';
        });
      }
    } catch (e) {
      setState(() {
        message = 'An error occurred. Please try again.';
      });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ECO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "-DRIVE!!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Color(0xff00ACC1),
                    ),
                  ),
                ],
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
                  "Set New Password",
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
                  "Set Your New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text("Password:"),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your new password',
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
                  onPressed: resetPassword,
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
