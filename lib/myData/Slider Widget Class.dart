import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MyFunctions/home_controller.dart';

class SliderWidget extends StatelessWidget {
  final AnimationControllerX controller;

  const SliderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: Get.width * 0.4,
            child: Slider(
              value: controller.speed,
              min: 1,
              max: 3,
              divisions: 2, // Only three points (1, 2, 3)
              label: controller.getSpeedLabel(),
              activeColor: controller.selectedColor,
              inactiveColor: controller.selectedColor.withOpacity(0.3),
              onChanged: (value) {
                controller.updateSpeed(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
