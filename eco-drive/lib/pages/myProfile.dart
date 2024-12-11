import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart'; // Import your UserProvider

class MyProfile extends StatefulWidget {
  const MyProfile({super.key, required String email, required String username});

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // Create TextEditingControllers for Phone Number and Profession
  TextEditingController phoneController = TextEditingController();
  TextEditingController professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Load initial data from the UserProvider if available
    phoneController.text = Provider.of<UserProvider>(context).phone ?? '';
    professionController.text =
        Provider.of<UserProvider>(context).profession ?? '';

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                color: Color(0xff00ACC1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Go back to home page
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 100),
                            Text(
                              "My Profile",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('images/Image.png'),
                        ),
                        title: Consumer<UserProvider>(
                          builder: (context, userProvider, child) {
                            return Text(
                              userProvider.username, // Display username here
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            );
                          },
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffC9E8EC),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                height: 500, // Increased height for Save button
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Info",
                        style:
                            TextStyle(fontSize: 26, color: Color(0xff00ACC1)),
                      ),
                      SizedBox(height: 20),
                      Text("Phone Number"),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: '+91',
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
                      SizedBox(height: 16.0),
                      Text("Email Address"),
                      Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                          return Text(
                            userProvider.email, // Display email here
                            style: TextStyle(fontSize: 18),
                          );
                        },
                      ),
                      SizedBox(height: 16.0),
                      Text("Profession"),
                      TextField(
                        controller: professionController,
                        decoration: InputDecoration(
                          hintText: 'Driver',
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
                      SizedBox(height: 16.0),
                      // Save Button
                      ElevatedButton(
                        onPressed: () {
                          // Save the updated data
                          String updatedPhone = phoneController.text;
                          String updatedProfession = professionController.text;

                          Provider.of<UserProvider>(context, listen: false)
                              .updateUserInfo(updatedPhone, updatedProfession);

                          // Show a snackbar confirmation
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Profile updated successfully!")),
                          );
                        },
                        child: Text("Save"),
                        style: ElevatedButton.styleFrom(
                          iconColor: Color(0xff00ACC1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
