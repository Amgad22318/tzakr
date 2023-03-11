import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tzaker_task/core/router/app_router.dart';
import 'package:tzaker_task/core/styles/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await MyDio.init();

  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        locale: const Locale('ar',  ''),
        builder: DevicePreview.appBuilder,
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
