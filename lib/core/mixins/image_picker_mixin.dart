import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


mixin ImagePickerMixin {
  performDialogAction(ImageSource selectedOption,
      Function(File? selectedImage) onImageSelected) async {
    final selectedImage = await _takePicture(selectedOption);
    debugPrint("image : $selectedImage");
    onImageSelected(selectedImage);
  }

  Future<File?> _takePicture(ImageSource source) async {
/*  PickedFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  try {
    imageFile = await _picker.getImage(source: source);
    if (imageFile != null) {
      return File(imageFile.path);
    }
  } catch (e) {
    debugPrint(e.toString());
  }*/

    final picker = ImagePicker();
    try {
      XFile? pickedImageXFile = await picker.pickImage(
        source: source,
        // imageQuality: 50,
        maxHeight: 480,
        maxWidth: 640,
      );

      if (pickedImageXFile != null) {
        return File(pickedImageXFile.path);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
  // function to convert string to double
  getName(){

  }
}
