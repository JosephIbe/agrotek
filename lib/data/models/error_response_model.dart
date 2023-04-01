class ErrorResponseModel {
  ErrorResponseModel({
    required this.code,
    required this.data,
    required this.msg,
    required this.status,
  });

  int code;
  Data data;
  String msg;
  bool status;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}