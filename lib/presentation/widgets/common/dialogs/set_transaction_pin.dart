import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/domain/entities/generate_otp_params.dart';
import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/otp_transaction_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SetTransactionPIN extends StatefulWidget {
  const SetTransactionPIN({Key? key}) : super(key: key);

  @override
  State<SetTransactionPIN> createState() => _SetTransactionPINState();
}

class _SetTransactionPINState extends State<SetTransactionPIN> {

  late Size size;

  final pinOneController = TextEditingController();
  final pinTwoController = TextEditingController();
  final pinThreeController = TextEditingController();
  final pinFourController = TextEditingController();

  final focusOne = FocusNode();
  final focusTwo = FocusNode();
  final focusThree = FocusNode();
  final focusFour = FocusNode();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width,
        height: Sizes.dimen_300,
        padding: const EdgeInsets.all(Sizes.dimen_16),
        margin: const EdgeInsets.all(Sizes.dimen_16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
          color: Colors.white
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextConstants.setTransactionPin,
                  style: TextStyle(
                    color: AppColors.labelColor,
                    fontSize: Sizes.dimen_14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope'
                  ),
                ),

                Material(
                  child: InkWell(
                    onTap: ()=> Navigator.pop(context),
                    child: Container(
                      width: Sizes.dimen_24,
                      height: Sizes.dimen_24,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF5FAF6)
                      ),
                      child: Icon(Icons.close, color: AppColors.labelColor,),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: Sizes.dimen_24,),

            Text(
              TextConstants.setTransactionPinDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: Sizes.dimen_12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope'
              ),
            ),
            const SizedBox(height: Sizes.dimen_32,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: SizedBox(
                    width: Sizes.dimen_44,
                    height: Sizes.dimen_64,
                    child: TextFormField(
                      controller: pinOneController,
                        focusNode: focusOne,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Sizes.dimen_18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                        validator: (v){},
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        obscureText: true,
                        autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        onChanged: (v){
                          FocusScope.of(context).requestFocus(focusTwo);
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusColor: AppColors.primaryLightColor,
                          fillColor: const Color(0xFFFAFAFC),
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
                        )
                    ),
                  ),
                ),
                const SizedBox(width: Sizes.dimen_12,),

                Material(
                  child: SizedBox(
                    width: Sizes.dimen_44,
                    height: Sizes.dimen_64,
                    child: TextFormField(
                        controller: pinTwoController,
                        focusNode: focusTwo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Sizes.dimen_18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                        validator: (v){},
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        obscureText: true,
                        autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        onChanged: (v){
                          FocusScope.of(context).requestFocus(focusThree);
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusColor: AppColors.primaryLightColor,
                          fillColor: const Color(0xFFFAFAFC),
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
                        )
                    ),
                  ),
                ),
                const SizedBox(width: Sizes.dimen_12,),

                Material(
                  child: SizedBox(
                    width: Sizes.dimen_44,
                    height: Sizes.dimen_64,
                    child: TextFormField(
                        controller: pinThreeController,
                        focusNode: focusThree,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Sizes.dimen_18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                        validator: (v){},
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        obscureText: true,
                        autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        onChanged: (v){
                          FocusScope.of(context).requestFocus(focusFour);
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusColor: AppColors.primaryLightColor,
                          fillColor: const Color(0xFFFAFAFC),
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
                        )
                    ),
                  ),
                ),
                const SizedBox(width: Sizes.dimen_12,),

                Material(
                  child: SizedBox(
                    width: Sizes.dimen_44,
                    height: Sizes.dimen_64,
                    child: TextFormField(
                        controller: pinFourController,
                        focusNode: focusFour,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Sizes.dimen_16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                        validator: (v){},
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        obscureText: true,
                        autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1)
                        ],
                        onChanged: (v){
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusColor: AppColors.primaryLightColor,
                          fillColor: const Color(0xFFFAFAFC),
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
                        )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Sizes.dimen_24,),

            CTAButton(
              isEnabled: pinOneController.text.isNotEmpty && pinTwoController.text.isNotEmpty
                && pinThreeController.text.isNotEmpty && pinFourController.text.isNotEmpty,
              title: 'Request OTP',
              isBorderedButton: false,
              onClick: (){
                Navigator.pop(context);
                showDialog(
                  context: (context),
                    barrierDismissible: false,
                  builder: (context) {

                    final params = GenerateOTPParams(email: Hive.box(DBConstants.appBoxName).get(DBConstants.email));
                    print('generate otp params for pin:\t${params.toJson()}');

                    context.read<AuthBloc>().add(GenerateOTPEvent(params: params));

                    final code = '${pinOneController.text.trim()}${pinTwoController.text}${pinThreeController.text}${pinFourController.text}';
                    return OTPTransactionPIN(transactionPin: code);
                  }
                );
              },
            )

          ],
        ),
      ),
    );
  }

}
