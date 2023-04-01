import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/blocs/auth/auth_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/password_field.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  late Size size;
  late bool isEnabled = false;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if(state is AuthStateChangePasswordSuccess){
              // print(state.responseModel.toJson());
              Navigator.pushNamed(context, RouteLiterals.loginRoute,);
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
                              "Reset Password",
                              style: TextStyle(
                                  color: AppColors.headerColor,
                                  fontSize: Sizes.dimen_24,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: Sizes.dimen_40,),

                            AgenpoPasswordField(
                              controller: oldPasswordController,
                              labelText: 'Old Password',
                              hintText: TextConstants.passwordHint,
                              validator: (v){
                                return null;
                              },
                            ),
                            const SizedBox(height: Sizes.dimen_24,),

                            AgenpoPasswordField(
                              controller: newPasswordController,
                              labelText: 'New Password',
                              hintText: TextConstants.passwordHint,
                              onChanged: (String v){
                                if(v.length > 3 && oldPasswordController.text.isNotEmpty){
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
                            const SizedBox(height: Sizes.dimen_24,),

                            state is AuthStateLoading
                                ? const ProgressLoader()
                                : CTAButton(
                              title: TextConstants.resetPassword,
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
