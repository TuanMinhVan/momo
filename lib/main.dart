import 'dart:async';

import 'package:get/get.dart';

import 'app/core/styles/style.dart';
import 'app/core/utilities/utilities.dart';
import 'app/root.dart';

Future<void> initServices() async {
  Get.log('Starting services ...');
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.setPreferences();
  setFlavor(baseUrl: '', flavor: AppFlavor.development);
  Get.log('All services started...');
  return;
}

Future<void> main() async {
  await initServices();
  runApp(const RootApp());
}
