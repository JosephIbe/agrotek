import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/dialogs/set_transaction_pin.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class WalletBalance extends StatefulWidget {

  // final dynamic amount;
  final bool isTransaction;

  const WalletBalance({
    Key? key,
    // required this.amount,
    required this.isTransaction,
  }) : super(key: key);

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {

  late Size size;
  late bool isBalanceVisible;

  @override
  void initState() {
    super.initState();
    isBalanceVisible = false;
    print('has set pin ${Hive.box(DBConstants.appBoxName).get(DBConstants.hasTransactionPIN)}');
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      constraints: const BoxConstraints(
        minHeight: Sizes.dimen_150
      ),
      decoration: BoxDecoration(
        color: widget.isTransaction ? const Color(0xFF62C662) : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(Sizes.dimen_8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_12,
        vertical: Sizes.dimen_8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                TextConstants.walletBalance,
                style: TextStyle(
                  color: Color(0xFFFCFFFC),
                    fontSize: Sizes.dimen_14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500
                ),
              ),
              IconButton(
                onPressed: ()=> setState(()=> isBalanceVisible = !isBalanceVisible),
                icon: Icon(isBalanceVisible ? Icons.visibility : Icons.visibility_off, color: const Color(0xFFE0DBD7),),
              )
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<WalletBloc, WalletState>(
                builder: (context, state){
                  if(state is WalletStateGetBalanceSuccess){
                    final availableBalance = state.responseModel.data.availableBalance;
                    print('availableBalance.runtimeType:\t${availableBalance.runtimeType}');
                    return Text(
                      isBalanceVisible
                          // ? NumberFormat.simpleCurrency(
                          //   locale: 'en_NG', name: "NGN", decimalDigits: 2)
                          //   .format(availableBalance)
                          ? availableBalance
                          : '',
                      style: const TextStyle(
                          color: Color(0xFFFCFFFC),
                          fontSize: Sizes.dimen_32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Manrope'
                      ),
                    );
                  }
                  return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor));
                },
              ),
            ],
          ),

          // Text(
          //   isBalanceVisible ? NumberFormat.simpleCurrency(locale: 'en_NG', name: "NGN", decimalDigits: 2).format(widget.amount) : '',
          //   style: const TextStyle(
          //     color: Color(0xFFFCFFFC),
          //     fontSize: Sizes.dimen_32,
          //     fontWeight: FontWeight.w700,
          //     fontFamily: 'Manrope'
          //   ),
          // ),
          const SizedBox(height: Sizes.dimen_12,),

          widget.isTransaction ? Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    print('wdrw clkd on transactions');
                    if(Hive.box(DBConstants.appBoxName).get(DBConstants.hasTransactionPIN) == false){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context)=> const SetTransactionPIN(),
                      );
                    } else {
                      Navigator.pushNamed(context, RouteLiterals.withdrawalPageRoute);
                    }
                  },
                  child: Container(
                    width: size.width * .5,
                    height: Sizes.dimen_40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10),
                        color: AppColors.primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        TextConstants.withDraw,
                        style: TextStyle(
                          fontSize: Sizes.dimen_16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Sizes.dimen_10,),

              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: size.width * .5,
                    height: Sizes.dimen_40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_10),
                        color: Colors.transparent,
                        border: Border.all(color: AppColors.primaryColor, width: Sizes.dimen_2, style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: Text(
                        TextConstants.managePayment,
                        style: TextStyle(
                          fontSize: Sizes.dimen_16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope',
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ) : CTAButton(
            height: Sizes.dimen_40,
            color: const Color(0xFF62C662),
            onClick: (){
              print('wdrw clkd on home');
              if(Hive.box(DBConstants.appBoxName).get(DBConstants.hasTransactionPIN) == false){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context)=> const SetTransactionPIN(),
                );
              } else {
                Navigator.pushNamed(context, RouteLiterals.withdrawalPageRoute);
              }
            },
            isBorderedButton: false,
            isEnabled: true,
            title: TextConstants.withDraw,
          )

        ],
      ),
    );

  }

}