import 'package:flutter/material.dart';
import 'package:vitalvet_app/constants/breakpoints.dart';

bool get isPortrait => ResponsiveUtils.orientation == Orientation.portrait;

bool get isSmallScreen => ResponsiveUtils._screenWidth < Breakpoints.smallScreen;
bool get isMediumScreen => ResponsiveUtils._screenWidth >= Breakpoints.smallScreen && ResponsiveUtils._screenWidth < Breakpoints.mediumScreen;
bool get isLargeOrMoreScreen => ResponsiveUtils._screenWidth >= Breakpoints.mediumScreen && ResponsiveUtils._screenWidth < Breakpoints.largeScreen;
bool get isUltraLargeScreen => ResponsiveUtils._screenWidth >= Breakpoints.largeScreen;
int get titleBarHeight => 50;

void forceRerender(context) {
  MediaQuery.of(context);
}

class ResponsiveUtils {
  static double w = 0;
  static double h = 0;
  static double _minDimension = 0;
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static Orientation orientation = Orientation.portrait;
  static int screenSizePoint = ScreenSizePoint.small.index;
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static void recalculate(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    //? Calculate 1% of the screen width or heigth
    w = _screenWidth / 100;
    h = _screenHeight / 100;
    // Decide which dimension is smaller
    if (_screenWidth < _screenHeight) {
      orientation = Orientation.portrait;
      _minDimension = _screenWidth / 100.0;
    } else {
      orientation = Orientation.landscape;
      _minDimension = _screenHeight / 100.0;
    }

    if (_screenWidth < Breakpoints.smallScreen) {
      screenSizePoint = ScreenSizePoint.small.index;
    } else if (_screenWidth >= Breakpoints.smallScreen && _screenWidth < Breakpoints.mediumScreen) {
      screenSizePoint = ScreenSizePoint.medium.index;
    } else if (_screenWidth >= Breakpoints.mediumScreen && _screenWidth < Breakpoints.largeScreen) {
      screenSizePoint = ScreenSizePoint.large.index;
    } else if (_screenWidth >= Breakpoints.largeScreen) {
      screenSizePoint = ScreenSizePoint.ultralarge.index;
    }
  }
}

extension DoubleToMinimumScreenBloc on num {
  // Get minimum screen bloc size
  double get sb => this * ResponsiveUtils._minDimension;
  double get hb => this * ResponsiveUtils.h;
  double get wb => this * ResponsiveUtils.w;
}
