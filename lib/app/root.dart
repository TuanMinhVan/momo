import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/styles/style.dart';
import 'core/utilities/utilities.dart';
import 'routes/app_pages.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          child: GetMaterialApp(
            showPerformanceOverlay: false,
            debugShowCheckedModeBanner: false,
            title: AppConfig.instance.appName,
            theme: AppTheme.getCollectionTheme(),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            routingCallback: (_) {
              WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
            },
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
          ),
          onTap: () {
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
          },
        );
      },
    );
  }
}
