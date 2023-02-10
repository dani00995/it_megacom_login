class StatusModel {
  int? status;
  String? message;
  String? object;
  Null? externalId;


  StatusModel({this.status, this.message, this.object, this.externalId});

  StatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object = json['object'];
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['object'] = object;
    data['externalId'] = externalId;
    return data;
  }
}