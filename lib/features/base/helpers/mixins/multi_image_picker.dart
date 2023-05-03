import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

                                                                                                                                                                   
mixin MultiImagePickerMixin {
  multiImagePickerHelper(ImageSource selectedOption,
      Function({List<File?>? selectedImagesFiles}) onImageSelected) async {
    final selectedImages = await _takePicture(selectedOption);
    debugPrint("images : $selectedImages");
    onImageSelected(selectedImagesFiles: selectedImages);
  }

  Future<List<File?>> _takePicture(ImageSource source) async {
    final picker = ImagePicker();
    try {
      List<XFile?> multiPickedImagesXFiles = [];

      if (source == ImageSource.camera) {
        multiPickedImagesXFiles.add(await picker.pickImage(
          source: source,
          maxHeight: 480,
          maxWidth: 640,
        ));
      } else {
        multiPickedImagesXFiles.addAll(await picker.pickMultiImage(
          maxHeight: 480,
          maxWidth: 640,
        ));
      }

      return multiPickedImagesXFiles.map((e) => File(e?.path??"")).toList();

    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
