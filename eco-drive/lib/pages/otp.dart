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

    // Replace :userId with the actual userId from widget.userId
    var url = 'https://task-4-2.onrender.com/schema/enter-otp/${widget.userId}';
    var data = {'otp': otp}; // Passing only the OTP
    var body = json.encode(data);
    var urlParse = Uri.parse(url);

    try {
      http.Response response = await http.post(
        urlParse,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      var responseData = jsonDecode(response.body);

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200 && responseData['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP Verified!")),
        );

        // Navigate to the Home Page after OTP is verified
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
              "Enter the OTP sent to ${widget.email}",
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
                hintText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: verifyOTP,
                    child: Text("Verify OTP"),
                  ),
          ],
        ),
      ),
    );
  }
}
