import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/responsive_utils.dart';

class ResponsivePage extends StatelessWidget {
  final Widget child;

  const ResponsivePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils.recalculate(context);

    return child;
  }
}
