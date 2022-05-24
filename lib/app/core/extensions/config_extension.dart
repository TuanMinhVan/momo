import '../utilities/utilities.dart';

extension FlavorExtFromString on String? {
  AppFlavor get flavor {
    switch (this) {
      case 'dev':
        return AppFlavor.development;
      case 'staging':
        return AppFlavor.staging;
      default:
        return AppFlavor.production;
    }
  }
}

extension FlavorExtToString on AppFlavor {
  String get flavor {
    switch (this) {
      case AppFlavor.development:
        return 'dev';
      case AppFlavor.staging:
        return 'staging';
      default:
        return 'production';
    }
  }
}
