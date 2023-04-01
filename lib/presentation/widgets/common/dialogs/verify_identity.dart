import 'dart:convert';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/models/error_response_model.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VerifyIdentity extends StatefulWidget {

  const VerifyIdentity({Key? key}) : super(key: key);

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {

  late Size size;
  late bool isEnabled = false;
  late bool isLoading = false;

  final bvnController = TextEditingController();

  // final ImagePicker _picker = ImagePicker();
  // late bool hasSelectedDocument = false;
  // late String imageName = '';

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width,
        height: Sizes.dimen_300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
        ),
        margin: const EdgeInsets.all(Sizes.dimen_16),
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstants.verifyIdentity,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: Sizes.dimen_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.labelColor
                ),
              ),
              const SizedBox(height: Sizes.dimen_40,),

              Material(
                child: AgenpoInputField(
                  labelText: TextConstants.bvnLabel,
                  hintText: TextConstants.bvnHint,
                  validator: (v){},
                  controller: bvnController,
                  isMini: false,
                  onChanged: (v){
                    if(v.length > 10 && v.length < 15){
                      setState(() {
                        isEnabled = true;
                      });
                    } else {
                      setState(() {
                        isEnabled = false;
                      });
                    }
                  },
                  inputType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: Sizes.dimen_24,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  isLoading ? const ProgressLoader() : CTAButton(
                    title: 'Continue',
                    isEnabled: isEnabled,
                    isBorderedButton: false,
                    onClick: () async {

                      setState(() {
                        isLoading = true;
                      });

                      final client = APIClient();
                      Response response = await client.validateBVN(pathSegment: '/kyc/users/validate-bvn/${bvnController.text.trim()}');

                      if(response.statusCode == 200 || response.statusCode == 201){

                        setState(() {
                          isLoading = false;
                        });

                        Flushbar(
                          flushbarPosition: FlushbarPosition.TOP,
                          title: 'Validation Successful',
                          message: 'You are free to perform wallet transactions on Agenpo now. Congrats!!!',
                          backgroundColor: Colors.green,
                          duration: const Duration(milliseconds: 3500),
                          icon: const Icon(Icons.check_circle_rounded, color: Colors.white,),
                        ).show(context);
                        Navigator.pop(context);

                      } else if(response.statusCode >= 400){
                        setState(() {
                          isLoading = false;
                        });
                        Flushbar(
                          flushbarPosition: FlushbarPosition.TOP,
                          title: 'Validation Failure',
                          message: ErrorResponseModel.fromJson(jsonDecode(response.body)).msg,
                          backgroundColor: Colors.red,
                          duration: const Duration(milliseconds: 3500),
                          icon: const Icon(Icons.error_outline, color: Colors.white,),
                        ).show(context);
                      }
                    },
                  ),

                  // 22427769911
                  // const SizedBox(height: Sizes.dimen_24,),

                  TextButton(
                    onPressed: ()=> Navigator.pop(context),
                    child: Text(
                      TextConstants.saveCompleteLater,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: Sizes.dimen_14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}