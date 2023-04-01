class GetAllInventoryItemsResponseModel {

  List<InventoryData> data;
  int firstPage;
  bool hasNext;
  bool hasPrev;
  int nextPage;
  int page;
  int prevPage;
  int totalCount;

  GetAllInventoryItemsResponseModel({
    required this.data,
    required this.firstPage,
    required this.hasNext,
    required this.hasPrev,
    required this.nextPage,
    required this.page,
    required this.prevPage,
    required this.totalCount,
  });

  factory GetAllInventoryItemsResponseModel.fromJson(Map<String, dynamic> json) => GetAllInventoryItemsResponseModel(
    data: List<InventoryData>.from(json["data"].map((x) => InventoryData.fromJson(x))),
    firstPage: json["first_page"],
    hasNext: json["has_next"],
    hasPrev: json["has_prev"],
    nextPage: json["next_page"],
    page: json["page"],
    prevPage: json["prev_page"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page": firstPage,
    "has_next": hasNext,
    "has_prev": hasPrev,
    "next_page": nextPage,
    "page": page,
    "prev_page": prevPage,
    "total_count": totalCount,
  };
}

class InventoryData {

  int averageNetWeightPerBag;
  dynamic charges;
  int commodityId;
  int farmerId;
  int grossWeight;
  int id;
  DateTime insertedAt;
  int inspectorId;
  bool isActive;
  bool isClosed;
  bool isOffered;
  bool isPublished;
  Metadata metadata;
  String ref;
  String status;
  int totalNetWeight;
  int totalNoOfBags;
  int totalTareWeightOfBags;
  DateTime updatedAt;
  int warehouseId;
  Commodity commodity;
  // Farmer farmer;\

  Farmer inspector;
  Warehouse warehouse;

  InventoryData({
    required this.averageNetWeightPerBag,
    required this.charges,
    required this.commodityId,
    required this.farmerId,
    required this.grossWeight,
    required this.id,
    required this.insertedAt,
    required this.inspectorId,
    required this.isActive,
    required this.isClosed,
    required this.isOffered,
    required this.isPublished,
    required this.metadata,
    required this.ref,
    required this.status,
    required this.totalNetWeight,
    required this.totalNoOfBags,
    required this.totalTareWeightOfBags,
    required this.updatedAt,
    required this.warehouseId,
    required this.commodity,
    // required this.farmer,
    required this.inspector,
    required this.warehouse,
  });

  factory InventoryData.fromJson(Map<String, dynamic> json) => InventoryData(
    averageNetWeightPerBag: json["average_net_weight_per_bag"],
    charges: json["charges"],
    commodityId: json["commodity_id"],
    farmerId: json["farmer_id"],
    grossWeight: json["gross_weight"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    inspectorId: json["inspector_id"],
    isActive: json["is_active"],
    isClosed: json["is_closed"],
    isOffered: json["is_offered"],
    isPublished: json["is_published"],
    metadata: Metadata.fromJson(json["metadata"]),
    ref: json["ref"],
    status: json["status"],
    totalNetWeight: json["total_net_weight"],
    totalNoOfBags: json["total_no_of_bags"],
    totalTareWeightOfBags: json["total_tare_weight_of_bags"],
    updatedAt: DateTime.parse(json["updated_at"]),
    warehouseId: json["warehouse_id"],
    commodity: Commodity.fromJson(json["commodity"]),
    // farmer: Farmer.fromJson(json["farmer"]),
    inspector: Farmer.fromJson(json["inspector"]),
    warehouse: Warehouse.fromJson(json["warehouse"]),
  );

  Map<String, dynamic> toJson() => {
    "average_net_weight_per_bag": averageNetWeightPerBag,
    "charges": charges,
    "commodity_id": commodityId,
    "farmer_id": farmerId,
    "gross_weight": grossWeight,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "inspector_id": inspectorId,
    "is_active": isActive,
    "is_closed": isClosed,
    "is_offered": isOffered,
    "is_published": isPublished,
    "metadata": metadata.toJson(),
    "ref": ref,
    "status": status,
    "total_net_weight": totalNetWeight,
    "total_no_of_bags": totalNoOfBags,
    "total_tare_weight_of_bags": totalTareWeightOfBags,
    "updated_at": updatedAt.toIso8601String(),
    "warehouse_id": warehouseId,
    "commodity": commodity.toJson(),
    // "farmer": farmer.toJson(),
    "inspector": inspector.toJson(),
    "warehouse": warehouse.toJson(),
  };
}

class Commodity {

  String code;
  dynamic description;
  int id;
  String imageUrl;
  DateTime insertedAt;
  bool isActive;
  String name;
  int noKgPerContract;
  DateTime updatedAt;

  Commodity({
    required this.code,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.insertedAt,
    required this.isActive,
    required this.name,
    required this.noKgPerContract,
    required this.updatedAt,
  });

  factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(
    code: json["code"],
    description: json["description"],
    id: json["id"],
    imageUrl: json["image_url"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isActive: json["is_active"],
    name: json["name"],
    noKgPerContract: json["no_kg_per_contract"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
    "id": id,
    "image_url": imageUrl,
    "inserted_at": insertedAt.toIso8601String(),
    "is_active": isActive,
    "name": name,
    "no_kg_per_contract": noKgPerContract,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Farmer {

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

  Farmer({
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
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
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
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Warehouse {

  String? address;
  dynamic businessCategory;
  dynamic bvn;
  ChargeSettings? chargeSettings;
  dynamic cooperativeDocumentNumber;
  String? country;
  int id;
  dynamic imageUrl;
  DateTime? insertedAt;
  bool? isBvnVerified;
  bool? isCacVerified;
  bool? isCooperativeVerified;
  bool? isKycComplete;
  bool? isRcVerified;
  bool? isTinVerified;
  String? latitude;
  dynamic legalBusinessName;
  String? longitude;
  Metadata? metadata;
  String? name;
  String? province;
  dynamic rcNo;
  String? ref;
  String? type;
  DateTime? updatedAt;
  int? userId;

  Warehouse({
    this.address,
    this.businessCategory,
    this.bvn,
    this.chargeSettings,
    this.cooperativeDocumentNumber,
    this.country,
    required this.id,
    this.imageUrl,
    this.insertedAt,
    this.isBvnVerified,
    this.isCacVerified,
    this.isCooperativeVerified,
    this.isKycComplete,
    this.isRcVerified,
    this.isTinVerified,
    this.latitude,
    this.legalBusinessName,
    this.longitude,
    this.metadata,
    this.name,
    this.province,
    this.rcNo,
    this.ref,
    this.type,
    this.updatedAt,
    this.userId,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
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
    "charge_settings": chargeSettings?.toJson(),
    "cooperative_document_number": cooperativeDocumentNumber,
    "country": country,
    "id": id,
    "image_url": imageUrl,
    "inserted_at": insertedAt?.toIso8601String(),
    "is_bvn_verified": isBvnVerified,
    "is_cac_verified": isCacVerified,
    "is_cooperative_verified": isCooperativeVerified,
    "is_kyc_complete": isKycComplete,
    "is_rc_verified": isRcVerified,
    "is_tin_verified": isTinVerified,
    "latitude": latitude,
    "legal_business_name": legalBusinessName,
    "longitude": longitude,
    "metadata": metadata?.toJson(),
    "name": name,
    "province": province,
    "rc_no": rcNo,
    "ref": ref,
    "type": type,
    "updated_at": updatedAt?.toIso8601String(),
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

  String cappedAmount;
  String chargeAmount;
  String chargePer;
  String chargePercentage;
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