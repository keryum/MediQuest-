import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart';
import 'package:mediquest/app/ui/routes/app_routes.dart';
import 'package:mediquest/app/ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'mediquest!',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
    );
  }
}
