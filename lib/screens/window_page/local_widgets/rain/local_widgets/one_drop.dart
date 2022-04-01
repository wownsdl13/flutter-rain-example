import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/screens/window_page/local_widgets/rain/local_utils/rain_controller.dart';

class OneDrop extends StatefulWidget {
  OneDrop({required this.id, required this.screen}) : super(key: ValueKey(id));
  final Size screen;
  final String id;

  @override
  _OneDropState createState() => _OneDropState();
}

class _OneDropState extends State<OneDrop> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  late double _startX, _moveX;
  late double _opacity;
  late double _scale;
  @override
  void initState() {
    _startX = widget.screen.width * Random().nextDouble() + widget.screen.width / 10;
    _moveX = 10 + 10 * Random().nextDouble();
    _opacity = .6 + .4 * Random().nextDouble();
    _scale = .8 + .2 * Random().nextDouble();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
                400 + (200 * Random().nextDouble()).floor())); // 0.4 ~ 0.6 ?
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.addListener(() {
      setState(() {

      });
    });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        // change drop pos
        var rainController = Get.find<RainController>();
        rainController.resetDrop(widget.id);
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dropHeight = widget.screen.height * .17;
    var dropWidth = dropHeight * .08;
    return Positioned(
      top: (widget.screen.height + dropHeight) * _animation.value - dropHeight,
      right: _startX + _moveX * _animation.value,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(_moveX * .1 / 360),
        child: Transform.scale(
          scale: _scale,
          child: Container(
            height: dropHeight,
            width: dropWidth,
            decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(_opacity), borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
