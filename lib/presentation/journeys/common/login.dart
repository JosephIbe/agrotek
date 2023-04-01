import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/domain/entities/login_params.dart';

import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late Size size;
  late bool isEnabled = false;

  final phoneOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if(state is AuthStateLoginSuccess){
              Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.landingRoute, (route) => false);
            }
            if(state is AuthStateFailure){
              print(state.failureMessage);
              Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                duration: const Duration(milliseconds: 4500),
                backgroundColor: Colors.red,
                title: 'Login Failed',
                icon: const Icon(Icons.error_outline),
                message: state.failureMessage,
              ).show(context);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state){
              return Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_16,
                    vertical: Sizes.dimen_60
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextConstants.welcomeBack,
                        style: TextStyle(
                            color: AppColors.headerColor,
                            fontSize: Sizes.dimen_24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      AgenpoInputField(
                        controller: phoneOrEmailController,
                        hintText: TextConstants.enterPhoneOrEmail,
                        labelText: TextConstants.phoneOrEmailLabel,
                        validator: (v){},
                        isMini: false,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: Sizes.dimen_24,),

                      AgenpoPasswordField(
                        controller: passwordController,
                        labelText: TextConstants.passwordLabel,
                        hintText: TextConstants.passwordHint,
                        onChanged: (String v){
                          if(v.length > 3 && phoneOrEmailController.text.isNotEmpty){
                            setState(() {
                              isEnabled = true;
                            });
                          } else {
                            setState(() {
                              isEnabled = false;
                            });
                          }
                          },
                        validator: (v){
                          return null;
                        },
                      ),

                      TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, RouteLiterals.forgotPasswordRoute),
                        child: Text(
                          TextConstants.forgotPassword,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Manrope'
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      state is AuthStateLoading
                          ? const ProgressLoader()
                          : CTAButton(
                        title: TextConstants.login,
                        isBorderedButton: false,
                        isEnabled: isEnabled,
                        // isEnabled: true,
                        onClick: (){
                          print('click acquired when enabled');

                          final params = LoginParams(
                              email: phoneOrEmailController.text.trim(),
                            password: passwordController.text.trim()
                          );

                          context.read<AuthBloc>().add(LoginEvent(loginParams: params));
                        },
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            TextConstants.doesNotHaveAnAccount,
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
                            onTap: ()=> state is AuthStateLoading ? (){} : Navigator.popAndPushNamed(context, RouteLiterals.createFarmerOrAggregatorAccountRoute),
                            child: Text(
                              TextConstants.createAccount,
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