import 'package:uuid/uuid.dart';

class FavouritePlace {
  final String id;
  final String name;

  FavouritePlace({required this.name}) : id = const Uuid().v4();
}
