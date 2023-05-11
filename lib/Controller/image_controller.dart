import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerController extends GetxController {
  final picker = ImagePicker();
  final cropAspectRatio = CropAspectRatioPreset.square;
  File? imageFile;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      cropImage(pickedFile.path);
    }
  }

  Future<void> cropImage(String imagePath) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [cropAspectRatio],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: cropAspectRatio,
        lockAspectRatio: true,
      ),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Image',
        aspectRatioLockEnabled: true,
        aspectRatioPickerButtonHidden: true,
      ),
    );
    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      update();
    }
  }

  File? get image => imageFile;
}
