class LeaveType {
  final int id;
  final String type;

  LeaveType({required this.id, required this.type});

  // Factory constructor to create a LeaveType from JSON data
  factory LeaveType.fromJson(Map<String, dynamic> json) {
    return LeaveType(
      id: json['id'],
      type: json['type'],
    );
  }
}
