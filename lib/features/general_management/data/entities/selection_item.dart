class SelectionItem<T> {
  T? value;
  String? name;
  bool? isSelected;
  bool? isDeselected;
  bool? isAllItem;

  SelectionItem({
    this.value,
    this.name,
    this.isSelected = false,
    this.isDeselected = false,
    this.isAllItem = false,
  });

  factory SelectionItem.fromItem(dynamic item) {
    return SelectionItem(value: item, name: item.name);
  }
}
