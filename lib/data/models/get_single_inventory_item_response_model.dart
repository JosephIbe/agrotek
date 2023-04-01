class GetSingleInventoryItemResponseModel {
  GetSingleInventoryItemResponseModel({
    required this.data,
  });

  GetSingleInventoryItemResponseModelData data;

  factory GetSingleInventoryItemResponseModel.fromJson(Map<String, dynamic> json) => GetSingleInventoryItemResponseModel(
    data: GetSingleInventoryItemResponseModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class GetSingleInventoryItemResponseModelData {
  GetSingleInventoryItemResponseModelData({
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
    required this.inspector,
    required this.offers,
    required this.qualityControlValues,
    required this.warehouse,
    required this.warehouseStock,
  });

  int averageNetWeightPerBag;
  Charges charges;
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
  Farmer farmer;
  Farmer inspector;
  List<InventoryOffer> offers;
  List<QualityControlValue> qualityControlValues;
  Warehouse warehouse;
  WarehouseStock warehouseStock;

  factory GetSingleInventoryItemResponseModelData.fromJson(Map<String, dynamic> json) => GetSingleInventoryItemResponseModelData(
    averageNetWeightPerBag: json["average_net_weight_per_bag"],
    charges: Charges.fromJson(json["charges"]),
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
    farmer: Farmer.fromJson(json["farmer"]),
    inspector: Farmer.fromJson(json["inspector"]),
    offers: List<InventoryOffer>.from(json["offers"].map((x) => InventoryOffer.fromJson(x))),
    qualityControlValues: List<QualityControlValue>.from(json["quality_control_values"].map((x) => QualityControlValue.fromJson(x))),
    warehouse: Warehouse.fromJson(json["warehouse"]),
    warehouseStock: WarehouseStock.fromJson(json["warehouse_stock"]),
  );

  Map<String, dynamic> toJson() => {
    "average_net_weight_per_bag": averageNetWeightPerBag,
    "charges": charges.toJson(),
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
    "farmer": farmer.toJson(),
    "inspector": inspector.toJson(),
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    "quality_control_values": List<dynamic>.from(qualityControlValues.map((x) => x.toJson())),
    "warehouse": warehouse.toJson(),
    "warehouse_stock": warehouseStock.toJson(),
  };
}

class Charges {
  Charges({
    required this.commodityLevy,
    required this.qualityControlCharge,
    required this.serviceCharge,
    required this.totalAmount,
    required this.warehouseCharge,
  });

  CommodityLevy commodityLevy;
  QualityControlCharge qualityControlCharge;
  ServiceCharge serviceCharge;
  int totalAmount;
  WarehouseCharge warehouseCharge;

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
    commodityLevy: CommodityLevy.fromJson(json["commodity_levy"]),
    qualityControlCharge: QualityControlCharge.fromJson(json["quality_control_charge"]),
    serviceCharge: ServiceCharge.fromJson(json["service_charge"]),
    totalAmount: json["total_amount"],
    warehouseCharge: WarehouseCharge.fromJson(json["warehouse_charge"]),
  );

  Map<String, dynamic> toJson() => {
    "commodity_levy": commodityLevy.toJson(),
    "quality_control_charge": qualityControlCharge.toJson(),
    "service_charge": serviceCharge.toJson(),
    "total_amount": totalAmount,
    "warehouse_charge": warehouseCharge.toJson(),
  };
}

class CommodityLevy {
  CommodityLevy({
    required this.commodityLevyFee,
    required this.settings,
  });

  int commodityLevyFee;
  CommodityLevySettings settings;

  factory CommodityLevy.fromJson(Map<String, dynamic> json) => CommodityLevy(
    commodityLevyFee: json["commodity_levy_fee"],
    settings: CommodityLevySettings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "commodity_levy_fee": commodityLevyFee,
    "settings": settings.toJson(),
  };
}

class CommodityLevySettings {
  CommodityLevySettings({
    required this.chargePercentage,
    required this.chargeType,
    required this.lga,
  });

  String chargePercentage;
  String chargeType;
  String lga;

  factory CommodityLevySettings.fromJson(Map<String, dynamic> json) => CommodityLevySettings(
    chargePercentage: json["charge_percentage"],
    chargeType: json["charge_type"],
    lga: json["lga"],
  );

  Map<String, dynamic> toJson() => {
    "charge_percentage": chargePercentage,
    "charge_type": chargeType,
    "lga": lga,
  };
}

class QualityControlCharge {
  QualityControlCharge({
    required this.qualityControlFee,
    required this.settings,
  });

  int qualityControlFee;
  ChargeSettingsClass settings;

  factory QualityControlCharge.fromJson(Map<String, dynamic> json) => QualityControlCharge(
    qualityControlFee: json["quality_control_fee"],
    settings: ChargeSettingsClass.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "quality_control_fee": qualityControlFee,
    "settings": settings.toJson(),
  };
}

class ChargeSettingsClass {
  ChargeSettingsClass({
    required this.cappedAmount,
    required this.cappedPercentage,
    required this.chargeAmount,
    required this.chargePer,
    required this.chargePercentage,
    required this.chargeType,
  });

  String cappedAmount;
  String cappedPercentage;
  String chargeAmount;
  String chargePer;
  String chargePercentage;
  String chargeType;

  factory ChargeSettingsClass.fromJson(Map<String, dynamic> json) => ChargeSettingsClass(
    cappedAmount: json["capped_amount"],
    cappedPercentage: json["capped_percentage"],
    chargeAmount: json["charge_amount"],
    chargePer: json["charge_per"],
    chargePercentage: json["charge_percentage"],
    chargeType: json["charge_type"],
  );

  Map<String, dynamic> toJson() => {
    "capped_amount": cappedAmount,
    "capped_percentage": cappedPercentage,
    "charge_amount": chargeAmount,
    "charge_per": chargePer,
    "charge_percentage": chargePercentage,
    "charge_type": chargeType,
  };
}

class ServiceCharge {
  ServiceCharge({
    required this.serviceChargeFee,
    required this.settings,
  });

  int serviceChargeFee;
  ServiceChargeSettings settings;

  factory ServiceCharge.fromJson(Map<String, dynamic> json) => ServiceCharge(
    serviceChargeFee: json["service_charge_fee"],
    settings: ServiceChargeSettings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "service_charge_fee": serviceChargeFee,
    "settings": settings.toJson(),
  };
}

class ServiceChargeSettings {
  ServiceChargeSettings({
    required this.chargePercentage,
  });

  String chargePercentage;

  factory ServiceChargeSettings.fromJson(Map<String, dynamic> json) => ServiceChargeSettings(
    chargePercentage: json["charge_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "charge_percentage": chargePercentage,
  };
}

class WarehouseCharge {
  WarehouseCharge({
    required this.settings,
    required this.warehouseFee,
  });

  ChargeSettingsClass settings;
  int warehouseFee;

  factory WarehouseCharge.fromJson(Map<String, dynamic> json) => WarehouseCharge(
    settings: ChargeSettingsClass.fromJson(json["settings"]),
    warehouseFee: json["warehouse_fee"],
  );

  Map<String, dynamic> toJson() => {
    "settings": settings.toJson(),
    "warehouse_fee": warehouseFee,
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
  dynamic description;
  int id;
  String imageUrl;
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

class Farmer {
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
    // required this.business,
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
  // Warehouse business;

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
    bvn: json["bvn"] ?? 'bvn',
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
    // business: Warehouse.fromJson(json["business"]),
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
  };
}

class Inspector {
  Inspector({
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
    required this.business,
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
  Warehouse business;

  factory Inspector.fromJson(Map<String, dynamic> json) => Inspector(
    bvn: json["bvn"] ?? 'bvn',
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
    business: Warehouse.fromJson(json["business"]),
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
    "business": business.toJson(),
  };
}

class Warehouse {
  Warehouse({
    required this.address,
    required this.businessCategory,
    required this.bvn,
    // required this.chargeSettings,
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
    // required this.rcNo,
    required this.ref,
    required this.type,
    required this.updatedAt,
    required this.userId,
  });

  String address;
  dynamic businessCategory;
  dynamic bvn;
  // ChargeSettingsClass chargeSettings;
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
  String latitude;
  dynamic legalBusinessName;
  String longitude;
  Metadata metadata;
  String name;
  String province;
  // String rcNo;
  String ref;
  String type;
  DateTime updatedAt;
  int userId;

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    address: json["address"],
    businessCategory: json["business_category"],
    bvn: json["bvn"],
    // chargeSettings: ChargeSettingsClass.fromJson(json["charge_settings"]),
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
    // rcNo: json["rc_no"],
    ref: json["ref"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "business_category": businessCategory,
    "bvn": bvn,
    // "charge_settings": chargeSettings.toJson(),
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
    // "rc_no": rcNo,
    "ref": ref,
    "type": type,
    "updated_at": updatedAt.toIso8601String(),
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

class InventoryOffer {

  String amount;
  int id;
  DateTime insertedAt;
  bool isAccepted;
  Metadata metadata;
  String status;
  DateTime updatedAt;
  String walletId;
  Farmer trader;

  InventoryOffer({
    required this.amount,
    required this.id,
    required this.insertedAt,
    required this.isAccepted,
    required this.metadata,
    required this.status,
    required this.updatedAt,
    required this.walletId,
    required this.trader,
  });

  factory InventoryOffer.fromJson(Map<String, dynamic> json) => InventoryOffer(
    amount: json["amount"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isAccepted: json["is_accepted"],
    metadata: Metadata.fromJson(json["metadata"]),
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    walletId: json["wallet_id"],
    trader: Farmer.fromJson(json["trader"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "is_accepted": isAccepted,
    "metadata": metadata.toJson(),
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "wallet_id": walletId,
    "trader": trader.toJson(),
  };
}

class QualityControlValue {
  QualityControlValue({
    required this.comment,
    required this.id,
    required this.insertedAt,
    required this.updatedAt,
    required this.value,
    required this.qualityControlParams,
  });

  String comment;
  int id;
  DateTime insertedAt;
  DateTime updatedAt;
  String value;
  QualityControlParams qualityControlParams;

  factory QualityControlValue.fromJson(Map<String, dynamic> json) => QualityControlValue(
    comment: json["comment"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    value: json["value"],
    qualityControlParams: QualityControlParams.fromJson(json["quality_control_params"]),
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "value": value,
    "quality_control_params": qualityControlParams.toJson(),
  };
}

class QualityControlParams {
  QualityControlParams({
    required this.data,
  });

  QualityControlParamsData data;

  factory QualityControlParams.fromJson(Map<String, dynamic> json) => QualityControlParams(
    data: QualityControlParamsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class QualityControlParamsData {
  QualityControlParamsData({
    required this.description,
    required this.id,
    required this.insertedAt,
    required this.isActive,
    required this.name,
    required this.standardValue,
    required this.unit,
    required this.updatedAt,
  });

  dynamic description;
  int id;
  DateTime insertedAt;
  bool isActive;
  String name;
  dynamic standardValue;
  String unit;
  DateTime updatedAt;

  factory QualityControlParamsData.fromJson(Map<String, dynamic> json) => QualityControlParamsData(
    description: json["description"],
    id: json["id"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    isActive: json["is_active"],
    name: json["name"],
    standardValue: json["standard_value"],
    unit: json["unit"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "id": id,
    "inserted_at": insertedAt.toIso8601String(),
    "is_active": isActive,
    "name": name,
    "standard_value": standardValue,
    "unit": unit,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class WarehouseStock {
  WarehouseStock({
    required this.handler,
    required this.id,
    required this.inboundDate,
    required this.metadata,
    required this.outboundDate,
    required this.quantity,
    required this.ref,
    required this.releaseDate,
    required this.status,
    required this.storageLocation,
    required this.tradingCommodityId,
    required this.userId,
    required this.warehouseId,
  });

  String handler;
  int id;
  DateTime inboundDate;
  Metadata metadata;
  DateTime outboundDate;
  int quantity;
  String ref;
  DateTime releaseDate;
  String status;
  String storageLocation;
  int tradingCommodityId;
  int userId;
  int warehouseId;

  factory WarehouseStock.fromJson(Map<String, dynamic> json) => WarehouseStock(
    handler: json["handler"],
    id: json["id"],
    inboundDate: DateTime.parse(json["inbound_date"]),
    metadata: Metadata.fromJson(json["metadata"]),
    outboundDate: DateTime.parse(json["outbound_date"]),
    quantity: json["quantity"],
    ref: json["ref"],
    releaseDate: DateTime.parse(json["release_date"]),
    status: json["status"],
    storageLocation: json["storage_location"],
    tradingCommodityId: json["trading_commodity_id"],
    userId: json["user_id"],
    warehouseId: json["warehouse_id"],
  );

  Map<String, dynamic> toJson() => {
    "handler": handler,
    "id": id,
    "inbound_date": inboundDate.toIso8601String(),
    "metadata": metadata.toJson(),
    "outbound_date": outboundDate.toIso8601String(),
    "quantity": quantity,
    "ref": ref,
    "release_date": releaseDate.toIso8601String(),
    "status": status,
    "storage_location": storageLocation,
    "trading_commodity_id": tradingCommodityId,
    "user_id": userId,
    "warehouse_id": warehouseId,
  };
}