import 'package:flutter/material.dart';

import '../constants/constants.dart';

bool get isPortrait => ScreenSize.orientation == Orientation.portrait;

bool get isSmallScreen => ScreenSize._screenWidth < MEDIUM_BREAKPOINT;
bool get isMediumOrMoreScreen => ScreenSize._screenWidth >= MEDIUM_BREAKPOINT;
bool get isLargeOrMoreScreen => ScreenSize._screenWidth >= LARGE_BREAKPOINT;

void forceRerender(context) {
  MediaQuery.of(context);
}

class ScreenSize {
  static double w = 0;
  static double h = 0;
  static double _minDimension = 0;
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static Orientation orientation = Orientation.portrait;
  static int screenSizePoint = SMALL_SCREEN_SIZE;
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

    if (_screenWidth < MEDIUM_BREAKPOINT) {
      screenSizePoint = SMALL_SCREEN_SIZE;
      // print('small');
    } else if (_screenWidth >= MEDIUM_BREAKPOINT &&
        _screenWidth < LARGE_BREAKPOINT) {
      screenSizePoint = MEDIUM_SCREEN_SIZE;
      // print('medium');
    } else if (_screenWidth >= LARGE_BREAKPOINT) {
      screenSizePoint = LARGE_BREAKPOINT;
      // print('large');
    }
  }
}

extension DoubleToMinimumScreenBloc on num {
  // Get minimum screen bloc size
  double get sb => this * ScreenSize._minDimension;
  double get hb => this * ScreenSize.h;
  double get wb => this * ScreenSize.w;
}
