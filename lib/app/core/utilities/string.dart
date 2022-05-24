class StringUtils {
  factory StringUtils() => _instance;
  StringUtils._internal();
  static final StringUtils _instance = StringUtils._internal();
}
