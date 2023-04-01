import 'package:flutter/material.dart';

import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/domain/entities/locate_farm_option.dart';

import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';

class GeoLocateMyFarm extends StatefulWidget {
  const GeoLocateMyFarm({Key? key}) : super(key: key);

  @override
  State<GeoLocateMyFarm> createState() => _GeoLocateMyFarmState();
}

class _GeoLocateMyFarmState extends State<GeoLocateMyFarm> {

  late Size size;

  final options = [
    LocateFarmOption(title: TextConstants.notOnYourFarm, description: TextConstants.manuallyGeolocateFarm,),
    LocateFarmOption(title: TextConstants.currentlyOnYourFarm, description: TextConstants.automaticallyGeolocateFarm,),
  ];

  late int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    selectedIndex = -1;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              Container(
                padding: const EdgeInsets.all(Sizes.dimen_16),
                child: Column(
                  children: [
                    PageHeader(title: "Geolocate my farm", onTap: (){},),
                    const SizedBox(height: Sizes.dimen_30,),

                    const Text(
                      TextConstants.findClosest,
                      style: TextStyle(
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Manrope',
                          color: Color(0xFF1B3D1B)
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_62,),

                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: Sizes.dimen_200
                      ),
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: const EdgeInsets.only(bottom: Sizes.dimen_24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  options[index].title,
                                  style: const TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_14,
                                      color: Color(0xFF1B3D1B)
                                  ),
                                ),

                                Container(
                                  height: Sizes.dimen_50,
                                  width: size.width,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.dimen_15,
                                    vertical: Sizes.dimen_14
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                    color: const Color(0xFFEBF5ED)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        options[index].description,
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w500,
                                            fontSize: Sizes.dimen_16,
                                            color: AppColors.primaryColor
                                        ),
                                      ),
                                      Radio(
                                        value: index,
                                        groupValue: selectedIndex,
                                        onChanged: (value){
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                          print('index:\t$index');
                                          switch(index) {
                                            case 0:
                                              Navigator.pushNamed(context, RouteLiterals.geoLocateManuallyRoute,);
                                              break;
                                            case 1:
                                              Navigator.pushNamed(context, RouteLiterals.geoLocateAutomaticallyRoute,);
                                              break;
                                          }
                                        },
                                        fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}