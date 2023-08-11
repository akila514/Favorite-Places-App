import 'package:favourite_places/constants/colors.dart';
import 'package:favourite_places/constants/text_styles.dart';
import 'package:favourite_places/models/favourite_pace.dart';
import 'package:favourite_places/screens/add_new_place.dart';
import 'package:favourite_places/screens/place_screen.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/favouritepaces_list_provider.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesState();
  }
}

class _PlacesState extends ConsumerState<Places> {
  void _navigateToAddNewPlace() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewPlace(),
      ),
    );
  }

  void _navigeteToPlaceScreen(FavouritePlace place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceScreen(place: place),
      ),
    );
  }

  void _deleteFromFavouritePlaces(FavouritePlace place) {
    ref
        .watch(favouritePlacesListProvider.notifier)
        .deleteFromFavoutitePlace(place);
  }

  @override
  Widget build(BuildContext context) {
    List<FavouritePlace> favouritePlacesList =
        ref.watch(favouritePlacesListProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Your Places',
          style: normalTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                _navigateToAddNewPlace();
              },
              icon: const Icon(
                Icons.add,
                color: primaryTextColor,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PlacesList(
                  favouritePlacesList: favouritePlacesList,
                  onDelete: _deleteFromFavouritePlaces,
                  onNavigateToDescription: _navigeteToPlaceScreen))
        ],
      ),
    );
  }
}
