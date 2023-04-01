import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/data/models/offer.dart';

import 'package:agenpo/domain/entities/accept_offer_params.dart';

import 'package:agenpo/presentation/blocs/accept_offer/accept_offer_bloc.dart';
import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/offer_accepted.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

late Size size;

class AcceptOfferPrompt extends StatelessWidget {

  final dynamic item;
  const AcceptOfferPrompt({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width,
        height: Sizes.dimen_240,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
        ),
        margin: const EdgeInsets.all(Sizes.dimen_16),
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: SingleChildScrollView(
          child: Material(
            child: BlocListener<AcceptOfferBloc, AcceptOfferState>(
              listener: (context, state) {
                if(state is AcceptOfferStateSuccess){
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context)=> OfferAccepted(offer: item),
                  );
                }
              },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: ()=> Navigator.pop(context),
                      child: Container(
                        width: Sizes.dimen_40,
                        height: Sizes.dimen_40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF5FFF7)
                        ),
                        child: const Center(
                          child: Icon(Icons.close, color: Colors.black,),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.dimen_24,),

                Text(
                  'By accepting ${item.trader.userRef} bid of',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: Sizes.dimen_12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.labelColor
                  ),
                ),

                Text(
                  '${item.amount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: Sizes.dimen_24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor
                  ),
                ),

                Text(
                  '${item.tradingCommodity.totalNetWeight}kg ${item.tradingCommodity.commodity.name} will be sent to ${item.trader.userRef}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: Sizes.dimen_12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.labelColor
                  ),
                ),
                const SizedBox(height: Sizes.dimen_24,),

                BlocBuilder<AcceptOfferBloc, AcceptOfferState>(
                  builder: (context, state){
                    return state is AcceptOfferStateLoading ? const ProgressLoader() : CTAButton(
                      title: 'Accept',
                      isEnabled: true,
                      isBorderedButton: false,
                      onClick: (){
                        final params = AcceptOfferParams(
                            offerId: item.id,
                            producerId: Hive.box(DBConstants.appBoxName).get(DBConstants.userId)
                        );
                        context.read<AcceptOfferBloc>().add(AcceptPendingOfferEvent(params: params));
                      },
                    );
                  },
                )
              ],
            ),
),
          ),
        ),
      ),
    );
  }

}
