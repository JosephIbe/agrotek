class BanksResponseModel {
  BanksResponseModel({
    required this.data,
  });

  List<Bank> data;

  factory BanksResponseModel.fromJson(Map<String, dynamic> json) => BanksResponseModel(
    data: List<Bank>.from(json["data"].map((x) => Bank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Bank {
  Bank({
    required this.code,
    required this.id,
    required this.name,
  });

  String code;
  int id;
  String name;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    code: json["code"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "id": id,
    "name": name,
  };

  @override
  bool operator ==(Object other) {
    return identical(this, other)
        || other.runtimeType == runtimeType
            && other is Bank
            && other.name == name
            && other.code == code
            && other.id == id;
  }
}