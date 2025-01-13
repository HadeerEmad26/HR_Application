class AddRequestModel {
  final int? id;
  final String reason;
  final String startTime;
  final String endTime;
  final String date;

  AddRequestModel({
    this.id,
    required this.date,
    required this.reason,
    required this.startTime,
    required this.endTime,
  });
  factory AddRequestModel.fromJson(Map<String, dynamic> jsonData) {
    return AddRequestModel(
      id:jsonData['id'],
      date: jsonData['date'],
      reason: jsonData['title'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
    );
  }
}