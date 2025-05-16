import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/model/items.dart';
import 'package:riverpod_state_management/model/favorite_state.dart';

final itemsProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>((
  ref,
) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
    : super(FavoriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<Items> items = [
      Items(id: 1, name: 'Usman', favorite: true),
      Items(id: 2, name: 'Ali', favorite: false),
      Items(id: 3, name: 'Ahmad', favorite: true),
      Items(id: 4, name: 'Kamran', favorite: true),
      Items(id: 5, name: 'Azlan', favorite: true),
      Items(id: 6, name: 'Saqib', favorite: false),
      Items(id: 7, name: 'Arsalan', favorite: true),
      Items(id: 8, name: 'Zeeshan', favorite: false),
      Items(id: 9, name: 'Amir', favorite: true),
      Items(id: 10, name: 'Asim', favorite: false),
    ];
    state = state.copyWith(
      allItems: items.toList(),
      filteredItems: items.toList(),
    );
  }

  void filterdList(String search) {
    state = state.copyWith(
      filteredItems: _filteredItems(state.allItems, search),
    );
  }

  void favorite(String option) {
    state = state.copyWith(
      filteredItems: _favoriteItems(state.allItems, option),
    );
  }

  List<Items> _favoriteItems(List<Items> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items.where((item) => item.favorite == true).toList();
  }

  List<Items> _filteredItems(List<Items> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
