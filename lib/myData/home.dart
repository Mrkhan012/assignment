import 'package:assignment/myData/Grid%20Widget.dart';
import 'package:assignment/myData/Slider%20Widget%20Class.dart';
import 'package:assignment/myData/Text%20Form%20Fields_widget.dart';
import 'package:assignment/myData/buildImage.dart';
import 'package:assignment/myData/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MyFunctions/home_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GetBuilder<AnimationControllerX>(
            init: AnimationControllerX(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageWidget(),
                  const SizedBox(height: 20),
                  DropdownWidget(controller: controller),
                  const SizedBox(height: 20),
                  SliderWidget(controller: controller),
                  const SizedBox(height: 20),
                  TextFormFieldsWidget(controller: controller),
                  const SizedBox(height: 20),
                  Expanded(child: GridWidget(controller: controller)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
