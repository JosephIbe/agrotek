import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/data/models/get_all_offers_response_model.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

late Size size;

class OfferAccepted extends StatelessWidget {

  final dynamic offer;
  const OfferAccepted({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: size.width,
          height: Sizes.dimen_270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.dimen_16),
          ),
          margin: const EdgeInsets.all(Sizes.dimen_16),
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(AssetConstants.svgChecked,),
                const SizedBox(height: Sizes.dimen_24,),

                Text(
                  TextConstants.offerAccepted,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: Sizes.dimen_16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),
                ),
                const SizedBox(height: Sizes.dimen_24,),

                Text(
                  "${offer.tradingCommodity.commodity.name} has been sent to ${offer.trader.userRef}. The amount's worth has been sent to your wallet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: Sizes.dimen_14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor
                  ),
                ),
                const SizedBox(height: Sizes.dimen_24,),

                CTAButton(
                  title: 'View Wallet',
                  isEnabled: true,
                  isBorderedButton: true,
                  onClick: ()=> Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.landingRoute, (route) => false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
