import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickActionsItem extends StatelessWidget {

  final String asset;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;

  const QuickActionsItem({
    Key? key,
    required this.asset,
    required this.title,
    required this.onTap,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: Sizes.dimen_99,
              height: Sizes.dimen_75,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF5ED),
                borderRadius: BorderRadius.circular(Sizes.dimen_8)
              ),
              child: Center(
                child: SvgPicture.asset(asset, color: iconColor, width: Sizes.dimen_36, height: Sizes.dimen_40,),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: Sizes.dimen_14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope'
              ),
            )
          ],
        ),
      ),
    );
  }

}
