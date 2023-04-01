class InitiateWithdrawalResponseModel {
  InitiateWithdrawalResponseModel({
    required this.data,
  });

  Data data;

  factory InitiateWithdrawalResponseModel.fromJson(Map<String, dynamic> json) => InitiateWithdrawalResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.amount,
    required this.balanceAfter,
    required this.balanceBefore,
    required this.insertedAt,
    required this.metadata,
    required this.naration,
    required this.paymentMethod,
    required this.purpose,
    required this.reference,
    required this.status,
    required this.type,
    required this.updatedAt,
    required this.walletId,
    required this.wallet,
  });

  String amount;
  String balanceAfter;
  String balanceBefore;
  DateTime insertedAt;
  Metadata metadata;
  String naration;
  String paymentMethod;
  String purpose;
  String reference;
  String status;
  String type;
  DateTime updatedAt;
  String walletId;
  Wallet wallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    amount: json["amount"],
    balanceAfter: json["balance_after"],
    balanceBefore: json["balance_before"],
    insertedAt: DateTime.parse(json["inserted_at"]),
    metadata: Metadata.fromJson(json["metadata"]),
    naration: json["naration"],
    paymentMethod: json["payment_method"],
    purpose: json["purpose"],
    reference: json["reference"],
    status: json["status"],
    type: json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    walletId: json["wallet_id"],
    wallet: Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "balance_after": balanceAfter,
    "balance_before": balanceBefore,
    "inserted_at": insertedAt.toIso8601String(),
    "metadata": metadata.toJson(),
    "naration": naration,
    "payment_method": paymentMethod,
    "purpose": purpose,
    "reference": reference,
    "status": status,
    "type": type,
    "updated_at": updatedAt.toIso8601String(),
    "wallet_id": walletId,
    "wallet": wallet.toJson(),
  };
}

class Metadata {
  Metadata({
    required this.accountName,
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
  });

  String accountName;
  String accountNumber;
  String bankCode;
  String bankName;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    bankCode: json["bank_code"],
    bankName: json["bank_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "account_number": accountNumber,
    "bank_code": bankCode,
    "bank_name": bankName,
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
  String transactionPin;
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