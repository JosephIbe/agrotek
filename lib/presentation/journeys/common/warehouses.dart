import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';

import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/blocs/warehouses/warehouses_bloc.dart';
import 'package:agenpo/presentation/journeys/farmers/main/warehouses_view.dart';

import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/empty_warehouses.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Warehouses extends StatefulWidget {

  const Warehouses({Key? key}) : super(key: key);

  @override
  State<Warehouses> createState() => _WarehousesState();
}

class _WarehousesState extends State<Warehouses> {

  late Size size;

  @override
  void initState() {
    super.initState();
    context.read<WarehousesBloc>().add(LoadWarehouses());
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(title: TextConstants.warehouses, onTap: (){}),

              Expanded(
                child: BlocBuilder<WarehousesBloc, WarehousesState>(
                  builder: (context, state){
                    if(state is WarehousesStateGetAllSuccess){
                      return state.responseModel.isEmpty ? EmptyWarehouses(): const WarehousesView();
                    }
                    return const ProgressLoader();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
