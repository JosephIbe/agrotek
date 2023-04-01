import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';

late Size size;

class AuthAccountDialog extends StatelessWidget {

  final String title;
  final String description;
  final String actionButtonTitle;
  final VoidCallback onTap;

  const AuthAccountDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.actionButtonTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width,
        height: Sizes.dimen_310,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
        ),
        margin: const EdgeInsets.all(Sizes.dimen_16),
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.dimen_27,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope'
                ),
              ),
              const SizedBox(height: Sizes.dimen_24,),

              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: Sizes.dimen_18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor
                ),
              ),
              const SizedBox(height: Sizes.dimen_24,),

              CTAButton(
                title: actionButtonTitle,
                isEnabled: true,
                isBorderedButton: false,
                onClick: ()=> onTap,
              ),
              const SizedBox(height: Sizes.dimen_24,),

              CTAButton(
                title: TextConstants.cancel,
                isEnabled: true,
                isBorderedButton: true,
                onClick: ()=> Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }

}