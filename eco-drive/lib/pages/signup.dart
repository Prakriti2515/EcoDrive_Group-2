import 'dart:convert';
import 'package:eco_drive/pages/offer.dart';
import 'package:eco_drive/pages/otp.dart';
import 'package:eco_drive/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'user_provider.dart';

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

  String serverMessage = '';
  String passwordStrengthMessage = '';

  void evaluatePassword(String password) {
    setState(() {
      if (password.length < 8) {
        passwordStrengthMessage =
            "Password must be at least 8 characters long.";
      } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
        passwordStrengthMessage = "Include at least one uppercase letter.";
      } else if (!RegExp(r'[a-z]').hasMatch(password)) {
        passwordStrengthMessage = "Include at least one lowercase letter.";
      } else if (!RegExp(r'\d').hasMatch(password)) {
        passwordStrengthMessage = "Include at least one digit.";
      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
        passwordStrengthMessage = "Include at least one special character.";
      } else {
        passwordStrengthMessage = "Strong password!";
      }
    });
  }

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
                      if (value == null || value.trim().isEmpty) {
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
                    onChanged: (value) {
                      evaluatePassword(value);
                    },
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
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    passwordStrengthMessage,
                    style: TextStyle(
                      color: passwordStrengthMessage == "Strong password!"
                          ? Colors.green
                          : Colors.red,
                      fontSize: 14,
                    ),
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
    var url = 'https://task-4-2.onrender.com/schema/signup';
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
      print('Username: ${usernameController.text}');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Request Body: $body');
      print('Response: ${response.body}');
      var userId = responseData['userId'];

      if (serverMessage != null &&
          serverMessage.startsWith('Verification email sent')) {
        List<String> parts = serverMessage.split(' ');
        if (parts.length > 3) {
          userId = parts.last; // Extract userId
        }
      }
      if (response.statusCode == 202 && userId != null) {
        // Save user data to provider
        Provider.of<UserProvider>(context, listen: false).setUserInfo(
          usernameController.text,
          emailController.text,
        );
        // Navigate back to homepage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OTPPage(email: emailController.text, userId: userId),
          ),
        );
      } else {
        setState(() {
          serverMessage = responseData['message'] ??
              'Signup failed. Check required fields.';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        serverMessage = 'Error connecting to the server.';
      });
    }
  }
}

class ApiKeys {
  static const String apiKey = 'rnd_hSVPkfRmPt3zt7IwvhBsosr2noRN';
}
