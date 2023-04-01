import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:flutter/material.dart';

class AutomaticallyLocateFarm extends StatefulWidget {
  const AutomaticallyLocateFarm({Key? key}) : super(key: key);

  @override
  State<AutomaticallyLocateFarm> createState() => _AutomaticallyLocateFarmState();
}

class _AutomaticallyLocateFarmState extends State<AutomaticallyLocateFarm> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: Sizes.dimen_155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter farm address'
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: Icon(Icons.arrow_back, color: AppColors.primaryColor,),
                                label: Text(
                                  TextConstants.autoLocateWhenOnFarm,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: Sizes.dimen_14,
                                      fontFamily: "Manrope"
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
