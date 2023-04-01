import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';

import 'package:agenpo/presentation/widgets/common/quick_actions.dart';
import 'package:agenpo/presentation/widgets/common/user_header.dart';
import 'package:agenpo/presentation/widgets/common/wallet_balance.dart';
import 'package:agenpo/presentation/widgets/common/live_offers.dart';

import 'package:agenpo/presentation/widgets/qi/total_inspected_commodities.dart';
import 'package:agenpo/presentation/widgets/qi/inspections_overview.dart';
import 'package:agenpo/presentation/widgets/qi/recent_inspections.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late Size size;
  late String role = "undefined";

  @override
  void initState() {
    super.initState();
    context.read<OffersBloc>().add(GetAllOffersEvent());
    context.read<WalletBloc>().add(GetWalletBalanceEvent());
    role = Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType);
    print('role:\t$role');
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(Sizes.dimen_16,),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAndNotificationsHeader(),
                const SizedBox(height: Sizes.dimen_31,),

                role != TextConstants.farmerRoleOrType &&
                    role != TextConstants.aggregatorRoleOrType &&
                    role != TextConstants.cooperativeRoleOrType
                    ? const InspectionsOverView(
                        allInspectionsCount: 3981,
                        todayInspectionsCount: 59,
                        monthlyInspectionsCount: 159,
                      )
                        : const WalletBalance(isTransaction: false),
                    // : BlocBuilder<WalletBloc, WalletState>(
                    //     builder: (context, state){
                    //       if(state is WalletStateGetBalanceSuccess){
                    //         final availableBalance = state.responseModel.data.availableBalance;
                    //         return WalletBalance(amount: availableBalance, isTransaction: false);
                    //       }
                    //       return const ProgressLoader();
                    //     },
                    //   ),
                role != TextConstants.farmerRoleOrType &&
                    role != TextConstants.aggregatorRoleOrType &&
                    role != TextConstants.cooperativeRoleOrType
                    ? const SizedBox(height: Sizes.dimen_16,)
                    : const SizedBox(height: Sizes.dimen_40,),

                role != TextConstants.farmerRoleOrType &&
                    role != TextConstants.aggregatorRoleOrType &&
                    role != TextConstants.cooperativeRoleOrType
                    ? const TotalInspectedCommodities(commoditiesCount: 3981,)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            TextConstants.quickActions,
                            style: TextStyle(
                                color: Color(0xFF1B3D1B),
                                fontSize: Sizes.dimen_16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Manrope'
                            ),
                          ),
                          SizedBox(height: Sizes.dimen_16,),
                          QuickActions(),
                        ],
                ),
                const SizedBox(height: Sizes.dimen_40,),

                // Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType)
                //     == TextConstants.qualityInspectorRoleOrType ? const RecentInspections(): const LiveOffers(),
                role != TextConstants.farmerRoleOrType &&
                    role != TextConstants.aggregatorRoleOrType &&
                    role != TextConstants.cooperativeRoleOrType
                    ? const RecentInspections() : const LiveOffers()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
