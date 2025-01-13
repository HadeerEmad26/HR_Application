import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/routes/app_routes.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/core/utils/commens.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_state.dart';

class RequestComponent extends StatelessWidget {
  const RequestComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: BlocBuilder<AddRequestCubit, AddRequestState>(
          builder: (context, state) {
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
                              route: Routes.addRequestScreen,);
                        },
                        child: Text(
                          AppStrings.back,
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
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
                        fontWeight: FontWeight.w600
                    ),
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
                            fontWeight: FontWeight.bold
                          ),
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
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                  BlocProvider.of<AddRequestCubit>(context).startTime,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
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
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                BlocProvider.of<AddRequestCubit>(context).endTime,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
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
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                BlocProvider.of<AddRequestCubit>(context).reasonController.text,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
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
          },
        ),
      ),
    );
  }
}
