//Singleton creation adding only one instanse through out our app

import 'package:flutter/cupertino.dart';

class AppIcons {
  AppIcons._();
  static const fontFam = 'AppIcons';
  static const IconData trophyOutline = IconData(0xe808, fontFamily: fontFam);
  static const IconData menuLeft = IconData(0xe805, fontFamily: fontFam);
  static const IconData peace = IconData(0xe800, fontFamily: fontFam);
  static const IconData gitHub = IconData(0xe802, fontFamily: fontFam);
  static const IconData menu = IconData(0xe804, fontFamily: fontFam);
}
