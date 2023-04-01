class AcceptOfferResponseModel {
  AcceptOfferResponseModel({
    required this.data,
  });

  Data data;

  factory AcceptOfferResponseModel.fromJson(Map<String, dynamic> json) => AcceptOfferResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.amount,
    required this.id,
    required this.insertedAt,
    required this.isAccepted,
    required this.metadata,
    required this.status,
    required this.updatedAt,
    required this.walletId,
  });

  String amount;
  int id;
  DateTime insertedAt;
  bool isAccepted;
  Metadata metadata;
  String status;
  DateTime updatedAt;
  String walletId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    amount: json["amount"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isAccepted: json["is_accepted"],
    metadata: Metadata.fromJson(json["metadata"]),
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    walletId: json["wallet_id"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "is_accepted": isAccepted,
    "metadata": metadata.toJson(),
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "wallet_id": walletId,
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}