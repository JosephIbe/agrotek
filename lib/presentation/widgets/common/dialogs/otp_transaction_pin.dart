import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/domain/entities/create_pin_params.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class OTPTransactionPIN extends StatefulWidget {

  final String transactionPin;
  const OTPTransactionPIN({Key? key, required this.transactionPin}) : super(key: key);

  @override
  State<OTPTransactionPIN> createState() => _OTPTransactionPINState();
}

class _OTPTransactionPINState extends State<OTPTransactionPIN> {

  late Size size;
  late bool isEnabled = false;

  final pinOneController = TextEditingController();
  final pinTwoController = TextEditingController();
  final pinThreeController = TextEditingController();
  final pinFourController = TextEditingController();
  final pinFiveController = TextEditingController();
  final pinSixController = TextEditingController();

  final passwordController = TextEditingController();

  final focusOne = FocusNode();
  final focusTwo = FocusNode();
  final focusThree = FocusNode();
  final focusFour = FocusNode();
  final focusFive = FocusNode();
  final focusSix = FocusNode();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Center(
        child: Container(
          width: size.width,
          height: Sizes.dimen_431,
          padding: const EdgeInsets.all(Sizes.dimen_16),
          margin: const EdgeInsets.all(Sizes.dimen_16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.dimen_8),
              color: Colors.white
          ),
          child: Material(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextConstants.inputOTP,
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
                  TextConstants.kindlyInputOTP,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.labelColor,
                      fontSize: Sizes.dimen_12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope'
                  ),
                ),
                const SizedBox(height: Sizes.dimen_24,),

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
                              FocusScope.of(context).requestFocus(focusFive);
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
                            controller: pinFiveController,
                            focusNode: focusFive,
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
                              FocusScope.of(context).requestFocus(focusSix);
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
                            controller: pinSixController,
                            focusNode: focusSix,
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
                const SizedBox(height: Sizes.dimen_10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        'Request Another OTP',
                        style: TextStyle(
                          fontSize: Sizes.dimen_12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.dimen_24,),

                Material(
                  child: AgenpoPasswordField(
                    controller: passwordController,
                    hintText: TextConstants.passwordHint,
                    labelText: TextConstants.passwordLabel,
                    onChanged: (v){
                      if(pinOneController.text.isNotEmpty && pinTwoController.text.isNotEmpty
                          && pinThreeController.text.isNotEmpty && pinFourController.text.isNotEmpty
                          && pinFiveController.text.isNotEmpty && pinSixController.text.isNotEmpty && v.length > 3){
                        setState(() {
                          isEnabled = true;
                        });
                      } else {
                        setState(() {
                          isEnabled = false;
                        });
                      }
                    },
                    validator: (v){},
                  ),
                ),
                const SizedBox(height: Sizes.dimen_24,),

                BlocBuilder<WalletBloc, WalletState>(
                  builder: (context, state){
                    return state is WalletStateLoading ? ProgressLoader() : CTAButton(
                      isEnabled: isEnabled,
                      title: 'Create Transaction PIN',
                      isBorderedButton: false,
                      onClick: (){

                        final otp = '${pinOneController.text.trim()}${pinTwoController.text.trim()}${pinThreeController.text.trim()}${pinFourController.text.trim()}${pinFiveController.text.trim()}${pinSixController.text.trim()}';
                        print('otp:\t$otp');

                        final params = CreatePINParams(
                          password: passwordController.text,
                          code: otp,
                          otpChannel: "email",
                          transactionPIN: widget.transactionPin,
                          walletId: Hive.box(DBConstants.appBoxName).get(DBConstants.walletId)
                        );

                        context.read<WalletBloc>().add(CreateTransactionPINEvent(params: params));
                        Navigator.pop(context);
                      },
                    );
                  },
                )

              ],
            ),
          ),
        )
    );
  }

}
