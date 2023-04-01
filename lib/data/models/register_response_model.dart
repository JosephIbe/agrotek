class RegisterResponseModel {
  RegisterResponseModel({
    required this.data,
  });

  Data data;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.bvn,
    required this.email,
    required this.id,
    required this.isActive,
    required this.isBvnVerified,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.passwordHash,
    required this.phoneNumber,
    required this.role,
    required this.userRef,
  });

  dynamic bvn;
  String email;
  dynamic id;
  dynamic isActive;
  dynamic isBvnVerified;
  dynamic isEmailVerified;
  dynamic isPhoneVerified;
  String passwordHash;
  dynamic phoneNumber;
  String role;
  String userRef;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bvn: json["bvn"],
    email: json["email"],
    id: json["id"],
    isActive: json["is_active"],
    isBvnVerified: json["is_bvn_verified"],
    isEmailVerified: json["is_email_verified"],
    isPhoneVerified: json["is_phone_verified"],
    passwordHash: json["password_hash"],
    phoneNumber: json["phone_number"],
    role: json["role"],
    userRef: json["user_ref"],
  );

  Map<String, dynamic> toJson() => {
    "bvn": bvn,
    "email": email,
    "id": id,
    "is_active": isActive,
    "is_bvn_verified": isBvnVerified,
    "is_email_verified": isEmailVerified,
    "is_phone_verified": isPhoneVerified,
    "password_hash": passwordHash,
    "phone_number": phoneNumber,
    "role": role,
    "user_ref": userRef,
  };
}