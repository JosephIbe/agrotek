import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  late Size size;
  late String userType = 'undefined';

  final controller = PageController();

  final titles = [
    TextConstants.onBoardingTitleOne,
    TextConstants.onBoardingTitleTwo,
    TextConstants.onBoardingTitleThree,
    TextConstants.onBoardingTitleFour,
  ];

  final images = [
    AssetConstants.imgOnBoarding1,
    AssetConstants.imgOnBoarding2,
    AssetConstants.imgOnBoarding3,
    AssetConstants.imgOnBoarding4,
  ];

  @override
  void initState() {
    super.initState();
    userType = Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType);
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width,
                  height: Sizes.dimen_500,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_16,
                      vertical: Sizes.dimen_24
                  ),
                  child: PageView.builder(
                    itemCount: titles.length,
                    controller: controller,
                    itemBuilder: (context, index){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                  child: Image.asset(images[index])
                              ),
                              Text(
                                titles[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color(0xFF1B3D1B),
                                    fontSize: Sizes.dimen_24,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manrope'
                                ),
                              ),
                            ],
                          ),
                          SmoothPageIndicator(
                            count: titles.length,
                            controller: controller,
                            effect: CustomizableEffect(
                              spacing: Sizes.dimen_8,
                              activeDotDecoration: DotDecoration(
                                width: Sizes.dimen_40,
                                borderRadius: BorderRadius.circular(Sizes.dimen_4),
                                height: Sizes.dimen_4,
                                color: AppColors.primaryColor,
                              ),
                              dotDecoration: DotDecoration(
                                width: Sizes.dimen_24,
                                height: Sizes.dimen_4,
                                color: AppColors.grey,
                              )
                            ),
                            onDotClicked: (v){
                              controller.animateToPage(v, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),

              Container(
                alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_16,
                      vertical: Sizes.dimen_24
                  ),
                  child: SvgPicture.asset(AssetConstants.svgLogo,)
              ),
              const SizedBox(height: Sizes.dimen_60,),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Sizes.dimen_90,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_16,
                      vertical: Sizes.dimen_24
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(Sizes.dimen_36), topLeft: Radius.circular(Sizes.dimen_36)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.primaryColor.withOpacity(.2),
                            spreadRadius: 5,
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, RouteLiterals.loginRoute),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.dimen_8),
                              border: Border.all(
                                color: const Color(0xFF3E933E),
                                width: Sizes.dimen_1,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                TextConstants.login,
                                style: TextStyle(
                                  color: Color(0xFF3E933E),
                                  fontSize: Sizes.dimen_16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Manrope'
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: Sizes.dimen_16,),

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            switch(userType) {
                              case TextConstants.farmerRoleOrType:
                                Navigator.pushNamed(context, RouteLiterals.createFarmerOrAggregatorAccountRoute);
                                break;
                              case TextConstants.aggregatorRoleOrType:
                                Navigator.pushNamed(context, RouteLiterals.createFarmerOrAggregatorAccountRoute);
                                break;
                              case TextConstants.cooperativeRoleOrType:
                                Navigator.pushNamed(context, RouteLiterals.createCooperativeAccountRoute);
                                break;
                              case TextConstants.qualityInspectorRoleOrType:
                                Navigator.pushNamed(context, RouteLiterals.createQIAccountRoute);
                                break;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.dimen_8),
                              color: const Color(0xFF3E933E),
                            ),
                            child: const Center(
                              child: Text(
                                TextConstants.createAccount,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.dimen_16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Manrope'
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}