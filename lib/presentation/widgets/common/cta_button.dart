import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

late Size size;

class CTAButton extends StatelessWidget {

  final String title;
  final bool isBorderedButton;
  final bool isEnabled;
  final VoidCallback onClick;
  final double? height;
  final Color? color;

  const CTAButton({
    Key? key,
    required this.title,
    required this.isBorderedButton,
    required this.isEnabled,
    required this.onClick,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onClick : null,
        child: Container(
          width: size.width,
          height: height ?? Sizes.dimen_56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
            color: isBorderedButton ? Colors.white : isEnabled ? color ?? AppColors.primaryColor : const Color(0XFF218838).withOpacity(.5),
            border: isBorderedButton
                ? Border.all(color: AppColors.primaryColor, width: Sizes.dimen_2, style: BorderStyle.solid)
                : Border.all(color: Colors.transparent, width: Sizes.dimen_2, style: BorderStyle.solid)
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Manrope',
                color: isBorderedButton ? AppColors.primaryColor : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
