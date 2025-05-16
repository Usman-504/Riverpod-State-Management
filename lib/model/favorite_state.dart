import 'package:riverpod_state_management/model/items.dart';

class FavoriteState {
  final List<Items> allItems;
  final List<Items> filteredItems;
  final String search;

  FavoriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavoriteState copyWith({   List<Items>? allItems,
   List<Items>? filteredItems,
   String? search}) {
    return FavoriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
