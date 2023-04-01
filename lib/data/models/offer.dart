class Offer {

  String amount;
  int id;
  DateTime insertedAt;
  bool isAccepted;
  Metadata metadata;
  String status;
  DateTime updatedAt;
  String walletId;
  Trader trader;
  TradingCommodity tradingCommodity;

  Offer({
    required this.amount,
    required this.id,
    required this.insertedAt,
    required this.isAccepted,
    required this.metadata,
    required this.status,
    required this.updatedAt,
    required this.walletId,
    required this.trader,
    required this.tradingCommodity,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    amount: json["amount"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isAccepted: json["is_accepted"],
    metadata: Metadata.fromJson(json["metadata"]),
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    walletId: json["wallet_id"],
    trader: Trader.fromJson(json["trader"]),
    tradingCommodity: TradingCommodity.fromJson(json["trading_commodity"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "is_accepted": isAccepted,
    "metadata": metadata.toJson(),
    "status": datumStatusValues.reverse[status],
    "updated_at": updatedAt.toIso8601String(),
    "wallet_id": walletId,
    "trader": trader.toJson(),
    "trading_commodity": tradingCommodity.toJson(),
  };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum DatumStatus { PENDING, ACCEPTED }

final datumStatusValues = EnumValues({
  "accepted": DatumStatus.ACCEPTED,
  "pending": DatumStatus.PENDING
});

class Trader {
  Trader({
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

  String? bvn;
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
  Role role;
  String userRef;

  factory Trader.fromJson(Map<String, dynamic> json) => Trader(
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
    phoneNumber: json["phone_number"] ?? "919019",
    role: roleValues.map[json["role"]]!,
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
    "role": roleValues.reverse[role],
    "user_ref": userRef,
  };
}

enum Role { TRADER, ADMIN, FARMER }

final roleValues = EnumValues({
  "admin": Role.ADMIN,
  "farmer": Role.FARMER,
  "trader": Role.TRADER
});

class TradingCommodity {
  TradingCommodity({
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
    required this.farmer,
    required this.warehouse,
    required this.warehouseStock,
  });

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
  TradingCommodityStatus status;
  int totalNetWeight;
  int totalNoOfBags;
  int totalTareWeightOfBags;
  DateTime updatedAt;
  int warehouseId;
  Commodity commodity;
  Trader farmer;
  Warehouse warehouse;
  WarehouseStock warehouseStock;

  factory TradingCommodity.fromJson(Map<String, dynamic> json) => TradingCommodity(
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
    status: tradingCommodityStatusValues.map[json["status"]]!,
    totalNetWeight: json["total_net_weight"],
    totalNoOfBags: json["total_no_of_bags"],
    totalTareWeightOfBags: json["total_tare_weight_of_bags"],
    updatedAt: DateTime.parse(json["updated_at"]),
    warehouseId: json["warehouse_id"],
    commodity: Commodity.fromJson(json["commodity"]),
    farmer: Trader.fromJson(json["farmer"]),
    warehouse: Warehouse.fromJson(json["warehouse"]),
    warehouseStock: WarehouseStock.fromJson(json["warehouse_stock"]),
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
    "status": tradingCommodityStatusValues.reverse[status],
    "total_net_weight": totalNetWeight,
    "total_no_of_bags": totalNoOfBags,
    "total_tare_weight_of_bags": totalTareWeightOfBags,
    "updated_at": updatedAt.toIso8601String(),
    "warehouse_id": warehouseId,
    "commodity": commodity.toJson(),
    "farmer": farmer.toJson(),
    "warehouse": warehouse.toJson(),
    "warehouse_stock": warehouseStock.toJson(),
  };
}

class Commodity {
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

  String code;
  String? description;
  int id;
  String? imageUrl;
  DateTime insertedAt;
  bool isActive;
  String name;
  int noKgPerContract;
  DateTime updatedAt;

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

enum Code { SY, SG, OI }

final codeValues = EnumValues({
  "OI": Code.OI,
  "SG": Code.SG,
  "SY": Code.SY
});

enum TradingCommodityStatus { OFFER, IN_TRANSIT }

final tradingCommodityStatusValues = EnumValues({
  "in_transit": TradingCommodityStatus.IN_TRANSIT,
  "offer": TradingCommodityStatus.OFFER
});

class Warehouse {
  Warehouse({
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

  String address;
  dynamic businessCategory;
  dynamic bvn;
  ChargeSettings chargeSettings;
  dynamic cooperativeDocumentNumber;
  String country;
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
  String province;
  dynamic rcNo;
  Ref ref;
  Type type;
  DateTime updatedAt;
  int userId;

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    address: json["address"] ?? "",
    businessCategory: json["business_category"],
    bvn: json["bvn"],
    chargeSettings: ChargeSettings.fromJson(json["charge_settings"]),
    cooperativeDocumentNumber: json["cooperative_document_number"],
    country: json["country"] ?? "Unknown",
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
    province: json["province"] ?? "Unknown",
    rcNo: json["rc_no"],
    ref: refValues.map[json["ref"]]!,
    type: typeValues.map[json["type"]]!,
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
    "name": warehouseNameValues.reverse[name],
    "province": province,
    "rc_no": rcNo,
    "ref": refValues.reverse[ref],
    "type": typeValues.reverse[type],
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

  dynamic cappedAmount;
  dynamic chargeAmount;
  String chargePer;
  dynamic chargePercentage;
  ChargeType chargeType;

  factory ChargeSettings.fromJson(Map<String, dynamic> json) => ChargeSettings(
    cappedAmount: json["capped_amount"],
    chargeAmount: json["charge_amount"],
    chargePer: json["charge_per"],
    chargePercentage: json["charge_percentage"],
    chargeType: chargeTypeValues.map[json["charge_type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "capped_amount": cappedAmount,
    "charge_amount": chargeAmount,
    "charge_per": chargePer,
    "charge_percentage": chargePercentage,
    "charge_type": chargeTypeValues.reverse[chargeType],
  };
}

enum ChargeType { PERCENTAGE }

final chargeTypeValues = EnumValues({
  "percentage": ChargeType.PERCENTAGE
});

enum WarehouseName { SGS1_BUSINESS, ABC_COMPANY, DEVKREATE2 }

final warehouseNameValues = EnumValues({
  "ABC Company": WarehouseName.ABC_COMPANY,
  "Devkreate2 ": WarehouseName.DEVKREATE2,
  "SGS1 Business": WarehouseName.SGS1_BUSINESS
});

enum Ref { AGWH426345, AGWH732609, AGWH566848 }

final refValues = EnumValues({
  "AGWH426345": Ref.AGWH426345,
  "AGWH566848": Ref.AGWH566848,
  "AGWH732609": Ref.AGWH732609
});

enum Type { QUALITY_CONTROL, COOPERATIVE, WAREHOUSE }

final typeValues = EnumValues({
  "cooperative": Type.COOPERATIVE,
  "quality_control": Type.QUALITY_CONTROL,
  "warehouse": Type.WAREHOUSE
});

class WarehouseStock {
  WarehouseStock({
    required this.handler,
    required this.id,
    this.inboundDate,
    required this.metadata,
    this.outboundDate,
    required this.quantity,
    required this.ref,
    this.releaseDate,
    required this.status,
    required this.storageLocation,
    required this.tradingCommodityId,
    required this.userId,
    required this.warehouseId,
  });

  String handler;
  int id;
  DateTime? inboundDate;
  Metadata metadata;
  DateTime? outboundDate;
  int quantity;
  String ref;
  DateTime? releaseDate;
  WarehouseStockStatus status;
  String storageLocation;
  int tradingCommodityId;
  int userId;
  int warehouseId;

  factory WarehouseStock.fromJson(Map<String, dynamic> json) => WarehouseStock(
    handler: json["handler"],
    id: json["id"],
    // inboundDate: DateTime.parse(json["inbound_date"]),
    metadata: Metadata.fromJson(json["metadata"]),
    // outboundDate: DateTime.parse(json["outbound_date"]),
    quantity: json["quantity"],
    ref: json["ref"],
    // releaseDate: DateTime.parse(json["release_date"]),
    status: warehouseStockStatusValues.map[json["status"]]!,
    storageLocation: json["storage_location"],
    tradingCommodityId: json["trading_commodity_id"],
    userId: json["user_id"],
    warehouseId: json["warehouse_id"],
  );

  Map<String, dynamic> toJson() => {
    "handler": handler,
    "id": id,
    // "inbound_date": inboundDate!.toIso8601String(),
    "metadata": metadata.toJson(),
    // "outbound_date": outboundDate!.toIso8601String(),
    "quantity": quantity,
    "ref": ref,
    // "release_date": releaseDate!.toIso8601String(),
    "status": warehouseStockStatusValues.reverse[status],
    "storage_location": storageLocation,
    "trading_commodity_id": tradingCommodityId,
    "user_id": userId,
    "warehouse_id": warehouseId,
  };
}

enum WarehouseStockStatus { INBOUND, OUTBOUND }

final warehouseStockStatusValues = EnumValues({
  "inbound": WarehouseStockStatus.INBOUND,
  "outbound": WarehouseStockStatus.OUTBOUND
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}