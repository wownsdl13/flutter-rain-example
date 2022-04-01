import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/window_page/local_utils/window_controller.dart';

import 'screens/window_page/window_page.dart';

void main() {//
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder((){
        Get.put(WindowController());
      }),
      home: const Scaffold(
          backgroundColor: Colors.green,
          body: WindowPage())));
}
