import 'package:flutter/material.dart';

import '../utils/images.dart';
import 'acid_drop_widget.dart';

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
          child: Image.asset(
            Images.RICK_AND_MORTY_INFO_APP_NAME,
            width: 245,
          )
  
          ),
      flexibleSpace: appBarGradient,
    );
  }
}
