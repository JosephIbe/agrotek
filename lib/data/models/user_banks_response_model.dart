class UserBanksResponseModel {
  UserBanksResponseModel({
    required this.data,
    required this.firstPage,
    required this.hasNext,
    required this.hasPrev,
    required this.nextPage,
    required this.page,
    required this.prevPage,
  });

  List<UserBanks> data;
  int firstPage;
  bool hasNext;
  bool hasPrev;
  int nextPage;
  int page;
  int prevPage;

  factory UserBanksResponseModel.fromJson(Map<String, dynamic> json) => UserBanksResponseModel(
    data: List<UserBanks>.from(json["data"].map((x) => UserBanks.fromJson(x))),
    firstPage: json["first_page"],
    hasNext: json["has_next"],
    hasPrev: json["has_prev"],
    nextPage: json["next_page"],
    page: json["page"],
    prevPage: json["prev_page"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page": firstPage,
    "has_next": hasNext,
    "has_prev": hasPrev,
    "next_page": nextPage,
    "page": page,
    "prev_page": prevPage,
  };
}

class UserBanks {
  UserBanks({
    required this.accountName,
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
    required this.id,
    required this.metadata,
    required this.userId,
  });

  String accountName;
  String accountNumber;
  String bankCode;
  String bankName;
  int id;
  Metadata metadata;
  int userId;

  factory UserBanks.fromJson(Map<String, dynamic> json) => UserBanks(
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    bankCode: json["bank_code"],
    bankName: json["bank_name"],
    id: json["id"],
    metadata: Metadata.fromJson(json["metadata"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "account_number": accountNumber,
    "bank_code": bankCode,
    "bank_name": bankName,
    "id": id,
    "metadata": metadata.toJson(),
    "user_id": userId,
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}