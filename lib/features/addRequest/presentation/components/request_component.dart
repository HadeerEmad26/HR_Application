import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commens.dart';
import '../request_Cubit/add_request_cubit.dart';
import 'my_requests_components.dart';

class RequestComponentScreen extends StatelessWidget {
  const RequestComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddRequestCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: cubit.requests.isEmpty
          ? Center(
              child: Text(
                'No Requests Yet',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15),
                        child: InkWell(
                          onTap: () {
                            navigateReplacement(
                              context: context,
                              route: Routes.addRequestScreen,
                              arguments: {},
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.requests.length,
                      itemBuilder: (context, index) {
                        final request = cubit.requests[index];
                        return RequestItem(request: request);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
    );
  }
}
