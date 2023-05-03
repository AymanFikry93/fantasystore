import 'package:fantasy_store/features/general_management/data/entities/selection_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SelectionSheetCard<T> extends StatelessWidget {
  const SelectionSheetCard(
      {Key? key, required this.isSelected, required this.item})
      : super(key: key);
  final bool isSelected;
  final SelectionItem<T> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: AppColors.primaryColor, width: 1.5)
            : null,
        borderRadius: BorderRadius.circular(6),
        color: isSelected ? Colors.transparent : AppColors.emptyTextFieldColor,
      ),
      child: Center(child: Text(item.name ?? '')),
    );
  }
}
