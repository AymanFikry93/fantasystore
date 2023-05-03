class NavigationBarState {
  int selectedIndex;

  NavigationBarState({
    this.selectedIndex = 0,
  });

  NavigationBarState copyWith({
    int? selectedIndex,
  }){
    return NavigationBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
