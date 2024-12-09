import 'package:eco_drive/pages/help.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Color(0xff00ACC1),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images'),
              ),
              title: Text(
                'Tester Driver',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Color(0xff00ACC1),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('My Profile'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.description),
                      title: Text('Privacy Policy'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.thumb_up),
                      title: Text('Rate us'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Change Language'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: Color(0xff00ACC1),
            ),
            SizedBox(height: 40),
            ElevatedButton(
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
                'Log Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
