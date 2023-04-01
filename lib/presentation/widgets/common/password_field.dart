import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';

class AgenpoPasswordField extends StatefulWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FormFieldValidator validator;
  final ValueChanged<String>? onChanged;

  const AgenpoPasswordField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    this.onChanged,
    Key? key
  }) : super(key: key);

  @override
  State<AgenpoPasswordField> createState() => _AgenpoPasswordFieldState();
}

class _AgenpoPasswordFieldState extends State<AgenpoPasswordField> {

  late Size size;
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: Sizes.dimen_85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
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
              controller: widget.controller,
              obscureText: isVisible,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.dimen_16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'
              ),
              onChanged: widget.onChanged,
              validator: widget.validator,
              keyboardType: isVisible ? TextInputType.text : TextInputType.visiblePassword,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(
                    Sizes.dimen_20,
                    Sizes.dimen_10,
                    Sizes.dimen_20,
                    Sizes.dimen_0
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: widget.hintText,
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
                suffixIcon: IconButton(
                  onPressed: ()=> setState(()=> isVisible = !isVisible),
                  icon: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}