import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/journeys/common/all_inventory_items.dart';
import 'package:agenpo/presentation/theme/colors.dart';
import 'package:agenpo/presentation/widgets/common/back_button.dart';
import 'package:agenpo/presentation/widgets/common/page_header.dart';
import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> with SingleTickerProviderStateMixin {

  late final TabController controller;
  late Size size;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
                const AppBackButton(),
                Container(
                  padding: const EdgeInsets.all(Sizes.dimen_16),
                  child: Column(
                    children: [
                      PageHeader(title: TextConstants.inventory, onTap: (){},),
                      const SizedBox(height: Sizes.dimen_30,),

                      SizedBox(
                        width: size.width,
                        height: Sizes.dimen_50,
                        child: TabBar(
                          controller: controller,
                          indicatorColor: AppColors.primaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: Colors.grey,
                          labelColor: AppColors.primaryColor,
                          tabs: const [
                            Tab(text: TextConstants.all,),
                            Tab(text: TextConstants.active,),
                            Tab(text: TextConstants.soldOut,),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: size.width,
                        height: size.height,
                        child: TabBarView(
                          controller: controller,
                          children: const [
                            AllInventoryItems(),
                            AllInventoryItems(),
                            AllInventoryItems(),
                            // ActiveInventoryItems(),
                            // SoldOutInventoryItems(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
