import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:agenpo/common/route_constants.dart';

import 'package:agenpo/presentation/journeys/common/withdraw_funds.dart';
import 'package:agenpo/presentation/journeys/common/verify_farmer_aggregator.dart';
import 'package:agenpo/presentation/journeys/common/landing.dart';
import 'package:agenpo/presentation/journeys/common/login.dart';
import 'package:agenpo/presentation/journeys/common/change_password.dart';
import 'package:agenpo/presentation/journeys/common/forgot_password.dart';
import 'package:agenpo/presentation/journeys/common/inventory_details.dart';
import 'package:agenpo/presentation/journeys/common/add_bank.dart';
import 'package:agenpo/presentation/journeys/common/confirm_add_bank.dart';
import 'package:agenpo/presentation/journeys/common/select_user_type.dart';
import 'package:agenpo/presentation/journeys/common/onboarding.dart';
import 'package:agenpo/presentation/journeys/common/about_us.dart';
import 'package:agenpo/presentation/journeys/common/contact_us.dart';
import 'package:agenpo/presentation/journeys/common/geo_locate_my_farm.dart';
import 'package:agenpo/presentation/journeys/common/inventory.dart';
import 'package:agenpo/presentation/journeys/common/offers.dart';
import 'package:agenpo/presentation/journeys/common/profile.dart';
import 'package:agenpo/presentation/journeys/common/withdraw.dart';

import 'package:agenpo/presentation/journeys/cooperatives/create_cooperative_account.dart';

import 'package:agenpo/presentation/journeys/farmers/main/automatically_locate_farm.dart';
import 'package:agenpo/presentation/journeys/farmers/main/geo_location_success.dart';
import 'package:agenpo/presentation/journeys/farmers/main/manually_locate_farm.dart';
import 'package:agenpo/presentation/journeys/farmers/auth/create_farmer_account.dart';

import 'package:agenpo/presentation/journeys/quality_inspectors/auth/create_qi_account.dart';
import 'package:agenpo/presentation/journeys/quality_inspectors/dashboard/settings.dart';

import 'package:agenpo/presentation/widgets/common/withdrawal_success.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLiterals.selectUserRoleRoute:
        return CupertinoPageRoute(builder: (_) => const SelectUserRole());
      case RouteLiterals.onBoardingRoute:
        return CupertinoPageRoute(builder: (_) => const OnBoarding());
      case RouteLiterals.loginRoute:
        return CupertinoPageRoute(builder: (_) => const Login());
      case RouteLiterals.forgotPasswordRoute:
        return CupertinoPageRoute(builder: (_) => const ForgotPassword());
      case RouteLiterals.changePasswordRoute:
        return CupertinoPageRoute(builder: (_) => const ChangePassword());
      case RouteLiterals.createFarmerOrAggregatorAccountRoute:
        return CupertinoPageRoute(
            builder: (_) => const CreateFarmerOrAggregatorAccount());
      case RouteLiterals.createQIAccountRoute:
        return CupertinoPageRoute(builder: (_) => const CreateQIAccount());
      case RouteLiterals.createCooperativeAccountRoute:
        return CupertinoPageRoute(
            builder: (_) => const CreateCooperativeAccount());
      case RouteLiterals.verifyCodeRoute:
        dynamic arguments = settings.arguments;
        return CupertinoPageRoute(
            builder: (_) =>
                VerifyFarmerOrAggregatorEmail(arguments: arguments));
      case RouteLiterals.landingRoute:
        return CupertinoPageRoute(builder: (_) => const Landing());
      case RouteLiterals.withdrawalPageRoute:
        return CupertinoPageRoute(builder: (_) => const Withdraw());
      case RouteLiterals.withdrawFundsRoute:
        dynamic selectedBank = settings.arguments;
        return CupertinoPageRoute(builder: (_) => WithdrawFunds(selectedBank: selectedBank,));
      case RouteLiterals.withdrawSuccessRoute:
        dynamic arguments = settings.arguments;
        return CupertinoPageRoute(builder: (_) => WithdrawalSuccess(args: arguments,));
      case RouteLiterals.addBankRoute:
        return CupertinoPageRoute(builder: (_) => const AddBank());
      case RouteLiterals.confirmAddBankRoute:
        dynamic args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => ConfirmAddBank(params: args,));
      case RouteLiterals.offersRoute:
        return CupertinoPageRoute(builder: (_) => const Offers());
      case RouteLiterals.geoLocateMyFarmRoute:
        return CupertinoPageRoute(builder: (_) => const GeoLocateMyFarm());
      case RouteLiterals.geoLocateManuallyRoute:
        return CupertinoPageRoute(builder: (_) => const ManuallyLocateFarm());
      case RouteLiterals.geoLocateAutomaticallyRoute:
        return CupertinoPageRoute(
            builder: (_) => const AutomaticallyLocateFarm());
      case RouteLiterals.geoLocationSuccessRoute:
        return CupertinoPageRoute(builder: (_) => const GeoLocationSuccess());
      case RouteLiterals.inventoryRoute:
        return CupertinoPageRoute(builder: (_) => const Inventory());
      case RouteLiterals.inventoryDetailsRoute:
        dynamic args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => InventoryDetails(item: args));
      case RouteLiterals.profileRoute:
        return CupertinoPageRoute(builder: (_) => const Profile());
      case RouteLiterals.settingsRoute:
        return CupertinoPageRoute(builder: (_) => const Settings());
      case RouteLiterals.aboutUsRoute:
        return CupertinoPageRoute(builder: (_) => const AboutUs());
      case RouteLiterals.contactUsRoute:
        return CupertinoPageRoute(builder: (_) => const ContactUs());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route specified for ${settings.name}'),
                  ),
                ));
    }
  }
}
