import 'dart:convert';

import 'package:eco_drive/pages/emailPass.dart';
import 'package:eco_drive/pages/homepage.dart';
import 'package:eco_drive/pages/offer.dart';
import 'package:eco_drive/pages/password.dart';
import 'package:eco_drive/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'user_provider.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Offer()),
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
                    "Share Rides,Save Costs",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6BCCD8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 40),
                Text("Email:"),
                TextField(
                  controller: email,
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
                SizedBox(height: 20),
                Text("Password:"),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Emailpass(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (errorMessage.isNotEmpty)
                  Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: signin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00ACC1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      minimumSize: Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black38,
                        thickness: 1.5,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Divider(
                        color: Colors.black38,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(300, 50),
                      side: BorderSide(color: Color(0xff00ACC1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/Google.png", height: 24),
                      SizedBox(width: 10),
                      Text("Sign up with Google"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(300, 50),
                      side: BorderSide(color: Color(0xff00ACC1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/Facebook.png", height: 24),
                      SizedBox(width: 10),
                      Text("Sign up with Facebook"),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signin() async {
    var url = 'https://task-4-2.onrender.com/schema/login';
    var data = {
      'email': email.text,
      'password': password.text,
    };
    var body = json.encode(data);
    var urlParse = Uri.parse(url);

    try {
      var response = await http.post(
        urlParse,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200 &&
          responseData['message'] == 'Login successful!') {
        // Retrieve stored username from UserProvider
        String username =
            Provider.of<UserProvider>(context, listen: false).username;

        print('Logged in user: $username'); // Print the username

        // Navigate to homepage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } else {
        setState(() {
          errorMessage = responseData['message'] ?? 'Login failed';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Network Error: $e';
      });
      print('Error during sign-in: $e');
    }
  }
}

class ApiKeys {
  static const String apiKey = 'rnd_hSVPkfRmPt3zt7IwvhBsosr2noRN';
}
