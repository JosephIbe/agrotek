import 'package:agenpo/data/models/get_single_inventory_item_response_model.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/data/models/get_all_inventory_items_response_model.dart';
import 'package:agenpo/data/models/offer.dart';

import 'package:agenpo/presentation/blocs/inventory/inventory_bloc.dart';

import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/offer_accepted.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/accept_offer.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryDetails extends StatefulWidget {

  final InventoryData item;
  const InventoryDetails({Key? key, required this.item}) : super(key: key);

  @override
  State<InventoryDetails> createState() => _InventoryDetailsState();
}

class _InventoryDetailsState extends State<InventoryDetails> {

  late Size size;
  late bool showMore = false;

  @override
  void initState() {
    super.initState();
    context.read<InventoryBloc>().add(LoadSingleInventoryItem(id: widget.item.id.toString()));
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state){

              if(state is InventoryStateGetSingleInventorySuccess){

                List<InventoryOffer> offers = state.responseModel.data.offers;

                return Column(
                  children: [
                    Container(
                      width: size.width,
                      height: Sizes.dimen_250,
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //     image: NetworkImage()
                          // )
                        color: Colors.blue
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Sizes.dimen_16,
                            left: Sizes.dimen_16,
                            right: Sizes.dimen_16,
                            child: Row(
                              children: [
                                Container(
                                  width: Sizes.dimen_80,
                                  height: Sizes.dimen_34,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(Sizes.dimen_8)
                                  ),
                                  child: TextButton.icon(
                                    onPressed: ()=> Navigator.pop(context),
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: AppColors.primaryColor,
                                    ),
                                    label: Text(
                                      TextConstants.back,
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: Sizes.dimen_14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Manrope'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          padding: const EdgeInsets.all(Sizes.dimen_16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width,
                                    height: Sizes.dimen_35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          widget.item.commodity.name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: Sizes.dimen_20,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Manrope'
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                const Text(
                                                  'Warehouse:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Sizes.dimen_10,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Manrope'
                                                  ),
                                                ),
                                                Text(
                                                  widget.item.warehouse.ref!,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Sizes.dimen_14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Manrope'
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: Sizes.dimen_10,),

                                            Column(
                                              children: [
                                                const Text(
                                                  'Inspector:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Sizes.dimen_10,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Manrope'
                                                  ),
                                                ),
                                                Text(
                                                  widget.item.inspector.userRef,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: Sizes.dimen_14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Manrope'
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: Sizes.dimen_24,),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: showMore ? 2 : offers.length,
                                itemBuilder: (context, index){

                                  InventoryOffer offer = offers[index];

                                  return BlocListener<OffersBloc, OffersState>(
                                    listener: (context, state) {
                                      // if(state is OffersStateAcceptOfferSuccess){
                                      //   showDialog(
                                      //     context: context,
                                      //     barrierDismissible: false,
                                      //     builder: (context)=> OfferAccepted(offer: offer),
                                      //   );
                                      // }
                                    },
                                    child: Material(
                                      elevation: Sizes.dimen_2,
                                      color: Colors.white,
                                      child: Container(
                                        width: double.infinity,
                                        height: Sizes.dimen_100,
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
                                                          widget.item.commodity.name,
                                                          style: const TextStyle(
                                                              color: Color(0xFF1B3D1B),
                                                              fontSize: Sizes.dimen_14,
                                                              fontFamily: 'Manrope',
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        Text(
                                                          'offer.updatedAt',
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
                                                      offer.status,
                                                      style: TextStyle(
                                                          color: AppColors.primaryLightColor,
                                                          fontSize: Sizes.dimen_12,
                                                          fontFamily: 'Manrope',
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            BlocBuilder<OffersBloc, OffersState>(
                                              builder: (context, state){
                                                return state is OffersStateAcceptLoading ? const ProgressLoader() : CTAButton(
                                                  title: TextConstants.accept,
                                                  height: Sizes.dimen_32,
                                                  isEnabled: true,
                                                  isBorderedButton: false,
                                                  onClick: (){
                                                    // final params = AcceptOfferParams(
                                                    //     offerId: offer.id,
                                                    //     producerId: Hive.box(DBConstants.appBoxName).get(DBConstants.userId)
                                                    // );
                                                    // context.read<OffersBloc>().add(AcceptOfferEvent(params: params));
                                                    showDialog(
                                                        context: context,
                                                        barrierDismissible: false,
                                                        builder: (context) => AcceptOfferPrompt(item: offer)
                                                    );
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: Sizes.dimen_30,),

                              Visibility(
                                visible: offers.length > 2 ? true : false,
                                // visible: true,
                                child: showMore
                                    ? Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextButton.icon(
                                    label: Text(
                                      'Show More',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Sizes.dimen_14,
                                          fontFamily: 'Manrope'
                                      ),
                                    ),
                                    onPressed: ()=> setState(()=> showMore = !showMore),
                                    icon: Icon(Icons.keyboard_arrow_up, color: AppColors.primaryColor,),
                                  ),
                                ) : Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextButton.icon(
                                    label: Text(
                                      'Show Less',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Sizes.dimen_14,
                                          fontFamily: 'Manrope'
                                      ),
                                    ),
                                    onPressed: ()=> setState(()=> showMore = !showMore),
                                    icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: Sizes.dimen_40,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Specifications',
                                    style: TextStyle(
                                        color: AppColors.labelColor,
                                        fontSize: Sizes.dimen_14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Manrope'
                                    ),
                                  ),
                                  const SizedBox(height: Sizes.dimen_10,),

                                  buildDetailItem(
                                      title: 'Total Available',
                                      value:  widget.item.totalNoOfBags.toString(),
                                      unit: 'kg'
                                  ),
                                  const SizedBox(height: Sizes.dimen_8,),

                                  buildDetailItem(
                                      title: 'Average Net Weight per bag',
                                      value: widget.item.averageNetWeightPerBag.toString(),
                                      unit: 'kg'
                                  ),
                                  const SizedBox(height: Sizes.dimen_16,),

                                  Text(
                                    'Contents',
                                    style: TextStyle(
                                        color: AppColors.labelColor,
                                        fontSize: Sizes.dimen_14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Manrope'
                                    ),
                                  ),
                                  const SizedBox(height: Sizes.dimen_10,),

                                  buildDetailItem(
                                      title: 'Admixture',
                                      value: '0',
                                      unit: '%'
                                  ),
                                  const SizedBox(height: Sizes.dimen_8,),

                                  buildDetailItem(
                                      title: 'Moisture',
                                      value: 0.toString(),
                                      unit: '%'
                                  ),
                                  const SizedBox(height: Sizes.dimen_8,),

                                  buildDetailItem(
                                      title: 'Oil Content',
                                      value:  0.toString(),
                                      unit: '%'
                                  ),
                                  const SizedBox(height: Sizes.dimen_8,),

                                  buildDetailItem(
                                      title: 'FFA',
                                      value: 0.toString(),
                                      unit: '%'
                                  ),

                                  buildDetailItem(
                                      title: 'Purity',
                                      value:  0.toString(),
                                      unit: '%'
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return const ProgressLoader();
            },
          )
        ),
      ),
    );
  }

  buildDetailItem({required String title, required String value, required String unit}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Sizes.dimen_5,
                  height: Sizes.dimen_5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: Sizes.dimen_10,),
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.labelColor,
                      fontSize: Sizes.dimen_14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope'
                  ),
                )
              ],
            )
          ],
        ),
        Text(
          '$value$unit',
          style: TextStyle(
            color: AppColors.labelColor,
            fontSize: Sizes.dimen_14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope'
          ),
        )
      ],
    );
  }

}
