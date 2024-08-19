import 'package:flutter/material.dart';
import '../MyFunctions/home_controller.dart';

class TextFormFieldsWidget extends StatelessWidget {
  final AnimationControllerX controller;

  const TextFormFieldsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controller.itemsController,
            decoration: const InputDecoration(
              labelText: 'Total Items',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.updateTotalItems(value);
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controller.itemsInLineController,
            decoration: const InputDecoration(
              labelText: 'Items in Line',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.updateItemsInLine(value);
            },
          ),
        ),
      ],
    );
  }
}
