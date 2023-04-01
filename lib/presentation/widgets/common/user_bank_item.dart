import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/data/models/user_banks_response_model.dart';
import 'package:flutter/material.dart';

class UserBankItem extends StatelessWidget {

  final UserBanks bank;
  const UserBankItem({Key? key, required this.bank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.dimen_120,
      padding: const EdgeInsets.all(Sizes.dimen_16),
      decoration: BoxDecoration(
        color: const Color(0xFF2B662B),
        borderRadius: BorderRadius.circular(Sizes.dimen_8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bank.accountName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.dimen_16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_16,),

          Text(
            bank.accountNumber,
            style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope'
            ),
          ),
          const SizedBox(height: Sizes.dimen_4,),

          Text(
            bank.bankName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.dimen_16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope'
            ),
          ),
        ],
      ),
    );
  }
}
