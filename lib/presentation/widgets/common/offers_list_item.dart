import 'package:agenpo/presentation/blocs/accept_offer/accept_offer_bloc.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/data/models/offer.dart';

import 'package:agenpo/domain/entities/accept_offer_params.dart';

import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/accept_offer.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/offer_accepted.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class OffersListItem extends StatelessWidget {

  final Offer offer;
  const OffersListItem({
    Key? key,
    required this.offer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AcceptOfferBloc, AcceptOfferState>(
      listener: (context, state) {
        if(state is AcceptOfferStateSuccess){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context)=> OfferAccepted(offer: offer),
          );
        }
      },
      child: Material(
        elevation: Sizes.dimen_2,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: Sizes.dimen_107,
          padding: const EdgeInsets.all(Sizes.dimen_8),
          margin: const EdgeInsets.only(bottom: Sizes.dimen_10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.dimen_8)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   child: CachedNetworkImage(
                      //     imageUrl: offer.,
                      //   ),
                      // ),
                      Container(
                        width: Sizes.dimen_24,
                        height: Sizes.dimen_24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor
                        ),
                      ),
                      const SizedBox(width: Sizes.dimen_10,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.tradingCommodity.commodity.name,
                            style: const TextStyle(
                                color: Color(0xFF1B3D1B),
                                fontSize: Sizes.dimen_14,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            offer.trader.userRef ?? 'Offer Ref',
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
                        offer.amount,
                        style: const TextStyle(
                            color: Color(0xFF76482C),
                            fontSize: Sizes.dimen_14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        DateFormat('dd-MMM-yyyy').format(offer.updatedAt),
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

              CTAButton(
                title: TextConstants.accept,
                height: Sizes.dimen_32,
                isEnabled: true,
                isBorderedButton: false,
                onClick: (){
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AcceptOfferPrompt(item: offer)
                  );
                  // final params = AcceptOfferParams(
                  //     offerId: offer.id,
                  //     producerId: Hive.box(DBConstants.appBoxName).get(DBConstants.userId)
                  // );
                  // context.read<OffersBloc>().add(AcceptOfferEvent(params: params));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
