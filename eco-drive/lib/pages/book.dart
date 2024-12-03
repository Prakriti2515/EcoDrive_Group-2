import 'package:eco_drive/pages/homepage.dart';
import 'package:eco_drive/pages/signin.dart';
import 'package:eco_drive/pages/signup.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});

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
                    MaterialPageRoute(builder: (context) => Homepage()),
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
            SizedBox(height: 30),
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 50,
                      left: 225,
                      child: Image.asset("images/person.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Image.asset("images/phone.png"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 90),
            Center(
              child: Text(
                "BOOK A RIDE",
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
                  "Going somewhere? Carpooling is the way to go! Book low cost sharing rides & travel with people going your way"),
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
                  borderRadius: BorderRadius.circular(8),
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
                  borderRadius: BorderRadius.circular(8),
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
