import 'package:flutter/material.dart';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/common/route_constants.dart';

import 'package:agenpo/domain/entities/farmer_register_params.dart';
import 'package:agenpo/domain/entities/generate_otp_params.dart';

import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/phone_input.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/input_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:country_code_picker/country_code.dart';

class CreateFarmerOrAggregatorAccount extends StatefulWidget {
  const CreateFarmerOrAggregatorAccount({Key? key}) : super(key: key);

  @override
  State<CreateFarmerOrAggregatorAccount> createState() => _CreateFarmerOrAggregatorAccountState();
}

class _CreateFarmerOrAggregatorAccountState extends State<CreateFarmerOrAggregatorAccount> {

  late Size size;
  late String userType = 'undefined';

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  CountryCode countryCode = CountryCode(
      name: 'Nigeria',
      code: 'NG',
      dialCode: '+234'
  );

  @override
  void initState() {
    super.initState();
    userType = Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType);
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateGenerateOTPSuccess) {
              print('otp sent');
              switch(userType){
                case TextConstants.aggregatorRoleOrType:
                  final params = FarmerRegisterParams(
                      email: emailController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      firstName: firstNameController.text.trim(),
                      channel: DBConstants.channel,
                      fullName: "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
                      phone: phoneController.text.trim(),
                      role: Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType).toString().trim()
                  );
                  Navigator.pushNamed(context, RouteLiterals.verifyCodeRoute, arguments: params);
                  break;
                case TextConstants.farmerRoleOrType:
                  final params = FarmerRegisterParams(
                      email: emailController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      firstName: firstNameController.text.trim(),
                      channel: DBConstants.channel,
                      fullName: "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
                      phone: phoneController.text.trim(),
                      role: Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType).toString().trim()
                  );
                  Navigator.pushNamed(context, RouteLiterals.verifyCodeRoute, arguments: params);
                  break;
              }
            }
            if (state is AuthStateFailure) {
              print('send otp failed:\n${state.failureMessage}');
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_16,
                    vertical: Sizes.dimen_40
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextConstants.createAccount,
                        style: TextStyle(
                            color: AppColors.headerColor,
                            fontSize: Sizes.dimen_24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      /// Name Input
                      Row(
                        children: [
                          AgenpoInputField(
                            controller: firstNameController,
                            hintText: TextConstants.nameHint,
                            labelText: TextConstants.firstNameLabel,
                            validator: (v) {},
                            isMini: true,
                            inputType: TextInputType.text,
                          ),
                          const SizedBox(width: Sizes.dimen_8,),

                          AgenpoInputField(
                            controller: lastNameController,
                            hintText: TextConstants.nameHint,
                            labelText: TextConstants.lastNameLabel,
                            validator: (v) {},
                            isMini: true,
                            inputType: TextInputType.text,
                          ),
                        ],
                      ),
                      const SizedBox(height: Sizes.dimen_24,),

                      /// Phone Number Input
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

                      PhoneInput(controller: phoneController),
                      const SizedBox(height: Sizes.dimen_24,),

                      /// Email Input
                      AgenpoInputField(
                        controller: emailController,
                        hintText: TextConstants.emailHint,
                        labelText: TextConstants.emailLabel,
                        validator: (v) {},
                        isMini: false,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      state is AuthStateLoading
                          ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),))
                          : CTAButton(
                        title: TextConstants.createAccount,
                        isBorderedButton: false,
                        isEnabled: emailController.text.isNotEmpty
                            && phoneController.text.length > 9
                            && firstNameController.text.isNotEmpty
                            && lastNameController.text.isNotEmpty,
                        onClick: (){

                          final generateOTPParams = GenerateOTPParams(email: emailController.text);
                          context.read<AuthBloc>().add(GenerateOTPEvent(params: generateOTPParams));
                        },
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            TextConstants.alreadyHaveAccount,
                            style: TextStyle(
                              fontSize: Sizes.dimen_14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'
                            ),
                          ),
                          const SizedBox(width: Sizes.dimen_8,),
                          InkWell(
                            splashFactory: InkSplash.splashFactory,
                            onTap: ()=> state is AuthStateLoading ? (){} : Navigator.popAndPushNamed(context, RouteLiterals.loginRoute),
                            child: Text(
                              TextConstants.login,
                              style: TextStyle(
                                  fontSize: Sizes.dimen_14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Manrope'
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
