import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/common/route_constants.dart';

import 'package:agenpo/data/models/user_banks_response_model.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/user_bank_item.dart';

class UserBanksList extends StatefulWidget {

  final List<UserBanks> banksList;
  const UserBanksList({Key? key, required this.banksList}) : super(key: key);

  @override
  State<UserBanksList> createState() => _UserBanksListState();
}

class _UserBanksListState extends State<UserBanksList> {

  late Size size;

  int selectedBankIndex = -1;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.banksList.length,
              itemBuilder: (context, index){
                return UserBankItem(
                  bank: widget.banksList[index],
                );
              },
            ),
            const SizedBox(height: Sizes.dimen_40,),

            CTAButton(
              isEnabled: true,
              title: TextConstants.updateBank,
              isBorderedButton: true,
              onClick: (){},
            ),
            const SizedBox(height: Sizes.dimen_40,),

            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: ()=> Navigator.pushNamed(context, RouteLiterals.withdrawFundsRoute, arguments: widget.banksList[0]),
                icon: Icon(Icons.arrow_right_alt_sharp, color: AppColors.primaryColor,),
                label: Text(
                  TextConstants.withDraw,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: 'Manrope',
                    fontSize: Sizes.dimen_16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}