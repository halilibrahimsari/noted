import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeWidth;
  static double _blockSizeHeight;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeWidth = _screenWidth / 100;
    _blockSizeHeight = _screenHeight / 100;

    textMultiplier = _blockSizeHeight;
    imageSizeMultiplier = _blockSizeWidth;
    heightMultiplier = _blockSizeHeight;
    widthMultiplier = _blockSizeWidth;

    print(_blockSizeWidth);
    print(_blockSizeHeight);
  }
}