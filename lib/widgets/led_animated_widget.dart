import 'dart:async';

import 'package:flutter/material.dart';

class LedAnimatedWidget extends StatefulWidget {
  const LedAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<LedAnimatedWidget> createState() => _LedAnimatedWidgetState();
}

class _LedAnimatedWidgetState extends State<LedAnimatedWidget> {
  late bool _lightHigh;
  late LinearGradient _gradientLight;

  final LinearGradient _highGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromRGBO(1, 138, 58, 1),
      Color.fromRGBO(116, 212, 43, 1),
      Color.fromARGB(255, 135, 245, 50),
    ],
  );
  final LinearGradient _lowGradient = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromARGB(255, 1, 42, 18),
      Color.fromRGBO(1, 138, 58, 1),
    ],
  );

  void mudarCor() {
    setState(() {
      if (_lightHigh) {
        _gradientLight = _highGradient;
      } else {
        _gradientLight = _lowGradient;
      }
      _lightHigh = !_lightHigh;
    });
  }

  @override
  void initState() {
    _lightHigh = false;
    _gradientLight = _highGradient;

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
            gradient: _gradientLight,
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
