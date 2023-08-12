import 'dart:io';

import 'package:uuid/uuid.dart';

class FavouritePlace {
  final String id;
  final String name;
  final File image;

  FavouritePlace({required this.name, required this.image})
      : id = const Uuid().v4();
}
