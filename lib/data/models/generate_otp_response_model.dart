class GenerateOtpResponseModel {
  GenerateOtpResponseModel({
    required this.data,
  });

  Data data;

  factory GenerateOtpResponseModel.fromJson(Map<String, dynamic> json) => GenerateOtpResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.code,
    required this.count,
    required this.id,
    required this.insertedAt,
    required this.recipient,
    required this.status,
    required this.type,
    required this.updatedAt,
  });

  String code;
  int count;
  int id;
  DateTime insertedAt;
  String recipient;
  String status;
  String type;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    code: json["code"],
    count: json["count"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    recipient: json["recipient"],
    status: json["status"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "count": count,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "recipient": recipient,
    "status": status,
    "type": type,
    "updated_at": updatedAt.toIso8601String(),
  };
}