import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

class PageHeader extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

  const PageHeader({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color(0xFF1B3D1B),
              fontSize: Sizes.dimen_20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope'
          ),
        ),
        IconButton(
          onPressed: ()=> onTap,
          icon: Icon(Icons.notifications, color: AppColors.primaryColor,),
        )
      ],
    );
  }

}