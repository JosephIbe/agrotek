import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/common/size_constants.dart';

import 'package:agenpo/presentation/widgets/common/quick_actions_item.dart';

import 'package:hive/hive.dart';

class QuickActions extends StatefulWidget {


  const QuickActions({Key? key}) : super(key: key);

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {

  late Size size;

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: Sizes.dimen_100,
      child: Row(
        children: [
          QuickActionsItem(
            color: const Color(0xFFEDF5ED),
            iconColor: AppColors.primaryColor,
            asset: AssetConstants.svgWarehouseFill,
            title: TextConstants.warehouses,
            onTap: (){},
          ),
          Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType)
              == TextConstants.cooperativeRoleOrType
              ? QuickActionsItem(
                color: const Color(0xFFF5F2F0),
                iconColor: const Color(0xFF76482C),
                asset: AssetConstants.svgInviteUser,
                title: TextConstants.inviteUsers,
                onTap: (){
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context){
                      return Center(
                        child: Container(
                          width: size.width,
                          height: Sizes.dimen_390,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.dimen_16),
                          ),
                          margin: const EdgeInsets.all(Sizes.dimen_16),
                          padding: const EdgeInsets.all(Sizes.dimen_24),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      TextConstants.sendAnInvite,
                                      style: TextStyle(
                                        color: Color(0xFF1B3D1B),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        fontSize: Sizes.dimen_18
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: ()=> Navigator.pop(context),
                                      icon: const Icon(Icons.close, color: Color(0xFF1B3D1B),),
                                    )
                                  ],
                                ),
                                const SizedBox(height: Sizes.dimen_24,),

                                AgenpoInputField(
                                    controller: emailController,
                                    hintText: TextConstants.emailHint,
                                    labelText: TextConstants.emailLabel,
                                    validator: (v){},
                                    isMini: false,
                                  inputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: Sizes.dimen_24,),

                                const Text(
                                  TextConstants.role,
                                  style: TextStyle(
                                      color: Color(0xFF1B3D1B),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_14
                                  ),
                                ),

                                CTAButton(
                                  title: TextConstants.sendAnInvite,
                                  isEnabled: true,
                                  isBorderedButton: false,
                                  onClick: ()=> Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  );
                },
              )
              : QuickActionsItem(
            color: const Color(0xFFF5F2F0),
            iconColor: const Color(0xFF76482C),
            asset: AssetConstants.svgMarker,
            title: TextConstants.geolocate,
            onTap: ()=> Navigator.pushNamed(context, RouteLiterals.geoLocateMyFarmRoute),
          ),
          QuickActionsItem(
            color: const Color(0xFFEDF2ED),
            iconColor: const Color(0xFF3D523D),
            asset: AssetConstants.svgOfferFill,
            title: TextConstants.offers,
            onTap: ()=> Navigator.pushNamed(context, RouteLiterals.offersRoute),
          ),
        ],
      ),
    );
  }
}