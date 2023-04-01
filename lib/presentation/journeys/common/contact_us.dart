import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/phone_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  late Size size;
  late bool isEnabled = false;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Sizes.dimen_16, Sizes.dimen_16, Sizes.dimen_16, Sizes.dimen_0,),
                    child: SvgPicture.asset(AssetConstants.svgLogo, height: Sizes.dimen_40),
                  ),
                  const SizedBox(height: Sizes.dimen_12,),
                  const AppBackButton(),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16,
                          vertical: Sizes.dimen_24
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            TextConstants.contactUs,
                            style: TextStyle(
                                fontSize: Sizes.dimen_24,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1B3D1B)
                            ),
                          ),

                          const Text(
                            TextConstants.ourResponseTime,
                            style: TextStyle(
                                fontSize: Sizes.dimen_16,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B3D1B)
                            ),
                          ),
                          const SizedBox(height: Sizes.dimen_24,),

                          /// Full Name Input
                          AgenpoInputField(
                            controller: fullNameController,
                            labelText: TextConstants.fullNameLabel,
                            hintText: TextConstants.fullNameHint,
                            inputType: TextInputType.text,
                            isMini: false,
                            validator: (v){},
                            onChanged: (v){},
                          ),
                          const SizedBox(height: Sizes.dimen_16,),

                          /// Email Input
                          AgenpoInputField(
                            controller: emailController,
                            labelText: TextConstants.emailLabel,
                            hintText: TextConstants.emailHint,
                            inputType: TextInputType.text,
                            isMini: false,
                            validator: (v){},
                            onChanged: (v){},
                          ),
                          const SizedBox(height: Sizes.dimen_16,),

                          /// Phone Number Input
                          Text(
                            TextConstants.phoneLabel,
                            style: TextStyle(
                                color: AppColors.labelColor,
                                fontSize: Sizes.dimen_14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope'
                            ),
                          ),
                          const SizedBox(height: Sizes.dimen_5,),

                          PhoneInput(
                            controller: phoneController,
                          ),
                          const SizedBox(height: Sizes.dimen_16,),

                          /// Message Input
                          SizedBox(
                            width: size.width,
                            height: Sizes.dimen_150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enter message',
                                  style: TextStyle(
                                      color: AppColors.labelColor,
                                      fontSize: Sizes.dimen_14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope'
                                  ),
                                ),
                                const SizedBox(height: Sizes.dimen_5,),

                                SizedBox(
                                  child: TextFormField(
                                    controller: messageController,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: Sizes.dimen_16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Manrope'
                                    ),
                                    minLines: 5,
                                    maxLines: 8,
                                    maxLength: null,
                                    validator: (v){},
                                    onChanged: (v){},
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          Sizes.dimen_20,
                                          Sizes.dimen_10,
                                          Sizes.dimen_20,
                                          Sizes.dimen_0
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      hintText: 'Enter message',
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
                          ),
                          const SizedBox(height: Sizes.dimen_40,),

                          CTAButton(
                            title: TextConstants.submit,
                            isBorderedButton: false,
                            isEnabled: isEnabled,
                            onClick: (){},
                          ),
                          const SizedBox(height: Sizes.dimen_40,),

                         Expanded(
                           child: Column(
                             children: [
                               Text(
                                 TextConstants.moreWaysToConnect,
                                 style: TextStyle(
                                     color: AppColors.labelColor,
                                     fontFamily: 'Manrope',
                                     fontWeight: FontWeight.w500,
                                     fontSize: Sizes.dimen_18
                                 ),
                               ),

                               Text(
                                 TextConstants.subscribeNewsLetter,
                                 style: TextStyle(
                                     color: AppColors.labelColor,
                                     fontFamily: 'Manrope',
                                     fontWeight: FontWeight.w400,
                                     fontSize: Sizes.dimen_16
                                 ),
                               ),
                             ],
                           ),
                         )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
