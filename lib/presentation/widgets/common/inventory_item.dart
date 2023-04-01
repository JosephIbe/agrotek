import 'package:agenpo/common/route_constants.dart';
import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/data/models/get_all_inventory_items_response_model.dart';
import 'package:agenpo/presentation/blocs/inventory/inventory_bloc.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryItem extends StatelessWidget {

  final InventoryData item;

  const InventoryItem({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteLiterals.inventoryDetailsRoute, arguments: item);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Sizes.dimen_164,
            height: Sizes.dimen_136,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(Sizes.dimen_8),
              image: DecorationImage(
                image: NetworkImage(item.commodity.imageUrl)
              )
            ),
          ),
          const SizedBox(height: Sizes.dimen_10,),

          Text(
            item.commodity.name ?? '7 tonnes of maize',
            style: TextStyle(
                color: AppColors.labelColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                fontSize: Sizes.dimen_14
            ),
          )
        ],
      ),
    );
  }
}