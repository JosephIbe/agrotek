class ResolveBankResponseModel {
  ResolveBankResponseModel({
    required this.data,
  });

  Data data;

  factory ResolveBankResponseModel.fromJson(Map<String, dynamic> json) => ResolveBankResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.accountName,
    required this.accountNumber,
  });

  String accountName;
  String accountNumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountName: json["account_name"],
    accountNumber: json["account_number"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "account_number": accountNumber,
  };
}