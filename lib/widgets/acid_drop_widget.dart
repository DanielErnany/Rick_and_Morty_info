import 'package:flutter/material.dart';

class AcidDropWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final RadialGradient radialGradient;
  const AcidDropWidget({
    Key? key,
    this.height = 25,
    this.width = 25,
    this.radialGradient = const RadialGradient(
      colors: [
         Color.fromRGBO(204, 255, 0, 1),
         Color.fromRGBO(1, 138, 58, 1),
         Color.fromRGBO(116, 212, 43, 1),
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: this.radialGradient //  RadialGradient(
          //   colors:
          //    [
          //     const Color.fromRGBO(204, 255, 0, 1),
          //     const Color.fromRGBO(1, 138, 58, 1),
          //     const Color.fromRGBO(116, 212, 43, 1).withOpacity(0.09),
          //   ]
          //   ,
          // ),
          ),
    );
  }
}
