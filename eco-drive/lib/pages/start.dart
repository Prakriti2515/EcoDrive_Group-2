import 'package:eco_drive/pages/offer.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffC9E8EC),
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "WELCOME TO",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "ECO-DRIVE!!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  color: Color(0xff00ACC1),
                ),
              ),
              SizedBox(height: 100),
              Image.asset(
                "images/Character_1.png",
                width: 320.0,
              ),
              SizedBox(height: 40),
              Text(
                "Travel Safe With Us",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "We Will Take You!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Offer()),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
