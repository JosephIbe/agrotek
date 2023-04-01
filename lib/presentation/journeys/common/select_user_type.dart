import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/domain/entities/user_role.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class SelectUserRole extends StatefulWidget {
  const SelectUserRole({Key? key}) : super(key: key);

  @override
  State<SelectUserRole> createState() => _SelectUserRoleState();
}

class _SelectUserRoleState extends State<SelectUserRole> {

  late Size size;

  final userRoles = [
    UserRole(title: TextConstants.farmerOnBoardingTitle, description: TextConstants.farmerOnBoardingTitleDesc,),
    UserRole(title: TextConstants.qualityInspectorOnBoardingTitle, description: TextConstants.qualityInspectorOnBoardingTitleDesc,),
    UserRole(title: TextConstants.cooperativeOnBoardingTitle, description: TextConstants.cooperativeOnBoardingTitleDesc,),
    UserRole(title: TextConstants.aggregatorOnBoardingTitle, description: TextConstants.aggregatorOnBoardingTitleDesc,),
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.dimen_16,
            vertical: Sizes.dimen_24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetConstants.svgLogo,),
              const SizedBox(height: Sizes.dimen_60,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      TextConstants.welcome,
                      style: TextStyle(
                          fontSize: Sizes.dimen_18,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1B3D1B)
                      ),
                    ),

                    const Text(
                      TextConstants.chooseUserType,
                      style: TextStyle(
                          fontSize: Sizes.dimen_14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1B3D1B)
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_20,),

                    Expanded(
                      child: GridView.builder(
                        itemCount: userRoles.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          childAspectRatio: .8
                        ),
                        itemBuilder: (context, index){
                          return Container(
                            margin:  EdgeInsets.only(
                              right: index % 2 == 0 ? Sizes.dimen_16 : Sizes.dimen_0,
                                bottom: Sizes.dimen_20
                            ),
                            padding: const EdgeInsets.all(Sizes.dimen_12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                color: selectedIndex == index ? AppColors.primaryLightColor : AppColors.unSelectedUserTypeColor
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Radio(
                                    value: index,
                                    groupValue: selectedIndex,
                                    onChanged: (value){
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      print('index:\t$index');
                                      switch(index){
                                        case 0:
                                          Hive.box(DBConstants.appBoxName).put(DBConstants.userRoleOrType, TextConstants.farmerRoleOrType);
                                          break;
                                        case 1:
                                          Hive.box(DBConstants.appBoxName).put(DBConstants.userRoleOrType, TextConstants.qualityInspectorRoleOrType);
                                          break;
                                        case 2:
                                          Hive.box(DBConstants.appBoxName).put(DBConstants.userRoleOrType, TextConstants.cooperativeRoleOrType);
                                          break;
                                        case 3:
                                          Hive.box(DBConstants.appBoxName).put(DBConstants.userRoleOrType, TextConstants.aggregatorRoleOrType);
                                          break;
                                      }
                                      Navigator.pushNamed(
                                        context,
                                        RouteLiterals.onBoardingRoute,
                                      );
                                    },
                                    fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                  ),
                                ),
                                const SizedBox(height: Sizes.dimen_48,),

                                Text(
                                  userRoles[index].title,
                                  style: const TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Sizes.dimen_16,
                                      color: Color(0xFF1B3D1B)
                                  ),
                                ),

                                Text(
                                  userRoles[index].description,
                                  style: const TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_12,
                                      color: Color(0xFF3D523D)
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}