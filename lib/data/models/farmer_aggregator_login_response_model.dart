class FarmerAggregatorLoginResponseModel {
  FarmerAggregatorLoginResponseModel({
    required this.token,
    required this.user,
  });

  String token;
  User user;

  factory FarmerAggregatorLoginResponseModel.fromJson(Map<String, dynamic> json) => FarmerAggregatorLoginResponseModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.bvn,
    required this.email,
    required this.id,
    required this.isActive,
    required this.isBvnVerified,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.phoneNumber,
    required this.role,
    required this.userRef,
    required this.userProfile,
    required this.wallet,
  });

  dynamic bvn;
  String email;
  int id;
  bool isActive;
  bool isBvnVerified;
  bool isEmailVerified;
  bool isPhoneVerified;
  String phoneNumber;
  String role;
  String userRef;
  UserProfile userProfile;
  Wallet wallet;

  factory User.fromJson(Map<String, dynamic> json) => User(
    bvn: json["bvn"],
    email: json["email"],
    id: json["id"],
    isActive: json["is_active"],
    isBvnVerified: json["is_bvn_verified"],
    isEmailVerified: json["is_email_verified"],
    isPhoneVerified: json["is_phone_verified"],
    phoneNumber: json["phone_number"],
    role: json["role"],
    userRef: json["user_ref"],
    userProfile: UserProfile.fromJson(json["user_profile"]),
    wallet: Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "bvn": bvn,
    "email": email,
    "id": id,
    "is_active": isActive,
    "is_bvn_verified": isBvnVerified,
    "is_email_verified": isEmailVerified,
    "is_phone_verified": isPhoneVerified,
    "phone_number": phoneNumber,
    "role": role,
    "user_ref": userRef,
    "user_profile": userProfile.toJson(),
    "wallet": wallet.toJson(),
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
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Wallet {
  Wallet({
    required this.availableBalance,
    required this.currency,
    required this.hasPin,
    required this.hasUniquePaymentId,
    required this.id,
    required this.isEnabled,
    required this.ledgerBalance,
    required this.lockedAmount,
    required this.threshold,
    required this.transactionPin,
    required this.uniquePaymentId,
  });

  String availableBalance;
  String currency;
  bool hasPin;
  bool hasUniquePaymentId;
  String id;
  bool isEnabled;
  String ledgerBalance;
  String lockedAmount;
  dynamic threshold;
  dynamic transactionPin;
  dynamic uniquePaymentId;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    availableBalance: json["available_balance"],
    currency: json["currency"],
    hasPin: json["has_pin"],
    hasUniquePaymentId: json["has_unique_payment_id"],
    id: json["id"],
    isEnabled: json["is_enabled"],
    ledgerBalance: json["ledger_balance"],
    lockedAmount: json["locked_amount"],
    threshold: json["threshold"],
    transactionPin: json["transaction_pin"],
    uniquePaymentId: json["unique_payment_id"],
  );

  Map<String, dynamic> toJson() => {
    "available_balance": availableBalance,
    "currency": currency,
    "has_pin": hasPin,
    "has_unique_payment_id": hasUniquePaymentId,
    "id": id,
    "is_enabled": isEnabled,
    "ledger_balance": ledgerBalance,
    "locked_amount": lockedAmount,
    "threshold": threshold,
    "transaction_pin": transactionPin,
    "unique_payment_id": uniquePaymentId,
  };
}