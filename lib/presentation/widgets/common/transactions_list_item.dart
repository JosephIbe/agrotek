import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/data/models/get_all_transactions_response_model.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TransactionsListItem extends StatelessWidget {

  final Transaction transaction;
  final int index;

  const TransactionsListItem({
    Key? key,
    required this.transaction,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.dimen_60,
      padding: const EdgeInsets.all(Sizes.dimen_8),
      margin: const EdgeInsets.only(bottom: Sizes.dimen_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl:  transaction.tradingCommodity.isNotEmpty
                          ? transaction.tradingCommodity[0].commodity.imageUrl
                          : "https://picsum.photos",
                    ),
                  ),
                  // Container(
                  //   width: Sizes.dimen_40,
                  //   height: Sizes.dimen_40,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: AppColors.primaryColor
                  //   ),
                  // ),
                  const SizedBox(width: Sizes.dimen_10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.naration ?? 'Transaction Name',
                        style: const TextStyle(
                            color: Color(0xFF1B3D1B),
                            fontSize: Sizes.dimen_14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        transaction.tradingCommodity.isNotEmpty
                            ? transaction.tradingCommodity[0].ref
                            : "no-ref",
                        style: const TextStyle(
                            color: Color(0xFF1B3D1B),
                            fontSize: Sizes.dimen_12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    transaction.amount,
                    style: const TextStyle(
                        color: Color(0xFF76482C),
                        fontSize: Sizes.dimen_14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(transaction.updatedAt),
                    style: const TextStyle(
                        color: Color(0xFF3D523D),
                        fontSize: Sizes.dimen_12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}