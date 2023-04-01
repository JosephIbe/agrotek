import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

late Size size;

class UserAndNotificationsHeader extends StatelessWidget {

  const UserAndNotificationsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: Sizes.dimen_50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: Sizes.dimen_32,
                height: Sizes.dimen_32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFA99C95)
                ),
                child: const Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dimen_18,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.dimen_8,),
              Text(
                'Hello, ${Hive.box(DBConstants.appBoxName).get(DBConstants.userReferenceNumber)}',
                style: TextStyle(
                    color: AppColors.labelColor,
                    fontSize: Sizes.dimen_18,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),

          InkWell(
            onTap: (){},
            child: Container(
              width: Sizes.dimen_40,
              height: Sizes.dimen_40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE4F0E6),
              ),
              child: Center(
                child: SvgPicture.asset(AssetConstants.svgNotifications),
              ),
            ),
          )
        ],
      ),
    );
  }

}