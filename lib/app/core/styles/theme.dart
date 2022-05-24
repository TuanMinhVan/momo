part of style;

class AppTheme {
  AppTheme._();

  factory AppTheme() => _instance;

  static final AppTheme _instance = AppTheme._();

  static const Color primary = Color(0xffA50764);
  static const Color titleColor = Color(0xff4B5B79);
  static LinearGradient get giftLinearGradient => const LinearGradient(
        colors: [
          Color(0xff4EB4FD),
          Color(0xff1D9FFD),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );

  static LinearGradient linearGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        context.primary,
        context.secondary,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static ThemeData getCollectionTheme() {
    late ColorScheme colorScheme = const ColorScheme.light(primary: primary);
    final dark = colorScheme.brightness == Brightness.dark;
    final indicatorColor = dark ? colorScheme.onSurface : colorScheme.primary;
    final themeData = ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.surface,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: dark,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
    return themeData;
  }
}
