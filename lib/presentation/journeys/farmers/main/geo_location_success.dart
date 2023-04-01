import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/section_header.dart';

import 'package:flutter_svg/flutter_svg.dart';

late Size size;

class GeoLocationSuccess extends StatelessWidget {

  const GeoLocationSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PageHeader(title: TextConstants.geoLocateMyFarm, onTap: (){}),
                    SizedBox(height: size.height * .2),

                    SvgPicture.asset(AssetConstants.svgDocumentClock),
                    const SizedBox(height: Sizes.dimen_30,),

                    Text(
                      TextConstants.geoLocationSuccess,
                      style: TextStyle(
                        color: AppColors.labelColor,
                        fontSize: Sizes.dimen_16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Manrope'
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_16,),

                    Text(
                      TextConstants.currentlyVerifyingLocation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.labelColor,
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Manrope'
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_53,),

                    CTAButton(
                      title: TextConstants.backToHome,
                      isBorderedButton: true,
                      isEnabled: true,
                      onClick: ()=> Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.landingRoute, (route) => false),
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
