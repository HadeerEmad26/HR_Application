import 'package:flutter/material.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache_helper/cache_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_image.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async{
      await sl<CacheHelper>().getData(
        key: ApiKeys.token,
      )==null?
      navigateReplacement(context: context, route: Routes.welcomeScreen, arguments: {}):
      navigateReplacement(context: context, route: Routes.loginScreen, arguments: {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomImage(
              imagePath: AppAssets.splash,
              fit: BoxFit.fill,

            ),
          ),
        ],
      ),
     // backgroundColor: AppColors.primary,
    );
  }
}