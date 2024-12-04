import 'package:eco_drive/pages/book.dart';
import 'package:eco_drive/pages/signin.dart';
import 'package:eco_drive/pages/signup.dart';
import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC9E8EC),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 350, top: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Book()),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80),
            Image.asset("images/Car.png"),
            SizedBox(height: 60),
            Center(
              child: Text(
                "OFFER A RIDE",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 55.0, vertical: 20),
              child: Text(
                  "Driving somewhere? Publish your ride! Choose who goes with you and enjoy the least expensive ride you have ever made"),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00ACC1),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00ACC1),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
