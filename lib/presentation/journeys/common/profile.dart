import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/blocs/profile/profile_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/phone_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  late Size size;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    ///todo add blocbuilder

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: Sizes.dimen_200,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5FAF5)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBackButton(),

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Sizes.dimen_88,
                              height: Sizes.dimen_88,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFAAAAAA)
                              ),
                            ),
                            const SizedBox(height: Sizes.dimen_8,),

                            TextButton(
                              onPressed: (){},
                              child: Text(
                                TextConstants.editPhoto,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
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
                ),
                const SizedBox(height: Sizes.dimen_24,),

                Container(
                  padding: const EdgeInsets.all(Sizes.dimen_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AgenpoInputField(
                        controller: firstNameController,
                        validator: (v){},
                        hintText: TextConstants.firstNameHint,
                        labelText: TextConstants.firstNameLabel,
                        isMini: false,
                        inputType: TextInputType.text,
                      ),

                      AgenpoInputField(
                        controller: lastNameController,
                        validator: (v){},
                        hintText: TextConstants.lastNameHint,
                        labelText: TextConstants.lastNameLabel,
                        isMini: false,
                        inputType: TextInputType.text,
                      ),

                      AgenpoInputField(
                        controller: emailController,
                        validator: (v){},
                        hintText: TextConstants.emailHint,
                        labelText: TextConstants.emailLabel,
                        isMini: false,
                        inputType: TextInputType.emailAddress,
                      ),

                      Text(
                        TextConstants.phoneLabel,
                        style: TextStyle(
                            color: AppColors.labelColor,
                            fontSize: Sizes.dimen_14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Manrope'
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_5,),
                      PhoneInput(controller: phoneController,),
                      const SizedBox(height: Sizes.dimen_40,),

                      CTAButton(
                        title: TextConstants.saveChanges,
                        isEnabled: false,
                        onClick: (){},
                        isBorderedButton: false,
                      ),
                      const SizedBox(height: Sizes.dimen_10,),

                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            width: size.width,
                            height: Sizes.dimen_56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Sizes.dimen_10),
                                color: Colors.white,
                                border: Border.all(color: AppColors.primaryColor, width: Sizes.dimen_2, style: BorderStyle.solid)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  TextConstants.changePassword,
                                  style: TextStyle(
                                    fontSize: Sizes.dimen_16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Manrope',
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: Sizes.dimen_10,),
                                Icon(Icons.lock, color: AppColors.primaryColor,)
                              ],
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}
