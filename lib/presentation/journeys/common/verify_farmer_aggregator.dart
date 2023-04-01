import 'package:agenpo/common/asset_constants.dart';
import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/presentation/widgets/common/dialogs/register_success.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/domain/entities/farmer_register_params.dart';

import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class VerifyFarmerOrAggregatorEmail extends StatefulWidget {

  final FarmerRegisterParams? arguments;
  const VerifyFarmerOrAggregatorEmail({
    Key? key,
    required this.arguments
  }) : super(key: key);

  @override
  State<VerifyFarmerOrAggregatorEmail> createState() => _VerifyFarmerOrAggregatorEmailState();
}

class _VerifyFarmerOrAggregatorEmailState extends State<VerifyFarmerOrAggregatorEmail> {

  late Size size;
  late bool isEnabled = false;

  late String userType = 'undefined';

  final codeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userType = Hive.box(DBConstants.appBoxName).get(DBConstants.userRoleOrType);
  }

  @override
  Widget build(BuildContext context) {

    print('user role/type in verify otp screen is:\t$userType');

    size = MediaQuery.of(context).size;

    print(widget.arguments!.email);
    print(widget.arguments!.firstName);
    print(widget.arguments!.phone);

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print('state is:\t$state');
            if(state is AuthStateFailure){}
            
            if(state is AuthStateRegisterSuccess){
              print('verify success state');
              switch(userType){
                case TextConstants.farmerRoleOrType:
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context)=> const RegisterSuccessDialog(),
                  );
                  break;
                case TextConstants.qualityInspectorRoleOrType:
                  break;
                case TextConstants.cooperativeRoleOrType:
                  break;
                case TextConstants.aggregatorRoleOrType:
                  Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.landingRoute, (route) => false);
                  break;
              }
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                    width: size.width,
                    height: size.height,
                    padding: const EdgeInsets.fromLTRB(
                        Sizes.dimen_16,
                        Sizes.dimen_10,
                        Sizes.dimen_16,
                        Sizes.dimen_10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppBackButton(),
                          Text(
                            TextConstants.verificationSentTo,
                            style: TextStyle(
                                color: AppColors.labelColor,
                                fontSize: Sizes.dimen_14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Manrope'
                            ),
                          ),
                          const SizedBox(height: Sizes.dimen_40,),

                          AgenpoInputField(
                            controller: codeController,
                            hintText: TextConstants.verificationCodeHint,
                            labelText: TextConstants.verificationCodeLabel,
                            validator: (v) {},
                            isMini: false,
                            inputType: TextInputType.phone,
                          ),
                          const SizedBox(height: Sizes.dimen_24,),

                          AgenpoPasswordField(
                            controller: passwordController,
                            labelText: TextConstants.passwordLabel,
                            hintText: TextConstants.passwordHint,
                            validator: (v){},
                            onChanged: (v){
                              if(codeController.text.isNotEmpty
                                  && passwordController.text.isNotEmpty && v.length > 3){
                                setState(() {
                                  isEnabled = true;
                                });
                              } else {
                                setState(() {
                                  isEnabled = false;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: Sizes.dimen_40,),

                          state is AuthStateLoading
                              ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),))
                              : InkWell(
                                  onTap: (){
                                    if(isEnabled){

                                      final params = FarmerRegisterParams(
                                          email: widget.arguments!.email,
                                          lastName: widget.arguments!.lastName,
                                          firstName: widget.arguments!.firstName,
                                          channel: widget.arguments!.channel,
                                          fullName: widget.arguments!.fullName,
                                          phone: widget.arguments!.phone,
                                          role: widget.arguments!.role,
                                        password: passwordController.text.trim()
                                      );

                                      context.read<AuthBloc>().add(RegisterUserEvent(registerParams: params));
                                    }
                                  },
                                  child: Container(
                                    width: size.width,
                                    height: Sizes.dimen_56,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Sizes.dimen_10),
                                        color: codeController.text.isNotEmpty
                                            && passwordController.text.isNotEmpty
                                            && passwordController.text.length > 5 ? AppColors.primaryColor : const Color(0XFF218838).withOpacity(.5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        TextConstants.createAccount,
                                        style: TextStyle(
                                          fontSize: Sizes.dimen_16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                          const SizedBox(height: Sizes.dimen_40,),

                          /// Resend OTP
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                TextConstants.didNotReceiveCode,
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
                                onTap: ()=> state is AuthStateLoading ? (){} : Navigator.pop(context,),
                                child: const Text(
                                  TextConstants.editNumber,
                                  style: TextStyle(
                                      fontSize: Sizes.dimen_14,
                                      color: Color(0xFF76482C),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Manrope'
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: Sizes.dimen_48,),

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
                                onTap: ()=> Navigator.popAndPushNamed(context, RouteLiterals.loginRoute),
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