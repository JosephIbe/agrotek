import 'package:agenpo/common/text_constants.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

late Size size;

class InspectionsOverView extends StatelessWidget {

  final int allInspectionsCount;
  final int todayInspectionsCount;
  final int monthlyInspectionsCount;

  const InspectionsOverView({
    Key? key,
    required this.allInspectionsCount,
    required this.todayInspectionsCount,
    required this.monthlyInspectionsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: Sizes.dimen_134,
      child: Row(
        children: [
          Container(
            width: Sizes.dimen_118,
            height: Sizes.dimen_134,
            padding: const EdgeInsets.all(Sizes.dimen_10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(Sizes.dimen_8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  TextConstants.allInspections,
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: Sizes.dimen_12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope'
                  ),
                ),

                Text(
                  '$allInspectionsCount',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dimen_28,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope'
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Container(
                    height: Sizes.dimen_40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF62C662),
                      borderRadius: BorderRadius.circular(Sizes.dimen_8),
                    ),
                    child: const Center(
                      child: Text(
                        'View',
                        style: TextStyle(
                          color: Color(0xFFFCFFFC),
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
          ),
          const SizedBox(width: Sizes.dimen_10,),

          Expanded(
            child: Container(
              width: size.width,
              height: Sizes.dimen_134,
              padding: const EdgeInsets.all(Sizes.dimen_10),
              decoration: BoxDecoration(
                color: const Color(0xFF8ABE96),
                borderRadius: BorderRadius.circular(Sizes.dimen_8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        TextConstants.todayInspections,
                        style: TextStyle(
                            color: Color(0xFFFCFFFC),
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                      ),

                      Text(
                        '$todayInspectionsCount',
                        style: const TextStyle(
                            color: Color(0xFFFCFFFC),
                            fontSize: Sizes.dimen_20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope'
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        TextConstants.thisMonthInspections,
                        style: TextStyle(
                            color: Color(0xFFFCFFFC),
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                      ),

                      Text(
                        '$monthlyInspectionsCount',
                        style: const TextStyle(
                            color: Color(0xFFFCFFFC),
                            fontSize: Sizes.dimen_20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope'
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
