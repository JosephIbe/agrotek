import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';
import 'package:agenpo/presentation/blocs/resolve_bank/resolve_bloc.dart';
import 'package:agenpo/presentation/widgets/common/cta_button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/data/models/banks_response_model.dart';

import 'package:agenpo/presentation/blocs/wallet/wallet_bloc.dart';

import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/input_field.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AddBank extends StatefulWidget {
  const AddBank({Key? key}) : super(key: key);

  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {

  late Size size;

  final accountNumberController = TextEditingController();

  late Bank value;
  bool hasSelectedBank = false;

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(GetAllBanksEvent());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: ()=> Navigator.pop(context, true),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryColor,
                  ),
                  label: Text(
                    TextConstants.back,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: Sizes.dimen_14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope'
                    ),
                  ),
                ),

                BlocListener<ResolveBloc, ResolveState>(
                  listener: (context, state) {
                    if(state is ResolveStateResolveBankSuccess){
                      final params = AddBankAccountParams(
                          accountName: state.responseModel.data.accountName,
                          accountNumber: state.responseModel.data.accountNumber,
                          bankCode: value.code,
                          bankName: value.name
                      );
                      Navigator.pushNamed(context, RouteLiterals.confirmAddBankRoute, arguments: params);
                    }
                    if(state is ResolveStateFailure){
                      Flushbar(
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: const Duration(milliseconds: 4500),
                        backgroundColor: Colors.red,
                        title: 'Could Not Resolve Bank Details',
                        icon: const Icon(Icons.error_outline),
                        message: state.errorMessage,
                      ).show(context);
                    }
                  },
                  child: Container(
                    width: size.width,
                    height: size.height,
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PageHeader(title: TextConstants.addBankDetails, onTap: (){}),
                        const SizedBox(height: Sizes.dimen_30,),

                        AgenpoInputField(
                          controller: accountNumberController,
                          labelText: 'Account Number',
                          hintText: 'Enter account number',
                          validator: (v){},
                          inputType: TextInputType.phone,
                          isMini: false,
                        ),
                        const SizedBox(height: Sizes.dimen_24,),

                        Text(
                          TextConstants.selectBank,
                          style: TextStyle(
                              color: AppColors.labelColor,
                              fontSize: Sizes.dimen_14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope'
                          ),
                        ),
                        const SizedBox(height: Sizes.dimen_5,),

                        BlocBuilder<WalletBloc, WalletState>(
                          builder: (context, state){
                            if(state is WalletStateGetAllBanksSuccess){

                              final banks = state.responseModel.data;
                              value = banks.first;

                              return StatefulBuilder(
                                builder: (context, updateState){
                                  return Container(
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                    height: Sizes.dimen_50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                      border: Border.all(color: Colors.brown, width: 1.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.dimen_16,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          // value: banks[0].name,
                                          value: value,
                                          hint: const Text("Select a Bank"),
                                          isExpanded: true,
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                          iconSize: 40,
                                          onChanged: (Bank? v){
                                            updateState(() {
                                              value = v!;
                                              hasSelectedBank = true;
                                            });
                                          },
                                          items: banks.map((option) {
                                            return DropdownMenuItem(
                                                value: option,
                                                child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    padding: const EdgeInsets.fromLTRB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                    ),
                                                    child: Text(option.name)
                                                )
                                            );
                                          }).toList(),
                                        )
                                    ),
                                  );
                                },
                              );

                            }
                            return const ProgressLoader();
                          },
                        ),
                        const SizedBox(height: Sizes.dimen_40,),

                        BlocBuilder<ResolveBloc, ResolveState>(
                          builder: (context, state){
                            return state is ResolveStateLoading
                                ? const ProgressLoader()
                                : CTAButton(
                                    title: 'Continue',
                                    isEnabled: true,
                                    isBorderedButton: false,
                                    onClick: (){
                                      if(hasSelectedBank && accountNumberController.text.isEmpty){
                                        print(hasSelectedBank);
                                        print(value.toJson());
                                      } else if(!hasSelectedBank && accountNumberController.text.isEmpty){
                                        print(hasSelectedBank);
                                        print(value.toJson());
                                      } else {
                                        final params = ResolveBankAccountParams(
                                            bankCode: value.code,
                                            accountNumber: accountNumberController.text
                                        );

                                        context.read<ResolveBloc>().add(ResolveBankAccountEvent(params: params));
                                      }
                                    },
                                  );
                          },
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('disposed add bank');
  }

}
