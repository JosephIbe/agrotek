import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final Function? onTap;
  const AppBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: ()=> Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryColor,
      ),
      label: Text(
        TextConstants.back,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: Sizes.dimen_14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Manrope'),
      ),
    );
  }
}
