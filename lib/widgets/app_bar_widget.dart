import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({
    Key? key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  get appBarGradient {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromRGBO(1, 138, 58, 1),
                Color.fromRGBO(86, 195, 44, 1),
                Color.fromRGBO(116, 212, 43, 1),
              ],
              stops: [0.27, 0.64, 0.8, 0.92],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        const Positioned(
          top: 28,
          right: 80,
          child: AcidDropWidget(
            height: 40,
            width: 45,
          ),
        ),
        const Positioned(
          top: 25,
          right: 100,
          child: AcidDropWidget(),
        ),
        const Positioned(
          top: 45,
          right: 120,
          child: AcidDropWidget(
            height: 30,
            width: 20,
          ),
        ),
        const Positioned(
          top: 20,
          left: 2,
          child: AcidDropWidget(
            height: 15,
            width: 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
        child: const Text(
          'Rick and Morty info',
          style: TextStyle(
            fontFamily: 'Quanco',
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      flexibleSpace: appBarGradient,
    );
  }
}

class AcidDropWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const AcidDropWidget({
    Key? key,
    this.height = 25,
    this.width = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
          colors: [
            Color.fromRGBO(204, 255, 0, 1),
            Color.fromRGBO(1, 138, 58, 1),
            Color.fromRGBO(116, 212, 43, 1).withOpacity(0.09),
            // Color.fromRGBO(116, 212, 43, 1).withOpacity(0.1),
          ],
        ),
      ),
    );
  }
}
