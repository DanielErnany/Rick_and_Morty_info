import 'dart:async';

import 'package:flutter/material.dart';

class LedAnimatedWidget extends StatefulWidget {
  final LinearGradient highGradient;
  final LinearGradient lowGradient;

  const LedAnimatedWidget({
    Key? key,
    required this.highGradient,
    required this.lowGradient,
  }) : super(key: key);

  @override
  State<LedAnimatedWidget> createState() => _LedAnimatedWidgetState();
}

class _LedAnimatedWidgetState extends State<LedAnimatedWidget> {
  late bool _lightHigh;
  late LinearGradient _currentGradientLight;

  void mudarCor() {
    setState(() {
      if (_lightHigh) {
        _currentGradientLight = widget.highGradient;
      } else {
        _currentGradientLight = widget.lowGradient;
      }
      _lightHigh = !_lightHigh;
    });
  }

  @override
  void initState() {
    _lightHigh = false;
    _currentGradientLight = widget.highGradient;

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        mudarCor();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: 30,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            gradient: _currentGradientLight,
          ),
          duration: const Duration(seconds: 1),
        ),
        Row(
          children: [
            Container(
              height: 15,
              width: 5,
              color: Colors.blueGrey,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 15,
              width: 5,
              color: Colors.blueGrey,
            ),
          ],
        )
      ],
    );
  }
}
