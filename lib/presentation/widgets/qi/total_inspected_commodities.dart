import 'package:flutter/material.dart';

import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

late Size size;

class TotalInspectedCommodities extends StatelessWidget {

  final int commoditiesCount;

  const TotalInspectedCommodities({
    Key? key,
    required this.commoditiesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width,
      height: Sizes.dimen_104,
      padding: const EdgeInsets.all(Sizes.dimen_12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8),
        color: const Color(0xFF76482C),
      ),
      child: Column(
        children: [
          Text(
            'You have Inspected $commoditiesCount Commodities',
            style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.dimen_14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_18,),

          InkWell(
            onTap: (){},
            child: Container(
              width: size.width,
              height: Sizes.dimen_40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.dimen_8),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  TextConstants.inspectMore,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: Sizes.dimen_16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope'
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

}