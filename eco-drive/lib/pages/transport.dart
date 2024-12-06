import 'package:flutter/material.dart';

class Transport extends StatelessWidget {
  const Transport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25, right: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Signin()),
                // );
              },
              child: Icon(Icons.arrow_back),
            ),
            Center(
              child: Text(
                "Select Transport",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Select Your Transport",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Card(
                  color: Color(0xffC9E8EC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/Car1.png',
                        height: 150,
                        width: 170,
                      ),
                      Text(
                        'Car',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Color(0xffC9E8EC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/Bike.png',
                        height: 150,
                        width: 170,
                      ),
                      Text(
                        'Bike',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              children: [
                Card(
                  color: Color(0xffC9E8EC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/Scooty.png',
                        height: 150,
                        width: 170,
                      ),
                      Text(
                        'Scooty',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Color(0xffC9E8EC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/Scooter.png',
                        height: 150,
                        width: 170,
                      ),
                      Text(
                        'Scooter',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
