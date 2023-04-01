import 'package:flutter/material.dart';

import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CreateQIAccount extends StatefulWidget {
  const CreateQIAccount({Key? key}) : super(key: key);

  @override
  State<CreateQIAccount> createState() => _CreateQIAccountState();
}

class _CreateQIAccountState extends State<CreateQIAccount> {

  late Size size;
  late bool isEnabled = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_16,
                    vertical: Sizes.dimen_40
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBackButton(),
                      const SizedBox(height: Sizes.dimen_24,),

                      Text(
                        TextConstants.createAccount,
                        style: TextStyle(
                            color: AppColors.headerColor,
                            fontSize: Sizes.dimen_24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_24,),

                      Text(
                        TextConstants.pleaseCreateAccount,
                        style: TextStyle(
                            color: AppColors.labelColor,
                            fontSize: Sizes.dimen_14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_40,),

                      AgenpoInputField(
                        controller: firstNameController,
                        hintText: TextConstants.nameHint,
                        labelText: TextConstants.firstNameLabel,
                        validator: (v) {},
                        isMini: false,
                        inputType: TextInputType.text,
                      ),

                      AgenpoInputField(
                        controller: lastNameController,
                        hintText: TextConstants.nameHint,
                        labelText: TextConstants.lastNameLabel,
                        validator: (v) {},
                        isMini: false,
                        inputType: TextInputType.text,
                      ),

                      AgenpoPasswordField(
                        controller: passwordController,
                        labelText: TextConstants.passwordLabel,
                        hintText: TextConstants.passwordHint,
                        validator: (v) {},
                        onChanged: (v){
                          if(firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty
                            && v.length > 3){
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
                          ? const CircularProgressIndicator()
                          : CTAButton(
                        title: TextConstants.createAccount,
                        isBorderedButton: false,
                        isEnabled: isEnabled,
                        onClick: (){
                          // final generateOTPParams = GenerateOTPParams(email: emailController.text);
                          // context.read<AuthBloc>().add(GenerateOTPEvent(params: generateOTPParams));
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
