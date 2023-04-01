class APIConstants {

  APIConstants._();

  static const String baseURL = "https://stagingapi.agenpo.com";
  static const String apiVersion = "/api/v1";

  static String login = '/signin';
  static String register = '/users/register';
  static String generateOTP = '/otp/generate';

  static String validateBVN(String bvn) => '/kyc/users/validate-bvn/$bvn';

  // static String getWalletBalance = '/users/223/wallet';

  static String getAllOffers = '/trading-commodities/offers?page_no=1&per_page=20&status=pending';
  static String acceptOffer = '/trading-commodities/offers/accept';

  static String getAllTransactions = '/users/transactions?page_no=1&per_page=20';
  static String getUserProfile = '/user/profile';

  static String getWarehouses = '/warehouses/stocks?page_no=1&per_page=10';

  static String getAllInventoryItems = '/trading-commodities?page_no=1&per_page=100';
  static String getActiveInventoryItems = '/trading-commodities?page_no=1&per_page=100&status=active';
  static String getSoldOutInventoryItems = '/trading-commodities?page_no=1&per_page=100&status=sold';
  static String getSingleInventoryItem({required dynamic id}) => '/trading-commodities/$id?with_related_data=true';

  static String createTransactionPIN = '/users/wallet/set-pin';

  static String getUserBanks = '/users/user_bank_accounts?page_no=1&per_page=20&user_id=';
  static String userBanks = '/users/user_bank_accounts';
  static String getBanks = '/banks';
  static String resolveBank = '/banks/resolve';
  static String initiateWithdrawal = '/users/wallets/initiate-withdrawal';

  static String sendContactMail = '/mail/contact-mail';
  static String subscribeNewsLetter = '/newsletters/subscribe';

  static String updateProfile = '/users/';
  static String otpVerify = '/users';
  static String resendOtpVerify = '/user_accounts/resend-otp';
  static String setupProfile(int id) => '/users/$id/setup-profile';
  static String updatePassword = '/user_accounts/update-password';
  static String verifyUserAndWarehouse = '/accounts/verify-user-and-warehouse';
  static String commodities = '/comodities';
  static String newCommodity = '/trading-commodities';
  static String contact = '/mail/contact-mail';

  static String qualityControlParams(int commodityId)
  => '/comodities/$commodityId/qc-params';
  static String inspections(int id)
  => '/inspectors/$id/trading-commodities';
  static String tradingCommodity(int id) => '/trading-commodities/$id';

  static String analytics(int idinspectorId)
  => '/inspectors/$idinspectorId/trading-commodities/analytics';
  static String offers = '/trading-commodities/offers';
  static String wallet(int id) => '/users/$id/wallet';

  static String banks = '/banks';
  static String accountResolve = '/banks/resolve';
  static String addBank = '/users/user_bank_accounts';
  static String withdraw = '/users/wallets/initiate_withdrawal';
  static String bankAccounts = '/users/user_bank_accounts';

  static String farmLocations = '/users/farm-locations';

  /// KYC API Collection
  // static String validateBVN(String bvn) => '/kyc/users/validate-bvn/$bvn';
  static String validateRC(String rc) => '/kyc/business/business-registration/$rc';
  static String uploadDoc = '/kyc/business/upload-documents';
  static String documents = '/documents';
  static String inviteUser = '/businesses/1/users/invite';

  static String businessCreate(int id) => '/businesses/$id/users';

}