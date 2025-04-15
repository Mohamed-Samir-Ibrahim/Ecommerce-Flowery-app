import 'package:flutter/material.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../data/model/home_model/occasions/occasions_model.dart';

class TabItem extends StatelessWidget {
  final OccasionsModel occasion;
  final bool isSelected;

  const TabItem({super.key, required this.occasion, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? ColorManager.primary : ColorManager.lightGrey,
            width: 2.0, // thickness of the underline
          ),
        ),
      ),

      child: Text(
        occasion.name ?? 'jjjj',
        style: TextStyle(
          color: isSelected ? ColorManager.primary : ColorManager.grey,
        ),
      ),
    );
  }
}
