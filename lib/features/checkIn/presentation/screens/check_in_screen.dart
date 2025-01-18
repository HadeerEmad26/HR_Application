import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/features/auth/data/reposetry/auth_repo.dart';
import 'package:hr/features/auth/presentation/auth_cubit/login_cubit.dart';
import 'package:hr/features/checkIn/presentation/components/date_time_check_in_component.dart';
import 'package:hr/features/checkIn/presentation/components/finger_print_component.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.account_circle_outlined),
                ),
                SizedBox(
                  width: 18.w,
                ),
                BlocProvider(
                  create: (context) => LoginCubit(AuthRepository()),
                  child: Text(
                      BlocProvider.of<LoginCubit>(context).emailController.text,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                      AppStrings.back,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: 345.w,
                height: 210.h,
                child: DateTimeScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: SizedBox(
                width: 200.w,
                  height: 218.h,
                  child: FingerPrint()),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                AppStrings.overview,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,top: 15),
                  child: Container(
                    padding: EdgeInsets.only(left: 8,top: 8),
                    width: 138.w,
                    height: 82.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.green
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.insert_emoticon),
                            SizedBox(
                              width: 58.w,
                            ),
                            CircleAvatar(
                              child: Text("0"),)
                          ],
                        ),
                        Text(
                          AppStrings.leave,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 25.w,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0,top: 15),
                  child: Container(
                    padding: EdgeInsets.only(left: 8,top: 8),
                    width: 138.w,
                    height: 82.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.green
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.repeat),
                            SizedBox(
                              width: 58.w,
                            ),
                            CircleAvatar(
                              child: Text("3"),)
                          ],
                        ),
                        Text(
                          AppStrings.request,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}