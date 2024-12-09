import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the homepage when back is pressed
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Homepage()), // Make sure to import the correct homepage
          (route) => false, // Remove all previous routes
        );
        return Future.value(false); // Prevent the default back action
      },
      child: Scaffold(
        body: Center(
          child: Text("Chats"),
        ),
      ),
    );
  }
}
