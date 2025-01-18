import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/features/addRequest/data/model/add_request_model.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../request_Cubit/add_request_cubit.dart';

class MyRequestsComponents extends StatelessWidget {
  const MyRequestsComponents({
    super.key, required this.addRequestModel,
  });

final AddRequestModel addRequestModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  navigateReplacement(
                    context: context,
                    route: Routes.addRequestScreen,
                  );
                },
                child: Text(
                  AppStrings.back,
                  style: TextStyle(
                      color: AppColors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            AppStrings.myRequests,
            style: TextStyle(
                color: AppColors.green,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 30),
          child: Container(
            height: 116.h,
            width: 343.w,
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(16.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  BlocProvider.of<AddRequestCubit>(context)
                      .todayDate
                      .toString()
                      .split(" ")[0],
                  style: TextStyle(
                      color: AppColors.darkGray,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.startTime,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        BlocProvider.of<AddRequestCubit>(context)
                            .startTime,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.endTime,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        BlocProvider.of<AddRequestCubit>(context)
                            .endTime,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.reason,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        BlocProvider.of<AddRequestCubit>(context)
                            .selectedItem,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.note,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        BlocProvider.of<AddRequestCubit>(context)
                            .noteController
                            .text,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
