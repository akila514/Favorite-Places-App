import 'package:favourite_places/constants/colors.dart';
import 'package:favourite_places/constants/text_styles.dart';
import 'package:favourite_places/models/favourite_pace.dart';
import 'package:favourite_places/provider/favouritepaces_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddNewPlaceState();
  }
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  var _enteredPlace = '';

  void _savePlace() {
    ref.watch(favouritePlacesListProvider.notifier).addFavoutitePlace(
          FavouritePlace(name: _enteredPlace),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          foregroundColor: primaryTextColor,
          title: const Text(
            'Add Place',
            style: normalTextStyle,
          ),
          backgroundColor: backgroundColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                style: const TextStyle(color: primaryTextColor),
                onChanged: (value) {
                  setState(() {
                    _enteredPlace = value;
                  });
                },
                decoration: const InputDecoration(
                  label: Text(
                    'Add place',
                    style: smallTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _savePlace();
                  },
                  child: const Text(
                    'Add',
                    style: buttonTextStyle,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Reset',
                    style: buttonTextStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
