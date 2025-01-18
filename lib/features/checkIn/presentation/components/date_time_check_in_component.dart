
import 'package:flutter/material.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  _DateTimeScreenState createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  late String currentTime;
  late String currentDate;

  @override
  void initState() {
    super.initState();
    _updateDateTime(); // Initialize date and time
    _startClock(); // Start updating time every second
  }

  // Update date and time
  void _updateDateTime() {
    final now = DateTime.now();
    currentTime = DateFormat('hh : mm : a').format(now); // Format time
    currentDate = DateFormat('EEEE, MMMM d, yyyy').format(now); // Format date
  }

  // Update the time every second
  void _startClock() {
    Future.delayed(Duration.zero, () {
      _updateDateTime();
      setState(() {});
      Future.delayed(Duration(seconds: 1), _startClock);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Current Time
            Text(
              currentTime,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 16),
            // Current Date
            Text(
              currentDate,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}