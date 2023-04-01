import 'package:flutter/material.dart';

import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/geolocate_farm/geolocate_farm_bloc.dart';
import 'package:agenpo/presentation/blocs/geolocate_farm/geolocate_farm_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ManuallyLocateFarm extends StatefulWidget {
  const ManuallyLocateFarm({Key? key}) : super(key: key);

  @override
  State<ManuallyLocateFarm> createState() => _ManuallyLocateFarmState();
}

class _ManuallyLocateFarmState extends State<ManuallyLocateFarm> {

  late Size size;

  @override
  void initState() {
    super.initState();
    context.read<GeolocateFarmBloc>().add(GetUserLocation());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: Sizes.dimen_155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter farm address'
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: Icon(Icons.arrow_back, color: AppColors.primaryColor,),
                                label: Text(
                                  TextConstants.autoLocateWhenOnFarm,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_14,
                                      fontFamily: "Manrope"
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Expanded(
                child: BlocBuilder<GeolocateFarmBloc, GeolocateFarmState>(
                  builder: (context, state) {
                    if(state is GeolocateFarmStateSuccess){
                      return Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(state.position.latitude, state.position.longitude),
                                zoom: Sizes.dimen_15
                            ),
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                          ),
                          Positioned(
                            left: Sizes.dimen_40,
                            right: Sizes.dimen_40,
                            bottom: Sizes.dimen_70,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: Sizes.dimen_20),
                              child: CTAButton(
                                isBorderedButton: false,
                                isEnabled: state.position.latitude.toInt() > 0 && state.position.longitude .toInt() > 0 ? true : false,
                                title: TextConstants.geolocate,
                                color: AppColors.primaryColor,
                                onClick: ()=> Navigator.pushNamed(context, RouteLiterals.geoLocationSuccessRoute),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const ProgressLoader();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}