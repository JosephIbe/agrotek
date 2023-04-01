class WalletBalanceResponseModel {
  WalletBalanceResponseModel({
    required this.data,
  });

  Data data;

  factory WalletBalanceResponseModel.fromJson(Map<String, dynamic> json) => WalletBalanceResponseModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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