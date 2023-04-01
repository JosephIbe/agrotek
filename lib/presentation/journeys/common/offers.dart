import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';
import 'package:agenpo/presentation/widgets/common/offers_list_item.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/section_header.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late Size size;

class Offers extends StatelessWidget {

  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButton(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                  child: Column(
                    children: [
                      PageHeader(title: TextConstants.offers, onTap: (){}),
                      const SizedBox(height: Sizes.dimen_22,),

                      BlocBuilder<OffersBloc, OffersState>(
                        builder: (context, state){
                          if(state is OffersStateGetAllSuccess){
                            final offers = state.responseModel.offers;

                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: offers.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index){
                                return OffersListItem(offer: offers[index]);
                              },
                            );
                          }
                          return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
