import 'package:flutter/material.dart';
import '../MyFunctions/home_controller.dart';

class DropdownWidget extends StatelessWidget {
  final AnimationControllerX controller;

  const DropdownWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Color>(
        value: controller.selectedColor,
        onChanged: (Color? value) {
          if (value != null) {
            controller.updateSelectedColor(value);
          }
        },
        items: const [
          DropdownMenuItem(value: Colors.green, child: Text('Green')),
          DropdownMenuItem(value: Colors.red, child: Text('Red')),
          DropdownMenuItem(value: Colors.purple, child: Text('Purple')),
          DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
        ],
      ),
    );
  }
}
