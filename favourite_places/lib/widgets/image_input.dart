import 'dart:io';
import 'package:flutter/material.dart';

import 'package:favourite_places/constants/colors.dart';
import 'package:favourite_places/constants/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.selecetImage});
  final void Function(File image) selecetImage;

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? slectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();

    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      slectedImage = File(pickedImage.path);
    });
    widget.selecetImage(slectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    var content = Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: secondaryTextColor),
      ),
      child: TextButton.icon(
          onPressed: () {
            _takePicture();
          },
          icon: const Icon(
            Icons.camera_alt,
            color: secondaryTextColor,
          ),
          label: const Text(
            'Take a picture',
            style: textFieldTextStyle,
          )),
    );

    if (slectedImage != null) {
      content = Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            slectedImage!,
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      );
    }

    return content;
  }
}
