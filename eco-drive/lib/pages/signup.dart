import 'dart:convert';
import 'package:eco_drive/pages/offer.dart';
import 'package:eco_drive/pages/otp.dart';
import 'package:eco_drive/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String serverMessage = ''; // State variable to store the server message

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
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
                  Center(
                    child: Text(
                      "LOGO",
                      style: TextStyle(fontSize: 30),
                    ),
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
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Email:"),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Username:"),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Password:"),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  if (serverMessage.isNotEmpty)
                    Center(
                      child: Text(
                        serverMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signup();
                        }
                      },
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
                        'SIGN UP',
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
                            MaterialPageRoute(builder: (context) => Signin()),
                          );
                        },
                        child: Text(
                          "SIGN IN",
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
      ),
    );
  }

  void signup() async {
    var url =
        'https://task-4-2.onrender.com/schema/signup/'; // Update as needed
    var data = {
      'name': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    var body = json.encode(data);
    var urlParse = Uri.parse(url);

    try {
      Response response = await http.post(
        urlParse,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiKeys.apiKey}',
        },
        body: body,
      );
      var responseData = jsonDecode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 && responseData['success'] == true) {
        // Extract userId from the response (assuming it's in the responseData)
        var userId = responseData[
            'userId']; // Make sure the key matches your backend response

        if (userId != null) {
          // Navigate to OTP Page with the email and userId
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OTPPage(email: emailController.text, userId: userId),
            ),
          );
        } else {
          setState(() {
            serverMessage = 'No user ID returned. Signup failed.';
          });
        }
      } else {
        setState(() {
          serverMessage =
              responseData['message'] ?? 'Signup failed. Try again.';
        });
      }
    } catch (e) {
      setState(() {
        serverMessage = 'Error connecting to the server.';
      });
    }
  }
}

class ApiKeys {
  static const String apiKey = 'rnd_hSVPkfRmPt3zt7IwvhBsosr2noRN';
}
