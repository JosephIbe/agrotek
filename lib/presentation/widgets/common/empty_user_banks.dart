import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:flutter/material.dart';

late Size size;

class EmptyUserBanks extends StatelessWidget {

  const EmptyUserBanks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Container(
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
            onClick: ()=> Navigator.pushNamed(context, RouteLiterals.addBankRoute),
          )
        ],
      ),
    );
  }

}