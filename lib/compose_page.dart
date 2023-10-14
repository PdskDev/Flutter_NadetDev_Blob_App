import 'package:flutter/material.dart';
import 'package:my_nadetdev_blog/image_from_gallery.dart';
import 'constants.dart' as app_constants;

enum ImageSourceType { gallery, camera }

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          app_constants.composePageTitle,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: const PostComposeForm(),
    );
  }
}

class PostComposeForm extends StatefulWidget {
  const PostComposeForm({super.key});

  @override
  State<PostComposeForm> createState() => _PostComposeFormState();
}

class _PostComposeFormState extends State<PostComposeForm> {
  final _formKey = GlobalKey<FormState>();

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageFromGalleryExt(type: type)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: app_constants.composeFormTitleLabel,
                      hintText: app_constants.composeFormTitleHintText,
                      alignLabelWithHint: true),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 8,
                    maxLines: 15,
                    maxLength: 1000,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: app_constants.composeFormTextLabel,
                        hintText: app_constants.composeFormTextHintLabel,
                        alignLabelWithHint: true),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _handleURLButtonPress(context, ImageSourceType.gallery);
                  },
                  icon: const Icon(Icons.photo),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  label: const Text(
                    app_constants.composeButtonSelectImage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Wrap(
                  spacing: 5,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonPost,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonErase,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.cancel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonCancel,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
