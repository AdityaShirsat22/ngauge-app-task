import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:n_gauge_apptask/Controller/authController.dart';
import 'package:pinput/pinput.dart';

class LoginCodeScreen extends StatefulWidget {
  final String email;

  const LoginCodeScreen({super.key, this.email = ''});

  @override
  State<LoginCodeScreen> createState() => _LoginCodeScreenState();
}

class _LoginCodeScreenState extends State<LoginCodeScreen> {
  var orange = Color.fromARGB(255, 255, 109, 24);
  final TextEditingController _controller = TextEditingController();

  void _verifyCode() {
    final code = _controller.text.trim();

    if (code.isEmpty || code.length < 6) {
      Get.snackbar(
        'Oops',
        'Enter the 6 digit code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    if (code != '123456') {
      Get.snackbar(
        'Error',
        'Login code wrong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    final authController = Get.find<AuthController>();
    authController.setLoggedInUser('exhibitor');

    Get.offAllNamed('/exhibitorHome');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maskedEmail = (widget.email.isEmpty)
        ? 'su*************com'
        : widget.email;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed('/home');
          },
          icon: Icon(Icons.home),
        ),
        //title: const Text('Enter Login Code'),
        backgroundColor: orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              'Enter Login Code',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'your login code has been emailed you',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              maskedEmail,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue[800],
                //fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            Pinput(
              length: 6,
              controller: _controller,
              defaultPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: const TextStyle(
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: const TextStyle(
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: const TextStyle(
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400),
                ),
              ),
              keyboardType: TextInputType.number,
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                setState(() {});
              },
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Get.snackbar(
                    'Resend',
                    'A new code has been sent to your email',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.black87,
                    colorText: Colors.white,
                    margin: const EdgeInsets.all(16),
                  );
                },
                child: const Text(
                  'Resend',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: _verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
