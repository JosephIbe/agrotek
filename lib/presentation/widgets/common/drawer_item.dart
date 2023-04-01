import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';

import 'package:flutter_svg/flutter_svg.dart';

late Size size;

class DrawerItem extends StatelessWidget {

  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: Sizes.dimen_47,
        padding: const EdgeInsets.all(Sizes.dimen_12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_4),
          color: const Color(0xFFF0F5F0)
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, height: Sizes.dimen_17,),
            const SizedBox(width: Sizes.dimen_10,),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Manrope',
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3D523D)
              ),
            )
          ],
        ),
      ),
    );
  }

}