import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_nadetdev_blog/home_page.dart';
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
  final titleFieldController = TextEditingController();
  final contentFieldController = TextEditingController();
  late FocusNode titleFieldFocusNode = FocusNode();
  late AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  XFile? image;
  final ImagePicker picker = ImagePicker();
  final blogLeMans = Hive.box('lemans_blog');
  List<Map<String, dynamic>> listCurrentPosts = [];
  late String postImagePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleFieldFocusNode.dispose();
    super.dispose();
  }

  void resetAllInputs() {
    if (titleFieldController.text.isNotEmpty) {
      titleFieldController.clear();
    }

    if (contentFieldController.text.isNotEmpty) {
      contentFieldController.clear();
    }

    setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
    titleFieldFocusNode.requestFocus();
    image = null;
  }

  Future<void> addNewPost(Map<String, dynamic> newPost) async {
    await blogLeMans.add(newPost);
    listAllPosts();
  }

  void listAllPosts() {
    final dataPosts = blogLeMans.keys.map((key) {
      final value = blogLeMans.get(key);
      return {"key": key, "title": value["title"], "content": value['content']};
    }).toList();

    setState(() {
      listCurrentPosts = dataPosts.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  void getAllPosts() {
    listAllPosts();
    if (kDebugMode) {
      print(listCurrentPosts.toList());
    }
  }

  Future pickImage(ImageSource media) async {
    try {
      var photo = await picker.pickImage(
          source: media, imageQuality: 70, maxHeight: 150, maxWidth: 200);
      if (photo == null) return null;

      setState(() => image = photo);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('${app_constants.imagePickerFileErrorMessage}$e');
      }
    }
  }

  void selectImageSource() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text(app_constants.imagePickerSelectSource),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        pickImage(ImageSource.gallery);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.image),
                          Text(app_constants.imagePickerGallery),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        pickImage(ImageSource.camera);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.camera),
                          Text(app_constants.imagePickerCamera),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidate,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  autofocus: true,
                  focusNode: titleFieldFocusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: app_constants.composeFormTitleLabel,
                    hintText: app_constants.composeFormTitleHintText,
                    alignLabelWithHint: true,
                    errorStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return app_constants.composeErrorMessageTitle;
                    }
                    return null;
                  },
                  controller: titleFieldController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 7,
                  maxLines: 15,
                  maxLength: 1000,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: app_constants.composeFormTextLabel,
                    hintText: app_constants.composeFormTextHintLabel,
                    alignLabelWithHint: true,
                    errorStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return app_constants.composeErrorMessageContent;
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 20),
                  controller: contentFieldController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                child: ElevatedButton.icon(
                  onPressed: selectImageSource,
                  icon: const Icon(Icons.image),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  label: Text(
                    image == null
                        ? app_constants.composeButtonSelectImage
                        : app_constants.composeButtonModifyImage,
                    style: const TextStyle(
                        fontSize: app_constants.buttonLabelSize),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              image != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                        ),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      child: Text(
                        app_constants.imagePickerNoImageMessage,
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Wrap(
                  spacing: 5,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addNewPost({
                            "title": titleFieldController.text,
                            "content": contentFieldController.text
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  app_constants.composeMessagePostInProgress),
                            ),
                          );
                          resetAllInputs();
                          getAllPosts();
                        }
                      },
                      icon: const Icon(Icons.send),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonPost,
                        style:
                            TextStyle(fontSize: app_constants.buttonLabelSize),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: resetAllInputs,
                      icon: const Icon(Icons.delete_forever),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonErase,
                        style:
                            TextStyle(fontSize: app_constants.buttonLabelSize),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        resetAllInputs;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const HomePage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.cancel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      label: const Text(
                        app_constants.composeButtonCancel,
                        style:
                            TextStyle(fontSize: app_constants.buttonLabelSize),
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
