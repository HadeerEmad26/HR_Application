import 'dart:convert'; // For JSON parsing
import 'package:http/http.dart' as http; // For HTTP requests
import '../model/leave_reasons_model.dart';

class LeaveTypeRepository {
  final String apiUrl;

  LeaveTypeRepository({required this.apiUrl});

  // Fetch the leave types from the API
  Future<List<LeaveType>> getLeaveTypes() async {
    try {
      final response = await http.get(
        Uri.parse("https://hrm.rqmmyat.com/erp/Leave/leave_type_api"),
      );

      if (response.statusCode == 200) {
        // If the server responds with a successful status code (200),
        // parse the JSON response into a list of LeaveType objects
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => LeaveType.fromJson(json)).toList();
      } else {
        // If the server does not respond with a 200, throw an error
        throw Exception('Failed to load leave types');
      }
    } catch (e) {
      // Handle any network or parsing error
      throw Exception('Failed to load leave types: $e');
    }
  }
}
