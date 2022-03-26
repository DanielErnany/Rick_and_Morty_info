import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:rick_and_morty_info/widgets/acid_drop_widget.dart';

class AcidCircularProgressIndicatorWidget extends StatefulWidget {
  const AcidCircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  State<AcidCircularProgressIndicatorWidget> createState() =>
      _AcidCircularProgressIndicatorWidgetState();
}

class _AcidCircularProgressIndicatorWidgetState
    extends State<AcidCircularProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? _angleAnimation;

  Animation<double>? _scaleAnimation;

  AnimationController? _controller;

  late double _circleWidth;
  bool _finishAnimation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _angleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _scaleAnimation = Tween(begin: 1.0, end: 6.0).animate(_controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    _angleAnimation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _finishAnimation = true;
        });
        _controller?.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller?.forward();
      }
    });

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildAnimation() {
    _circleWidth =
        _finishAnimation == false ? 10 * _scaleAnimation!.value : _circleWidth;
    Widget circles = Container(
      width: _circleWidth * 3,
      height: _circleWidth * 3,
      child: Stack(
        children: <Widget>[
          Container(
            height: _circleWidth * 3,
            width: _circleWidth * 2.87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(1, 138, 58, 1),
                  Color.fromRGBO(116, 212, 43, 1),
                  Color.fromRGBO(116, 212, 43, 0.1),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 16,
            child: AcidDropWidget(
              height: _circleWidth,
              width: _circleWidth,
              radialGradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(1, 138, 58, 1),
                  Color.fromRGBO(116, 212, 43, 1),
                  Color.fromRGBO(116, 212, 43, 0.1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 23,
            child: AcidDropWidget(
              height: _circleWidth,
              width: _circleWidth,
              radialGradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(1, 138, 58, 1),
                  Color.fromRGBO(116, 212, 43, 1),
                  Color.fromRGBO(116, 212, 43, 0.1),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            child: AcidDropWidget(
              height: _circleWidth,
              width: _circleWidth,
              radialGradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(1, 138, 58, 1),
                  Color.fromRGBO(116, 212, 43, 1),
                  Color.fromRGBO(116, 212, 43, 0.1),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 35,
            child: AcidDropWidget(
              height: _circleWidth,
              width: _circleWidth,
              radialGradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(1, 138, 58, 1),
                  Color.fromRGBO(116, 212, 43, 1),
                  Color.fromRGBO(116, 212, 43, 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    double angleInDegrees = _angleAnimation!.value;
    return Transform.rotate(
      angle: angleInDegrees / 360 * 2 * math.pi,
      child: Container(
        child: circles,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation();
  }
}
