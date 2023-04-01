import 'package:flutter/material.dart';

import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/data/models/user_banks_response_model.dart';

import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawFunds extends StatefulWidget {

  final UserBanks selectedBank;
  const WithdrawFunds({Key? key, required this.selectedBank}) : super(key: key);

  @override
  State<WithdrawFunds> createState() => _WithdrawFundsState();
}

class _WithdrawFundsState extends State<WithdrawFunds> {

  late Size size;

  late bool hasAmount = false;
  late bool isEnabled = false;

  final amountController = TextEditingController();
  final narrationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(GetWalletBalanceEvent());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),

              Expanded(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                  child: Column(
                    children: [
                      PageHeader(title: TextConstants.withDraw, onTap: (){},),
                      const SizedBox(height: Sizes.dimen_30,),

                      BlocListener<WalletBloc, WalletState>(
                        listener: (context, state){
                          if(state is WalletStateFailure){
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: const Duration(milliseconds: 4500),
                              backgroundColor: Colors.red,
                              title: 'Withdrawal Failure',
                              icon: const Icon(Icons.error_outline),
                              message: state.errorMessage,
                            ).show(context);
                          }
                        },
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<WalletBloc, WalletState>(
                                builder: (context, state){
                                  if(state is WalletStateGetBalanceSuccess){
                                    final availableBalance = state.responseModel.data.availableBalance;

                                    return Text(
                                      'Available Balance:\t$availableBalance',
                                      style: const TextStyle(
                                        fontSize: Sizes.dimen_16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Manrope',
                                        color: Color(0xFF76482C)
                                      ),
                                    );

                                  }
                                  return const ProgressLoader();
                                },
                              ),
                              const SizedBox(height: Sizes.dimen_40,),

                              AgenpoInputField(
                                controller: amountController,
                                labelText: TextConstants.amountToWithdraw,
                                hintText: TextConstants.amountHint,
                                isMini: false,
                                inputType: TextInputType.phone,
                                validator: (v){},
                                onChanged: (v){
                                  if(v.length > 2){
                                    setState((){
                                      hasAmount = true;
                                      isEnabled = true;
                                    });
                                  } else {
                                    setState((){
                                      hasAmount = false;
                                      isEnabled = false;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(height: Sizes.dimen_24,),

                              SizedBox(
                                width: size.width,
                                height: Sizes.dimen_150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description (Optional)',
                                      style: TextStyle(
                                          color: AppColors.labelColor,
                                          fontSize: Sizes.dimen_14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Manrope'
                                      ),
                                    ),
                                    const SizedBox(height: Sizes.dimen_5,),

                                    SizedBox(
                                      // height: Sizes.dimen_56,
                                      child: TextFormField(
                                        controller: narrationController,
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
                                          hintText: 'Please enter a description',
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
                                title: TextConstants.withDrawNow,
                                isEnabled: isEnabled,
                                isBorderedButton: false,
                                onClick: (){
                                  showDialog(
                                    context: context,
                                    builder: (_)=> EnterTransactionPIN(
                                      selectedBank: widget.selectedBank,
                                      amount: amountController.text.trim(),
                                      narration: narrationController.text.trim(),
                                    )
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class EnterTransactionPIN extends StatefulWidget {

  final dynamic amount;
  final dynamic narration;
  final UserBanks selectedBank;
  const EnterTransactionPIN({Key? key, required this.selectedBank, required this.amount, required this.narration,}) : super(key: key);

  @override
  State<EnterTransactionPIN> createState() => _EnterTransactionPINState();
}

class _EnterTransactionPINState extends State<EnterTransactionPIN> {

  late Size size;
  late bool isEnabled = false;

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
          height: Sizes.dimen_290,
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
                      TextConstants.enterTransactionPin,
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
                  TextConstants.pleaseEnterTransactionPin,
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
                              if(v.length == 1){
                                FocusScope.of(context).requestFocus(focusTwo);
                              }
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
                              if(v.length == 1){
                                FocusScope.of(context).requestFocus(focusThree);
                              }
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
                              if(v.length == 1){
                                FocusScope.of(context).requestFocus(focusFour);
                              }
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
                              if(v.length == 1 && pinOneController.text.isNotEmpty && pinTwoController.text.isNotEmpty && pinThreeController.text.isNotEmpty){
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  isEnabled = true;
                                });
                              } else if(v.length == 1 || pinOneController.text.isNotEmpty || pinTwoController.text.isNotEmpty || pinThreeController.text.isNotEmpty){
                                setState(() {
                                  isEnabled = false;
                                });
                              } else {
                                setState(() {
                                  isEnabled = false;
                                });
                              }
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
                  ],
                ),
                const SizedBox(height: Sizes.dimen_30,),

                BlocBuilder<WalletBloc, WalletState>(
                  builder: (context, state){
                    return state is WalletStateLoading ? const ProgressLoader() : CTAButton(
                      isEnabled: isEnabled,
                      title: TextConstants.withDraw,
                      isBorderedButton: false,
                      onClick: (){

                        final pin = '${pinOneController.text.trim()}${pinTwoController.text.trim()}${pinThreeController.text.trim()}${pinFourController.text.trim()}';
                        print('pin:\t$pin');

                        final params = InitiateWithdrawalParams(
                          amount: widget.amount,
                          narration: widget.narration ?? "No narration",
                          transactionPin: pin,
                          bankCode: widget.selectedBank.bankCode,
                          bankName: widget.selectedBank.bankName,
                          accountName: widget.selectedBank.accountName,
                          accountNumber: widget.selectedBank.accountNumber,
                        );

                        context.read<WalletBloc>().add(InitiateWithdrawalEvent(params: params));
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.landingRoute, (route) => false);
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

