import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/blocs/offers/offers_bloc.dart';
import 'package:agenpo/presentation/widgets/common/offers_list_item.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveOffers extends StatelessWidget {

  const LiveOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SectionHeader(
                title: TextConstants.liveOffers,
                onTap: ()=> Navigator.pushNamed(context, RouteLiterals.offersRoute)
            ),
            const SizedBox(height: Sizes.dimen_18,),
            
            BlocBuilder<OffersBloc, OffersState>(
              builder: (context, state){
                
                if(state is OffersStateGetAllSuccess){

                  final offers = state.responseModel.offers;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: offers.length > 5 ? 3 : offers.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return OffersListItem(offer: offers[index]);
                    },
                  );
                }
                
                return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor)),);
              },
            )
          ],
        ),
      ),
    );
  }

}