import 'package:flutter/material.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:intl/intl.dart';

class RequestItem extends StatelessWidget {
  final Map<String, dynamic> request;

  const RequestItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: AppColors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${DateFormat('yyyy-MM-dd').format(request['selectedDate'])}',
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text('Start Time: ${request['startTime']}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),

            ),
            Text(
              'End Time: ${request['endTime']}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text('Reason: ${request['reason']}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text('Note: ${request['note']}',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}