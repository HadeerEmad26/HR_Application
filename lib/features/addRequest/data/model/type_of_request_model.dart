
class RequestItemModel {
  final int itemId;
  final String itemName;

  RequestItemModel({required this.itemId, required this.itemName});

  factory RequestItemModel.fromJson(Map<String, dynamic> json) {
    return RequestItemModel(
      itemId: json['itemId'],
      itemName: json['itemName'],
    );
  }
}
