import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/domain/entities/locate_farm_option.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';

import 'package:flutter_svg/flutter_svg.dart';

class EmptyWarehouses extends StatelessWidget {

  EmptyWarehouses({Key? key}) : super(key: key);

  final options = [
    LocateFarmOption(title: TextConstants.notOnYourFarm, description: TextConstants.manuallyGeolocateFarm,),
    LocateFarmOption(title: TextConstants.currentlyOnYourFarm, description: TextConstants.automaticallyGeolocateFarm,),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetConstants.svgInfoError),
          const SizedBox(height: Sizes.dimen_30,),

          const Text(
            TextConstants.noWarehouseFound,
            style: TextStyle(
                color: Color(0xFFA34C1D),
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_16,),

          Text(
            TextConstants.pleaseGeoLocateFarmToSeeWarehouses,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.labelColor,
                fontSize: Sizes.dimen_14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_40,),

          SizedBox(
            height: Sizes.dimen_190,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(bottom: Sizes.dimen_24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        options[index].title,
                        style: const TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            fontSize: Sizes.dimen_14,
                            color: Color(0xFF1B3D1B)
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_6,),

                      index == 0 ? CTAButton(
                        title: options[index].description,
                        isEnabled: true,
                        onClick: ()=> Navigator.pushNamed(context, RouteLiterals.geoLocateManuallyRoute,),
                        isBorderedButton: false,
                      ) : CTAButton(
                            title: options[index].description,
                            isEnabled: true,
                            onClick: ()=> Navigator.pushNamed(context, RouteLiterals.geoLocateAutomaticallyRoute,),
                            isBorderedButton: true,
                        ),

                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}