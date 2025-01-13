import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomImage(
              imagePath: AppAssets.home
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                  imagePath: AppAssets.logo,
              ),

              SizedBox(
                height: 16.h,
              ),

              SizedBox(
                height: 40.h,
                width: 273.w,
                child: TextButton(
                  onPressed: (){
                    navigateReplacement(context: context, route: Routes.addRequestScreen);
                  },
                  style: TextButton.styleFrom(backgroundColor: AppColors.green),
                  child: const Text(
                    AppStrings.addRequest,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),

                ),
              ),

              SizedBox(
                height: 16.h,
              ),

              SizedBox(
                height: 40.h,
                width: 273.w,
                child: TextButton(
                  onPressed: (){
                    navigateReplacement(context: context, route: Routes.checkInScreen);
                  },
                  style: TextButton.styleFrom(backgroundColor: AppColors.green),
                  child: const Text(
                    AppStrings.checkIn,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),

                ),
              ),

            ],
          )
        ]
      ),
    );
  }
}
