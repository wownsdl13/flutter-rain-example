import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/window_page/local_utils/window_controller.dart';
import 'package:weather/screens/window_page/local_widgets/rain/rain.dart';

class WindowPage extends StatelessWidget {
  const WindowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WindowController>(
      init: Get.find<WindowController>(),
      builder: (controller) {
        return window(controller);
      },
    );
  }

  Widget window(WindowController controller) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(.08),
              alignment: Alignment.centerRight,
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: LayoutBuilder(builder: (context, constraint) {
                  var size = constraint.biggest;
                  return ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.brown.shade600),
                      child: Stack(
                        children: [
                          Positioned.fill(child: CustomPaint(painter: LinePainter())),
                          Padding(
                            padding: EdgeInsets.all(size.width / 10),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.brown.shade800),
                              padding: EdgeInsets.all(size.width / 35),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Colors.black, Colors.blue.shade900])),
                                  ),
                                  Rain(screen: size),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Align(
              widthFactor: .95,
              child: Transform(
                  transform: Matrix4.identity()..setEntry(3, 2, 0.01)..rotateY(-.1),
                  alignment: Alignment.centerLeft,
                  child: Container(width: 30, color: Colors.brown.shade800,)),
            )
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = size.width/50..style = PaintingStyle.stroke..color = Colors.brown.shade700;
    canvas.drawPath(Path()..lineTo(size.width, size.height), paint);
    canvas.drawPath(Path()..moveTo(size.width, 0)..lineTo(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
