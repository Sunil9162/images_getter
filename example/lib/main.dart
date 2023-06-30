import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:images_getter/images_getter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imagesGetterPlugin = ImagesGetter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: TextButton(
          child: const Text('Get Images'),
          onPressed: () async {
            final images = await _imagesGetterPlugin.getImages();
            log(images.toString());
          },
        )),
      ),
    );
  }
}
