import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {

  final String title;
  final VoidCallback onTap;

  const SectionHeader({
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
              fontSize: Sizes.dimen_16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope'
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            TextConstants.seeAll,
            style: TextStyle(
                color: Color(0xFF3E933E),
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope'
            ),
          ),
        )
      ],
    );
  }
}
