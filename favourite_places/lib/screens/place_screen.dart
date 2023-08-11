import 'package:favourite_places/constants/colors.dart';
import 'package:favourite_places/models/favourite_pace.dart';
import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key, required this.place});

  final FavouritePlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        foregroundColor: primaryTextColor,
        backgroundColor: backgroundColor,
        title: Text(place.name),
      ),
    );
  }
}
