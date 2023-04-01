import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/empty_user_banks.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:agenpo/presentation/widgets/common/user_banks_list.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Withdraw extends StatefulWidget {

  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {

  late Size size;

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(GetUserBanksEvent());
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
                              title: 'Error Loading Your Banks',
                              icon: const Icon(Icons.error_outline),
                              message: state.errorMessage,
                            ).show(context);
                          }
                        },
                        child: BlocBuilder<WalletBloc, WalletState>(
                          builder: (context, state){
                            if(state is WalletStateGetUserBanksSuccess){
                              final banksList = state.responseModel.data;
                              return banksList.isEmpty
                                  ? Container(
                                    width: size.width,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        const Text(
                                          TextConstants.noBankAdded,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: Sizes.dimen_20,
                                              fontFamily: 'Manrope'
                                          ),
                                        ),
                                        const SizedBox(height: Sizes.dimen_8,),

                                        const Text(
                                          TextConstants.processWithdrawals,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: Sizes.dimen_14,
                                              fontFamily: 'Manrope'
                                          ),
                                        ),
                                        const SizedBox(height: Sizes.dimen_40,),

                                        CTAButton(
                                          title: TextConstants.addBankDetails,
                                          isEnabled: true,
                                          isBorderedButton: false,
                                          onClick: ()=> Navigator.pushNamed(context, RouteLiterals.addBankRoute).then((value){
                                            context.read<WalletBloc>().add(GetUserBanksEvent());
                                          }),
                                        )
                                      ],
                                    ),
                                  )
                                  : UserBanksList(banksList: banksList);
                            }
                            return const ProgressLoader();
                          },
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
