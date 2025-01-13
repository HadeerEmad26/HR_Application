import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:  (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
         initialRoute: Routes.intialRoutes,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );

  }
}
