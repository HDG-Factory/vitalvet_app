import 'dart:ui';

import 'package:flutter/material.dart';

class IconBarBtn extends StatelessWidget {
  const IconBarBtn({Key? key, this.onPressed, required this.iconBar})
      : super(key: key);

  final VoidCallback? onPressed;
  final Widget iconBar;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width: lerpDouble(50, 235, animation.value)!,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onPressed,
                child: SizedBox(
                  width: 50,
                  child: iconBar,
                ),
              ),
              Visibility(
                visible: animation.value > 0.5,
                child: const Icon(
                  Icons.keyboard_double_arrow_left,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
