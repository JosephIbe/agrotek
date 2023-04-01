import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/widgets/common/dialogs/auth_action.dart';
import 'package:agenpo/presentation/widgets/common/drawer_item.dart';

import 'package:flutter_svg/svg.dart';

class EndDrawerContent extends StatelessWidget {

  const EndDrawerContent({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: Sizes.dimen_24,),
              DrawerItem(
                  iconPath: AssetConstants.svgOfferFill,
                  title: TextConstants.offers,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.offersRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgMarker,
                  title: TextConstants.geoLocateMyFarm,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.geoLocateMyFarmRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgWarehouse,
                  title: TextConstants.inventory,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.inventoryRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgUser,
                  title: TextConstants.profile,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.profileRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgSettingsFill,
                  title: TextConstants.settings,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.settingsRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgAboutUs,
                  title: TextConstants.aboutUs,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.aboutUsRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

              DrawerItem(
                  iconPath: AssetConstants.svgContact,
                  title: TextConstants.contactUs,
                  onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.contactUsRoute)
              ),
              const SizedBox(height: Sizes.dimen_12,),

            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AuthAccountDialog(
                              title: "Log Out",
                              description: TextConstants.logOutDescription,
                              actionButtonTitle: "Log Out",
                              onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.loginRoute, (route) => false),
                          )
                    );
                  },
                  icon: SvgPicture.asset(AssetConstants.svgLogOut),
                  label: const Text(
                    TextConstants.logOut,
                    style: TextStyle(
                        color: Color(0xFFF06C6E),
                        fontSize: Sizes.dimen_14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope'
                    ),
                  ),
                ),

                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    showDialog(
                      context: (context),
                      barrierDismissible: false,
                      builder: (context) => AuthAccountDialog(
                        title: TextConstants.deleteAccount,
                        description: TextConstants.deleteAccountDescription,
                        actionButtonTitle: TextConstants.deleteAccount,
                        onTap: (){},
                      )
                    );
                  },
                  child: const Text(
                    TextConstants.deleteAccount,
                    style: TextStyle(
                        color: Color(0xFFF06C6E),
                        fontSize: Sizes.dimen_14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Manrope'
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
