import 'package:agenpo/data/models/banks_response_model.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/common/route_constants.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmAddBank extends StatelessWidget {

  final AddBankAccountParams params;
  const ConfirmAddBank({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    print(params.toJson());

    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButton(),

                Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageHeader(title: TextConstants.confirmation, onTap: (){}),
                      const SizedBox(height: Sizes.dimen_30,),

                      BlocListener<WalletBloc, WalletState>(
                        listener: (context, state){
                          if(state is WalletStateFailure){
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: const Duration(milliseconds: 4500),
                              backgroundColor: Colors.red,
                              title: 'Add Account Error',
                              icon: const Icon(Icons.error_outline),
                              message: state.errorMessage,
                            ).show(context);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            const Text(
                              TextConstants.forSecurityPurposes,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                fontSize: Sizes.dimen_14
                              ),
                            ),
                            const SizedBox(height: Sizes.dimen_24,),

                            AgenpoPasswordField(
                              labelText: TextConstants.passwordLabel,
                              hintText: TextConstants.passwordHint,
                              controller: passwordController,
                              validator: (v){},
                            ),
                            const SizedBox(height: Sizes.dimen_40,),

                            BlocBuilder<WalletBloc, WalletState>(
                              builder: (context, state){
                                return state is WalletStateLoading
                                    ? const ProgressLoader()
                                    : CTAButton(
                                        title: 'Add Bank',
                                        isEnabled: true,
                                        isBorderedButton: false,
                                        onClick: (){
                                          if(passwordController.text.isEmpty){
                                            Flushbar(
                                              flushbarPosition: FlushbarPosition.TOP,
                                              duration: const Duration(milliseconds: 4500),
                                              backgroundColor: Colors.red,
                                              title: 'Action Failed',
                                              icon: const Icon(Icons.error_outline),
                                              message: 'Please enter your Agenpo password',
                                            ).show(context);
                                          } else {
                                            context.read<WalletBloc>().add(AddBankDetailsEvent(params: params));
                                          }
                                          print(params.toJson());
                                        },
                                    );
                              },
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

late Size size;
