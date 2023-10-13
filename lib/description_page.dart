import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 300,
                height: 200,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
