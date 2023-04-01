import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late Size size;
  late bool isEnabled = false;

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if(state is AuthStateForgotPasswordSuccess){
              // print(state.responseModel.toJson());
              Navigator.pushNamed(context, RouteLiterals.changePasswordRoute,);
            }
            if(state is AuthStateFailure){
              print(state.failureMessage);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state){
              return SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBackButton(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.dimen_16,
                            vertical: Sizes.dimen_0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: AppColors.headerColor,
                                  fontSize: Sizes.dimen_24,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: Sizes.dimen_16,),

                            Text(
                              TextConstants.provideEmail,
                              style: TextStyle(
                                  color: AppColors.headerColor,
                                  fontSize: Sizes.dimen_12,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            const SizedBox(height: Sizes.dimen_40,),

                            AgenpoInputField(
                              controller: emailController,
                              hintText: 'Email',
                              labelText: 'Email',
                              validator: (v){},
                              onChanged: (v){
                                if(v.isNotEmpty && v.length > 5){
                                  setState(() {
                                    isEnabled = true;
                                  });
                                } else {
                                  setState(() {
                                    isEnabled = false;
                                  });
                                }
                              },
                              isMini: false,
                              inputType: TextInputType.text,
                            ),
                            const SizedBox(height: Sizes.dimen_24,),

                            state is AuthStateLoading
                                ? const ProgressLoader()
                                : CTAButton(
                              title: TextConstants.sendResetLink,
                              isBorderedButton: false,
                              isEnabled: isEnabled,
                              // isEnabled: true,
                              onClick: (){
                                print('click acquired when enabled');

                                // final params = LoginParams(
                                //     email: phoneOrEmailController.text.trim(),
                                //     password: passwordController.text.trim()
                                // );
                                //
                                // context.read<AuthBloc>().add(LoginEvent(loginParams: params));
                              },
                            ),
                            const SizedBox(height: Sizes.dimen_40,),
                          ],
                        ),
                      ),
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
