import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding:  EdgeInsets.only(left: 16.w,),
             child: SizedBox(
               height:96.h ,
               width: 293.w,
               child: const Text(
                 maxLines: 2,
                 AppStrings.welcomeTo,
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                ),
                           ),
             ),
           ),
          SizedBox(height: 64.h,),
          const CustomImage(imagePath: AppAssets.welcomeTo),
          SizedBox(
            height: 55.h,
          ),
          Center(
            child: TextButton(
                onPressed: (){
                  navigateReplacement(context: context, route: Routes.loginScreen, arguments: {});
                },
              style: TextButton.styleFrom(backgroundColor: AppColors.green),
                child: const Text(
                  AppStrings.letStart,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),

            ),
          ),

           ],
      ),
    );
  }
}
