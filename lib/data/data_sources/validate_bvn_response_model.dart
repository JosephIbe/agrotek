class ValidateBvnResponseModel {
  ValidateBvnResponseModel({
    required this.data,
  });

  Data data;

  factory ValidateBvnResponseModel.fromJson(Map<String, dynamic> json) => ValidateBvnResponseModel(
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
    required this.isPasswordSet,
    required this.isPhoneVerified,
    required this.isSetupComplete,
    required this.passwordHash,
    required this.phoneNumber,
    required this.role,
    required this.userRef,
    required this.userProfile,
  });

  String bvn;
  String email;
  int id;
  bool isActive;
  bool isBvnVerified;
  bool isEmailVerified;
  bool isPasswordSet;
  bool isPhoneVerified;
  bool isSetupComplete;
  String passwordHash;
  String phoneNumber;
  String role;
  String userRef;
  UserProfile userProfile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bvn: json["bvn"],
    email: json["email"],
    id: json["id"],
    isActive: json["is_active"],
    isBvnVerified: json["is_bvn_verified"],
    isEmailVerified: json["is_email_verified"],
    isPasswordSet: json["is_password_set"],
    isPhoneVerified: json["is_phone_verified"],
    isSetupComplete: json["is_setup_complete"],
    passwordHash: json["password_hash"],
    phoneNumber: json["phone_number"],
    role: json["role"],
    userRef: json["user_ref"],
    userProfile: UserProfile.fromJson(json["user_profile"]),
  );

  Map<String, dynamic> toJson() => {
    "bvn": bvn,
    "email": email,
    "id": id,
    "is_active": isActive,
    "is_bvn_verified": isBvnVerified,
    "is_email_verified": isEmailVerified,
    "is_password_set": isPasswordSet,
    "is_phone_verified": isPhoneVerified,
    "is_setup_complete": isSetupComplete,
    "password_hash": passwordHash,
    "phone_number": phoneNumber,
    "role": role,
    "user_ref": userRef,
    "user_profile": userProfile.toJson(),
  };
}

class UserProfile {
  UserProfile({
    required this.address,
    required this.bio,
    required this.continent,
    required this.country,
    required this.firstName,
    required this.gender,
    required this.id,
    required this.lastName,
    required this.metadata,
    required this.otherNames,
    required this.photo,
    required this.province,
    required this.userId,
  });

  dynamic address;
  dynamic bio;
  dynamic continent;
  dynamic country;
  String firstName;
  dynamic gender;
  int id;
  String lastName;
  Metadata metadata;
  dynamic otherNames;
  dynamic photo;
  dynamic province;
  int userId;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    address: json["address"],
    bio: json["bio"],
    continent: json["continent"],
    country: json["country"],
    firstName: json["first_name"],
    gender: json["gender"],
    id: json["id"],
    lastName: json["last_name"],
    metadata: Metadata.fromJson(json["metadata"]),
    otherNames: json["other_names"],
    photo: json["photo"],
    province: json["province"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "bio": bio,
    "continent": continent,
    "country": country,
    "first_name": firstName,
    "gender": gender,
    "id": id,
    "last_name": lastName,
    "metadata": metadata.toJson(),
    "other_names": otherNames,
    "photo": photo,
    "province": province,
    "user_id": userId,
  };
}

class Metadata {
  Metadata({
    required this.bvnData,
  });

  BvnData bvnData;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    bvnData: BvnData.fromJson(json["bvn_data"]),
  );

  Map<String, dynamic> toJson() => {
    "bvn_data": bvnData.toJson(),
  };
}

class BvnData {
  BvnData({
    required this.dateOfBirth,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.nationality,
    required this.phoneNumber1,
    required this.title,
  });

  String dateOfBirth;
  String firstName;
  String gender;
  String lastName;
  String nationality;
  String phoneNumber1;
  String title;

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData(
    dateOfBirth: json["date_of_birth"],
    firstName: json["first_name"],
    gender: json["gender"],
    lastName: json["last_name"],
    nationality: json["nationality"],
    phoneNumber1: json["phone_number1"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "date_of_birth": dateOfBirth,
    "first_name": firstName,
    "gender": gender,
    "last_name": lastName,
    "nationality": nationality,
    "phone_number1": phoneNumber1,
    "title": title,
  };
}