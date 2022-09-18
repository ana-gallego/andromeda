import 'package:flutter/material.dart';

import 'tools/tools.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Andromeda',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: colors.primaryColor,
          useMaterial3: true,
          scaffoldBackgroundColor: colors.primaryColor),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
