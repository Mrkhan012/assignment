import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/image.jpg',
        height: 200,
        width: 200, // Replace with your image path
      ),
    );
  }
}
