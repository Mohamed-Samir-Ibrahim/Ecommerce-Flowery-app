import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/resources/string_manager.dart';
import 'category_view_model.dart';


class FilterBottomSheet extends StatefulWidget {
  final CategoryViewModel viewModel;

  const FilterBottomSheet({super.key, required this.viewModel});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? _selectedSort = '';
final double _minPrice = 0;
final double _maxPrice = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorManager.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              StringManager.sortBy.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
              color: ColorManager.primary),
            ),
          ),
          _buildRadioOption(StringManager.lowestPrice.tr(), 'lowest_price', ),
          _buildRadioOption(StringManager.highestPrice.tr(), 'highest_price'),
          _buildRadioOption(StringManager.newArrival.tr(), 'new'),
          _buildRadioOption(StringManager.oldArrival.tr(), 'old'),
          _buildRadioOption(StringManager.discount.tr(), 'discount'),


          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            icon: const Icon(Icons.filter_list, color: Colors.white),
            label:  Text(StringManager.filter.tr(), style: TextStyle(color: Colors.white)),
            onPressed: () {
              widget.viewModel.doIntent(
                FilterProductsIntent(
                  minPrice: _minPrice,
                  maxPrice: _maxPrice,
                  sortBy: _selectedSort,
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _selectedSort,
      activeColor: Colors.pink,
      fillColor: WidgetStateProperty.all(Colors.pink),
      onChanged: (val) {
        setState(() {
          _selectedSort = val;
        });
      },
    );
  }
}
