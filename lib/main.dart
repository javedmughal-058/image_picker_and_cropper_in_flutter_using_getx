import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_and_cropper_in_flutter_using_getx/Controller/image_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Cropper',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(controller: controller),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ImagePickerController controller;
  const MyHomePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            if (controller.image != null) {
              return Image.file(controller.image!);
            } else {
              return const Text('No image selected.');
            }
          }),
          ElevatedButton(
            onPressed: () => controller.pickImage(),
            child: const Text('Pick Image'),
          ),
        ],
      ),
    );
  }
}


