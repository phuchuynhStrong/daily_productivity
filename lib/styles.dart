/// //////////////////////////////////////////////////////////////
/// Styles - Contains the design system for the entire app.

/// Used for all animations in the  app
class Times {
  static const fastest = Duration(milliseconds: 100);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class IconSizes {
  static const double scale = 1;
  static const double lg = 24 * scale;
  static const double med = 20 * scale;
  static const double sm = 16 * scale;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  static double get offset => 40 * offsetScale;
}

class Corners {
  static const double radiusVal = 9;
  static const double radiusXsVal = 2;
  static const double radiusSmVal = 4;
}
