import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/di/injector.dart' as di;

import 'package:agenpo/presentation/blocs/kyc/kyc_bloc.dart';

import 'package:agenpo/presentation/widgets/common/end_drawer.dart';
import 'package:agenpo/presentation/journeys/common/transactions.dart';
import 'package:agenpo/presentation/journeys/common/warehouses.dart';
import 'package:agenpo/presentation/journeys/common/dashboard.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/verify_identity.dart';
import 'package:agenpo/presentation/widgets/common/user_header.dart';
import 'package:agenpo/presentation/widgets/common/wallet_balance.dart';

import 'package:agenpo/presentation/journeys/quality_inspectors/dashboard/inspections.dart';
import 'package:agenpo/presentation/journeys/quality_inspectors/dashboard/settings.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  late Size size;
  late int selectedIndex = 0;

  final screens = [
    const Dashboard(),
    // Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
    // Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) != TextConstants.farmerRoleOrType ||
    // Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) != TextConstants.cooperativeRoleOrType ||
    // Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) != TextConstants.aggregatorRoleOrType
    //     ? const Inspections()
    //     : const Warehouses(),
    const Warehouses(),
    Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
        ? const Settings()
        : const Transactions(),
  ];

  @override
  void initState() {
    super.initState();
    print('user role:\t${Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType)}');

    if(Hive.box(DBConstants.appBoxName).get(DBConstants.isBVNVerified) != true
        && Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType)
            != TextConstants.qualityInspectorRoleOrType
    ){
      WidgetsBinding.instance.addPostFrameCallback((_)=> showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_)=> Builder(
          builder: (context) {
              return const VerifyIdentity();
            // );
          }
        ),
      ));
    }

  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return BlocProvider.value(
      value: BlocProvider.of<KycBloc>(context),
      child: SafeArea(
        child: Scaffold(
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            elevation: Sizes.dimen_1,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.dimen_16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextConstants.more,
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.dimen_20,
                            color: AppColors.labelColor),
                      ),
                      Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: ()=> Scaffold.of(context).closeEndDrawer(),
                            child: Container(
                              width: Sizes.dimen_40,
                              height: Sizes.dimen_40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Color(0xFFF5FFF7)),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                  const EndDrawerContent()
                ],
              ),
            ),
          ),
          body: screens[selectedIndex],
          bottomNavigationBar: BottomAppBar(
            child: Material(
              elevation: Sizes.dimen_2,
              color: Colors.white,
              child: Container(
                height: Sizes.dimen_55,
                width: size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: ()=> setState(()=> selectedIndex = 0),
                        child: SizedBox(
                          height: Sizes.dimen_55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(selectedIndex == 0 ? AssetConstants.svgHomeFill : AssetConstants.svgHome),
                              Text(
                                TextConstants.home,
                                style: TextStyle(
                                  color: selectedIndex == 0 ? AppColors.primaryColor : const Color(0xFF8ABE96),
                                  fontWeight: selectedIndex == 0 ? FontWeight.w700 : FontWeight.w400,
                                  fontSize: Sizes.dimen_12,
                                  fontFamily: 'Manrope'
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: ()=> setState(()=> selectedIndex = 1),
                        child: SizedBox(
                          height: Sizes.dimen_55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  selectedIndex == 1
                                      ? Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                        ? AssetConstants.svgInspectionsFill
                                        : AssetConstants.svgWarehouseFill
                                      : Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                        ? AssetConstants.svgInspections
                                        : AssetConstants.svgWarehouse
                              ),
                              Text(
                                Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                    ? TextConstants.inspections
                                    : TextConstants.warehouses,
                                style: TextStyle(
                                    color: selectedIndex == 1 ? AppColors.primaryColor : const Color(0xFF8ABE96),
                                    fontWeight: selectedIndex == 1 ? FontWeight.w700 : FontWeight.w400,
                                    fontSize: Sizes.dimen_12,
                                    fontFamily: 'Manrope'
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: ()=> setState(()=> selectedIndex = 2),
                        child: SizedBox(
                          height: Sizes.dimen_55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  selectedIndex == 2
                                      ? Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                        ? AssetConstants.svgSettingsFill
                                        : AssetConstants.svgTransactionFill
                                      : Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                        ? AssetConstants.svgSettings
                                        : AssetConstants.svgTransaction
                              ),
                              Text(
                                Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType) == TextConstants.qualityInspectorRoleOrType
                                    ? TextConstants.inspections
                                    : TextConstants.transactions,
                                style: TextStyle(
                                    color: selectedIndex == 2 ? AppColors.primaryColor : const Color(0xFF8ABE96),
                                    fontWeight: selectedIndex == 2 ? FontWeight.w700 : FontWeight.w400,
                                    fontSize: Sizes.dimen_12,
                                    fontFamily: 'Manrope'
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: ()=> Scaffold.of(context).openEndDrawer(),
                            child: SizedBox(
                              height: Sizes.dimen_55,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(selectedIndex == 3 ? AssetConstants.svgMoreFill : AssetConstants.svgMore),
                                  Text(
                                    TextConstants.more,
                                    style: TextStyle(
                                        color: selectedIndex == 3 ? AppColors.primaryColor : const Color(0xFF8ABE96),
                                        fontWeight: selectedIndex == 3 ? FontWeight.w700 : FontWeight.w400,
                                        fontSize: Sizes.dimen_12,
                                        fontFamily: 'Manrope'
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottomNavigationBar: Builder(builder: (ctx) {
          //   return BottomNavigationBar(
          //     elevation: Sizes.dimen_1,
          //     backgroundColor: Colors.white,
          //     currentIndex: selectedIndex,
          //     iconSize: Sizes.dimen_20,
          //     onTap: (index) {
          //       print('index:\t$index');
          //       setState(() {
          //         selectedIndex = index;
          //       });
          //       if (index == 3) {
          //         ///todo open drawer
          //         Scaffold.of(ctx).openEndDrawer();
          //         // scaffoldKey.currentState?.openEndDrawer();
          //       }
          //     },
          //     showSelectedLabels: true,
          //     showUnselectedLabels: true,
          //     enableFeedback: true,
          //     type: BottomNavigationBarType.fixed,
          //     selectedItemColor: AppColors.primaryColor,
          //     items: [
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(AssetConstants.svgHome),
          //         label: TextConstants.home,
          //         activeIcon: SvgPicture.asset(AssetConstants.svgHomeFill),
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(AssetConstants.svgWarehouse),
          //         label: TextConstants.warehouses,
          //         activeIcon: SvgPicture.asset(AssetConstants.svgWarehouseFill),
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(AssetConstants.svgTransaction),
          //         label: TextConstants.transactions,
          //         activeIcon: SvgPicture.asset(AssetConstants.svgTransactionFill),
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(AssetConstants.svgMore),
          //         label: TextConstants.more,
          //         activeIcon: SvgPicture.asset(AssetConstants.svgMoreFill),
          //       ),
          //     ],
          //   );
          // }),
        ),
      ),
    );

  }
}
