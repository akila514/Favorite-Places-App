import 'package:favourite_places/models/favourite_pace.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritePlacesNotifier extends StateNotifier<List<FavouritePlace>> {
  FavouritePlacesNotifier() : super([]);

  void addFavoutitePlace(FavouritePlace place) {
    state = [place, ...state];
  }

  void deleteFromFavoutitePlace(FavouritePlace place) {
    state = state.where((p) => place.id != p.id).toList();
  }
}

final favouritePlacesListProvider =
    StateNotifierProvider<FavouritePlacesNotifier, List<FavouritePlace>>(
  (ref) => FavouritePlacesNotifier(),
);
