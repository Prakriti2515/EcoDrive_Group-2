import 'dart:convert';
import 'package:eco_drive/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OTPPage extends StatefulWidget {
  final String email;
  final String userId; // Added userId

  const OTPPage({Key? key, required this.email, required this.userId})
      : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Debugging the email parameter
    print('Email passed to OTPPage: ${widget.email}');
  }

  void verifyOTP() async {
    String otp = otpController.text;

    if (otp.isEmpty || otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid 6-digit OTP")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    var url = 'https://task-4-2.onrender.com/schema/enter-otp/${widget.userId}';
    var data = {'otp': otp};
    var body = json.encode(data);
    var urlParse = Uri.parse(url);

    try {
      http.Response response = await http.post(
        urlParse,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var responseData = jsonDecode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200 &&
          responseData['message'] == "OTP Verified") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP Verified!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Invalid OTP')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error verifying OTP. Try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the OTP sent to ${widget.email}", // Display email
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your OTP', // Corrected hintText
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
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: verifyOTP,
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
                      "Verify OTP",
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
