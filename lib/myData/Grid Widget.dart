import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MyFunctions/home_controller.dart';

class GridWidget extends StatelessWidget {
  final AnimationControllerX controller;

  const GridWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final rows = (controller.totalItems / controller.itemsInLine).ceil();
        return ListView.builder(
          itemCount: rows,
          itemBuilder: (context, rowIndex) {
            final int count = rowIndex < rows - 1
                ? controller.itemsInLine
                : controller.totalItems - rowIndex * controller.itemsInLine;
            final double itemWidth =
                (screenWidth - (8.0 * (controller.itemsInLine - 1))) /
                    controller.itemsInLine;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  count,
                  (itemIndex) {
                    return GridItemWidget(
                      controller: controller,
                      rowIndex: rowIndex,
                      itemIndex: itemIndex,
                      itemWidth: itemWidth,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final AnimationControllerX controller;
  final int rowIndex;
  final int itemIndex;
  final double itemWidth;

  const GridItemWidget({
    super.key,
    required this.controller,
    required this.rowIndex,
    required this.itemIndex,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    final int itemIndexAbsolute =
        rowIndex * controller.itemsInLine + itemIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      child: Container(
        height: Get.height * 0.02,
        width: itemWidth,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: itemIndexAbsolute < controller.currentItemIndex
            ? Container(
                height: Get.height * 0.02,
                width: itemWidth,
                decoration: BoxDecoration(
                  color: controller.selectedColor,
                ),
              )
            : itemIndexAbsolute == controller.currentItemIndex
                ? AnimatedBuilder(
                    animation: controller.animation,
                    builder: (context, child) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: Get.height * 0.02,
                          width: itemWidth * controller.animation.value,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                controller.selectedColor,
                                controller.selectedColor.withOpacity(0.5),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: const [0.0, 1.0],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(width: itemWidth),
      ),
    );
  }
}
