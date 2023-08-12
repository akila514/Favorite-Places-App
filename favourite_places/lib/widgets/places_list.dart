import 'package:favourite_places/models/favourite_pace.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class PlacesList extends StatelessWidget {
  const PlacesList(
      {super.key,
      required this.favouritePlacesList,
      required this.onDelete,
      required this.onNavigateToDescription});

  final List<FavouritePlace> favouritePlacesList;
  final void Function(FavouritePlace place) onDelete;
  final void Function(FavouritePlace place) onNavigateToDescription;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favouritePlacesList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(favouritePlacesList[index]),
        onDismissed: (direction) {
          onDelete(favouritePlacesList[index]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              onNavigateToDescription(favouritePlacesList[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: const BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Text(
                    favouritePlacesList[index].name,
                    style: smallTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
