import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

late Size size;

class AgenpoInputField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator validator;
  final ValueChanged<String>? onChanged;
  final bool isMini;
  final TextInputType inputType;

  const AgenpoInputField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.onChanged,
    required this.isMini,
    required this.inputType,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SizedBox(
      width: isMini ? size.width * .447 : size.width,
      height: Sizes.dimen_85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: AppColors.labelColor,
              fontSize: Sizes.dimen_14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_5,),

          SizedBox(
            height: Sizes.dimen_56,
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.dimen_16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'
              ),
              validator: validator,
              onChanged: onChanged,
              keyboardType: inputType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(
                    Sizes.dimen_20,
                    Sizes.dimen_10,
                    Sizes.dimen_20,
                    Sizes.dimen_0
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: hintText,
                focusColor: AppColors.primaryLightColor,
                hintStyle: TextStyle(
                    color: AppColors.hintTextColor,
                    fontSize: Sizes.dimen_16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope'
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                  borderSide: BorderSide(color: AppColors.inputBorderColor)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.primaryLightColor,
                        width: Sizes.dimen_1,
                        style: BorderStyle.solid
                    )
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.errorColor,
                        width: Sizes.dimen_1,
                        style: BorderStyle.solid
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}