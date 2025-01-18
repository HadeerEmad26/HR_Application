import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  _FingerPrintState createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticated = false;

  Future<void> authenticate() async {
    try {
      final bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to check in or out',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      setState(() {
        isAuthenticated = authenticated;
      });
    } catch (e) {
      setState(() {
        isAuthenticated = false;
      });
      print("Authentication error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: authenticate,
              child: Icon(
                Icons.fingerprint,
                size: 120,
                color: isAuthenticated ? Colors.green : Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              isAuthenticated ? 'Check-in Successful' : 'Tap to Check_in',
              style: TextStyle(
                fontSize: 17,
                color: isAuthenticated ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}