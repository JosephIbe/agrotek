// import 'package:agenpo/public/pages/auth/set_up_account.dart';
// import 'package:agenpo/public/pages/privacy_policy/privacy_policy_page.dart';
// import 'package:agenpo/public/pages/terms_of_use/terms_of_use_page.dart';
// import 'package:agenpo/public/pages/warehouse/warehouse_page.dart';
// import 'package:flutter/material.dart';
//
// import 'app/utils/index.dart';
// import 'public/pages/about_us/about_us_page.dart';
// import 'public/pages/auth/forgot_password_page.dart';
// import 'public/pages/auth/kyc/index.dart';
// import 'public/pages/auth/sign_in_page.dart';
// import 'public/pages/auth/otp_verification_page.dart';
// import 'public/pages/auth/signup/sign_up_page.dart';
// import 'public/pages/commodity/commodity_page.dart';
// import 'public/pages/commodity/create/create_commodity_page.dart';
// import 'public/pages/commodity/preview/preview_commodity_page.dart';
// import 'public/pages/contact_us/contact_us_page.dart';
// import 'public/pages/dashboard/dashboard_page.dart';
// import 'public/pages/geolocate_my_farm/geolocate_my_farm_page.dart';
// import 'public/pages/get_started/get_started_page.dart';
// import 'public/pages/inventory/inventory_page.dart';
// import 'public/pages/offer-details/offer_details_page.dart';
// import 'public/pages/offers/offers_page.dart';
// import 'public/pages/profile/profile_page.dart';
// import 'public/pages/spashscreen/spashscreen_page.dart';
// import 'public/pages/withdraw/withdraw_page.dart';
//
// Map<Pattern, Page<dynamic> Function(Uri, dynamic)> pageRoutes = {
// 	'/': (uri, params) => RoutePage(
// 		pageName: SplashScreenPage.pageName,
// 		child: const SplashScreenPage()
// 	),
// 	GetStartedPage.routeName: (uri, params) => RoutePage(
// 		pageName: GetStartedPage.pageName,
// 		child: const GetStartedPage()
// 	),
// 	SignInPage.routeName: (uri, params) => RoutePage(
// 		pageName: SignInPage.pageName,
// 		child: const SignInPage()
// 	),
// 	SetUpAccount.routeName: (uri, params) => RoutePage(
// 		pageName: SetUpAccount.pageName,
// 		child: const SetUpAccount()
// 	),
// 	ForgotPasswordPage.routeName: (uri, params) => RoutePage(
// 		pageName: ForgotPasswordPage.pageName,
// 		child: ForgotPasswordPage(type: params)
// 	),
// 	SignUpPage.routeName: (uri, params) => RoutePage(
// 		pageName: SignUpPage.pageName,
// 		child: const SignUpPage()
// 	),
// 	OTPVerificationPage.routeName: (uri, params) {
// 		return RoutePage(
// 			pageName: OTPVerificationPage.pageName,
// 			child: OTPVerificationPage(data: params)
// 		);
// 	},
// 	SignUpKYC.routeName: (uri, params) {
// 		return RoutePage(
// 			pageName: SignUpKYC.pageName,
// 			child: const SignUpKYC()
// 		);
// 	},
// 	DashboardPage.routeName: (uri, params) => RoutePage(
// 		pageName: DashboardPage.pageName,
// 		child: DashboardPage(page: params)
// 	),
// 	CreateCommodityPage.routeName: (uri, params) => RoutePage(
// 		pageName: CreateCommodityPage.pageName,
// 		child: const CreateCommodityPage()
// 	),
// 	PreviewCommodityPage.routeName: (uri, params) => RoutePage(
// 		pageName: PreviewCommodityPage.pageName,
// 		child: PreviewCommodityPage(data: params)
// 	),
// 	CommodityPage.routeName: (uri, params) => RoutePage(
// 		pageName: CommodityPage.pageName,
// 		child: const CommodityPage()
// 	),
// 	ProfilePage.routeName: (uri, params) => RoutePage(
// 		pageName: ProfilePage.pageName,
// 		child: const ProfilePage()
// 	),
// 	AboutUsPage.routeName: (uri, params) => RoutePage(
// 		pageName: AboutUsPage.pageName,
// 		child: const AboutUsPage()
// 	),
// 	ContactUsPage.routeName: (uri, params) => RoutePage(
// 		pageName: ContactUsPage.pageName,
// 		child: const ContactUsPage()
// 	),
// 	PrivacyPolicyPage.routeName: (uri, params) => RoutePage(
// 		pageName: PrivacyPolicyPage.pageName,
// 		child: const PrivacyPolicyPage()
// 	),
// 	TermsOfUsePage.routeName: (uri, params) => RoutePage(
// 		pageName: TermsOfUsePage.pageName,
// 		child: const TermsOfUsePage()
// 	),
// 	OfferDetailsPage.routeName: (uri, params) => RoutePage(
// 		pageName: OfferDetailsPage.pageName,
// 		child: OfferDetailsPage(data: params)
// 	),
// 	OffersPage.routeName: (uri, params) => RoutePage(
// 		pageName: OffersPage.pageName,
// 		child: const OffersPage()
// 	),
// 	InventoryPage.routeName: (uri, params) => RoutePage(
// 		pageName: InventoryPage.pageName,
// 		child: const InventoryPage()
// 	),
// 	WithdrawPage.routeName: (uri, params) => RoutePage(
// 		pageName: WithdrawPage.pageName,
// 		child: const WithdrawPage()
// 	),
// 	GeolocateMyFarm.routeName: (uri, params) => RoutePage(
// 		pageName: GeolocateMyFarm.pageName,
// 		child: const GeolocateMyFarm()
// 	),
// 	WarehousePage.routeName: (uri, params) => RoutePage(
// 		pageName: WarehousePage.pageName,
// 		child: const WarehousePage()
// 	),
// };