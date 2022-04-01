import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/window_page/local_widgets/rain/local_utils/rain_controller.dart';
import 'package:weather/screens/window_page/local_widgets/rain/local_widgets/one_drop.dart';

class Rain extends StatelessWidget {
  const Rain({Key? key, required this.screen}) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RainController>(
        init: Get.put(RainController()),
        builder: (controller) {
          return Stack(
              children: controller.rainDropId
                  .map((e) => OneDrop(id: e, screen: screen))
                  .toList());
        });
  }
}
