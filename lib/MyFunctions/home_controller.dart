import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerX extends GetxController
    with SingleGetTickerProviderMixin {
  Color selectedColor = Colors.green;
  double speed = 1.0;
  late AnimationController _controller;
  late Animation<double> animation;
  bool isAnimating = false;
  int totalItems = 1; // Default total items to 1
  int itemsInLine = 1;
  int currentItemIndex = 0;
  final TextEditingController itemsController = TextEditingController();
  final TextEditingController itemsInLineController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (currentItemIndex + 1 < totalItems) {
          currentItemIndex++;
          update();
          _controller.reset();
          _controller.forward();
        } else {
          currentItemIndex = 0; // Reset index for repeating the animation
          isAnimating = false;
          startFillingAnimation(); // Start animation from the beginning
          update();
        }
      }
    });

    startFillingAnimation();
  }

  void startFillingAnimation() {
    if (isAnimating || currentItemIndex >= totalItems) return;

    isAnimating = true;

    _controller.duration = Duration(seconds: (5 ~/ speed).toInt());
    _controller.reset();
    _controller.forward();
    update();
  }

  void updateSelectedColor(Color newColor) {
    selectedColor = newColor;
    update();
  }

  void updateSpeed(double newSpeed) {
    speed = newSpeed;
    _controller.duration = Duration(seconds: (5 ~/ speed).toInt());
    _controller.forward(from: 0);
    update();
  }

  String getSpeedLabel() {
  if (speed == 1) {
    return 'Slow';
  } else if (speed == 2) {
    return 'Smooth';
  } else {
    return 'Fast';
  }
}


  void updateTotalItems(String value) {
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue < 1 || parsedValue > 30) {
      Get.snackbar('Error', 'Total items must be between 1 and 30');
      return;
    }
    totalItems = parsedValue;
    currentItemIndex = 0;
    startFillingAnimation();
    update();
  }

  void updateItemsInLine(String value) {
    int? parsedValue = int.tryParse(value);
    if (parsedValue == null || parsedValue < 1 || parsedValue > 15) {
      Get.snackbar('Error', 'Items in a line must be between 1 and 15');
      return;
    }
    itemsInLine = parsedValue;
    currentItemIndex = 0;
    startFillingAnimation();
    update();
  }

  @override
  void onClose() {
    _controller.dispose();
    itemsController.dispose();
    itemsInLineController.dispose();
    super.onClose();
  }
}
