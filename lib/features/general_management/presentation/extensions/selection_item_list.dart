import 'package:fantasy_store/features/general_management/data/entities/selection_item.dart';

extension SelectionItemsExtension on List<SelectionItem> {
  reset() {
    forEach((item) {
      if (item.isSelected ?? false) {
        item.isSelected = false;
      }
    });
  }


}
