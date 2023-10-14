import 'package:flutter/material.dart';

class ImageFromGalleryExt extends StatefulWidget {
  const ImageFromGalleryExt({super.key, required this.type});

  final type;

  @override
  State<ImageFromGalleryExt> createState() => _ImageFromGalleryExtState();
}

class _ImageFromGalleryExtState extends State<ImageFromGalleryExt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélectionner une image'),
      ),
    );
  }
}
