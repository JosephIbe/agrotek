import 'package:flutter/material.dart';

import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/presentation/widgets/common/progress_loader.dart';

import 'package:agenpo/presentation/blocs/inventory/inventory_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';

import 'package:agenpo/presentation/widgets/common/inventory_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AllInventoryItems extends StatefulWidget {

  const AllInventoryItems({Key? key}) : super(key: key);

  @override
  State<AllInventoryItems> createState() => _AllInventoryItemsState();
}

class _AllInventoryItemsState extends State<AllInventoryItems> {

  late Size size;

  @override
  void initState() {
    super.initState();
    context.read<InventoryBloc>().add(LoadAllInventoryItems());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(top: Sizes.dimen_24),
      child: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if(state is InventoryStateGetAllSuccess){
            final items = state.responseModel.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: Sizes.dimen_10,
                mainAxisSpacing: Sizes.dimen_10,
              ),
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InventoryItem(item: items[index]);
              },
            );
          }
          return const ProgressLoader();
        },
      ),
    );
  }
}
