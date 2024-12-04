import 'package:eco_drive/pages/signin.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  const Password({super.key});

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
                  "Share Rides,Save Costs",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Atleast 1 number and a special character",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                  Image.asset("images/Isolation_Mode.png"),
                ],
              ),
              SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
