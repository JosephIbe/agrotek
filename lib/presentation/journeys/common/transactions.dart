import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/transactions/transactions_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/section_header.dart';
import 'package:agenpo/presentation/widgets/common/transactions_list_item.dart';
import 'package:agenpo/presentation/widgets/common/wallet_balance.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transactions extends StatefulWidget {

  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  late Size size;

  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(GetAllTransactionsEvent());
    context.read<WalletBloc>().add(GetWalletBalanceEvent());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(Sizes.dimen_16,),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      TextConstants.transactions,
                      style: TextStyle(
                          color: Color(0xFF1B3D1B),
                          fontSize: Sizes.dimen_20,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700
                      ),
                    ),

                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: Sizes.dimen_40,
                        height: Sizes.dimen_40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE4F0E6),
                        ),
                        child: Center(
                          child: SvgPicture.asset(AssetConstants.svgNotifications),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Sizes.dimen_22,),

                const WalletBalance(isTransaction: true),
                // BlocBuilder<WalletBloc, WalletState>(
                //   builder: (context, state){
                //     if(state is WalletStateGetBalanceSuccess){
                //       final availableBalance = state.responseModel.data.availableBalance;
                //       return WalletBalance(amount: availableBalance, isTransaction: true);
                //     }
                //     return const ProgressLoader();
                //   },
                // ),
                const SizedBox(height: Sizes.dimen_40,),

                SectionHeader(title: TextConstants.transactions, onTap: (){}),
                const SizedBox(height: Sizes.dimen_16,),

                BlocBuilder<TransactionsBloc, TransactionsState>(
                  builder: (context, state){

                    if(state is TransactionsStateGetAllSuccess){

                      final transactions = state.responseModel.data;

                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: transactions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>  Divider(color: AppColors.hintTextColor),
                          itemBuilder: (context, index){
                            return TransactionsListItem(transaction: transactions[index], index: index);
                          },
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor)),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
