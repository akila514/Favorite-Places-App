import 'dart:io';

import 'package:favourite_places/constants/colors.dart';
import 'package:favourite_places/constants/text_styles.dart';
import 'package:favourite_places/models/favourite_pace.dart';
import 'package:favourite_places/provider/favouritepaces_list_provider.dart';
import 'package:favourite_places/widgets/image_input.dart';
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
  final _formKey = GlobalKey<FormState>();
  File? curruntImage;

  void _savePlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      return;
    }

    ref.read(favouritePlacesListProvider.notifier).addFavoutitePlace(
          FavouritePlace(name: _enteredPlace, image: curruntImage!),
        );

    Navigator.of(context).pop();
  }

  void onselectImage(File file) {
    curruntImage = file;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  enableSuggestions: true,
                  maxLength: 40,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.length <= 1 ||
                        value.length > 40) {
                      return 'Title must have more than 1 character';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: primaryTextColor),
                  onChanged: (value) {
                    setState(() {
                      _enteredPlace = value;
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Add place',
                      style: textFieldTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ImageInput(selecetImage: onselectImage),
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
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
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
      ),
    );
  }
}
