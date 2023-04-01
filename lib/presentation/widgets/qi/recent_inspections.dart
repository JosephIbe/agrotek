import 'package:agenpo/common/size_constants.dart';
import 'package:agenpo/common/text_constants.dart';
import 'package:agenpo/presentation/widgets/common/section_header.dart';
import 'package:flutter/material.dart';

class RecentInspections extends StatelessWidget {

  const RecentInspections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SectionHeader(title: TextConstants.recentInspections, onTap: (){}),
          const SizedBox(height: Sizes.dimen_18,),
        ],
      ),
    );
  }

}
