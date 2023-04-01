class ProfileResponseModel {
  ProfileResponseModel({
    required this.data,
  });

  Data data;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
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
    // required this.business,
    required this.userProfile,
  });

  dynamic bvn;
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
  // Business business;
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
    // business: Business.fromJson(json["business"]),
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
    // "business": business.toJson(),
    "user_profile": userProfile.toJson(),
  };
}

class Business {
  Business({
    required this.address,
    required this.businessCategory,
    required this.bvn,
    required this.chargeSettings,
    required this.cooperativeDocumentNumber,
    required this.country,
    required this.id,
    required this.imageUrl,
    required this.insertedAt,
    required this.isBvnVerified,
    required this.isCacVerified,
    required this.isCooperativeVerified,
    required this.isKycComplete,
    required this.isRcVerified,
    required this.isTinVerified,
    required this.latitude,
    required this.legalBusinessName,
    required this.longitude,
    required this.metadata,
    required this.name,
    required this.province,
    required this.rcNo,
    required this.ref,
    required this.type,
    required this.updatedAt,
    required this.userId,
  });

  dynamic address;
  dynamic businessCategory;
  dynamic bvn;
  ChargeSettings chargeSettings;
  dynamic cooperativeDocumentNumber;
  dynamic country;
  int id;
  dynamic imageUrl;
  DateTime insertedAt;
  bool isBvnVerified;
  bool isCacVerified;
  bool isCooperativeVerified;
  bool isKycComplete;
  bool isRcVerified;
  bool isTinVerified;
  dynamic latitude;
  dynamic legalBusinessName;
  dynamic longitude;
  Metadata metadata;
  String name;
  dynamic province;
  dynamic rcNo;
  String ref;
  String type;
  DateTime updatedAt;
  int userId;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    address: json["address"],
    businessCategory: json["business_category"],
    bvn: json["bvn"],
    chargeSettings: ChargeSettings.fromJson(json["charge_settings"]),
    cooperativeDocumentNumber: json["cooperative_document_number"],
    country: json["country"],
    id: json["id"],
    imageUrl: json["image_url"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isBvnVerified: json["is_bvn_verified"],
    isCacVerified: json["is_cac_verified"],
    isCooperativeVerified: json["is_cooperative_verified"],
    isKycComplete: json["is_kyc_complete"],
    isRcVerified: json["is_rc_verified"],
    isTinVerified: json["is_tin_verified"],
    latitude: json["latitude"],
    legalBusinessName: json["legal_business_name"],
    longitude: json["longitude"],
    metadata: Metadata.fromJson(json["metadata"]),
    name: json["name"],
    province: json["province"],
    rcNo: json["rc_no"],
    ref: json["ref"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "business_category": businessCategory,
    "bvn": bvn,
    "charge_settings": chargeSettings.toJson(),
    "cooperative_document_number": cooperativeDocumentNumber,
    "country": country,
    "id": id,
    "image_url": imageUrl,
    "inserted_at": insertedAt.toIso8601String(),
    "is_bvn_verified": isBvnVerified,
    "is_cac_verified": isCacVerified,
    "is_cooperative_verified": isCooperativeVerified,
    "is_kyc_complete": isKycComplete,
    "is_rc_verified": isRcVerified,
    "is_tin_verified": isTinVerified,
    "latitude": latitude,
    "legal_business_name": legalBusinessName,
    "longitude": longitude,
    "metadata": metadata.toJson(),
    "name": name,
    "province": province,
    "rc_no": rcNo,
    "ref": ref,
    "type": type,
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
  };
}

class ChargeSettings {
  ChargeSettings({
    required this.cappedAmount,
    required this.chargeAmount,
    required this.chargePer,
    required this.chargePercentage,
    required this.chargeType,
  });

  int cappedAmount;
  int chargeAmount;
  dynamic chargePer;
  int chargePercentage;
  String chargeType;

  factory ChargeSettings.fromJson(Map<String, dynamic> json) => ChargeSettings(
    cappedAmount: json["capped_amount"],
    chargeAmount: json["charge_amount"],
    chargePer: json["charge_per"],
    chargePercentage: json["charge_percentage"],
    chargeType: json["charge_type"],
  );

  Map<String, dynamic> toJson() => {
    "capped_amount": cappedAmount,
    "charge_amount": chargeAmount,
    "charge_per": chargePer,
    "charge_percentage": chargePercentage,
    "charge_type": chargeType,
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
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