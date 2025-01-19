import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:hr/core/utils/app_strings.dart';
import 'package:hr/core/widgets/custom_button.dart';
import 'package:hr/core/widgets/custom_text_form_field.dart';
import 'package:hr/features/addRequest/presentation/components/select_time_request_component.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_state.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/commens.dart';
import '../../../../core/widgets/custom_date_calendar.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../components/leave_type_drop_down_component.dart';

class AddRequestScreen extends StatelessWidget {
   AddRequestScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AddRequestCubit, AddRequestState>(
          listener: (context, state) {
            if (state is SaveRequestDataSuccessState) {
              showToast(
                  message: AppStrings.saveRequests, state: ToastStates.success);

              navigateReplacement(
                context: context,
                route: Routes.requestComponentScreen,
                arguments: {},
              );
            }

            if (state is SaveRequestDataErrorState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Selected Date = ${BlocProvider.of<AddRequestCubit>(context).todayDate.toString().split(" ")[0]}",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    DateCalendar(),
                    Divider(
                      height: 40.h,
                      thickness: 1.5,
                      endIndent: 25,
                      indent: 25,
                      color: AppColors.green,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.startTime,
                            style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            )),
                        SelectTimeRequestComponent(
                          hintText: BlocProvider.of<AddRequestCubit>(context)
                              .startTime,
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<AddRequestCubit>(context)
                                  .getStartTime(context);
                            },
                            icon: Icon(Icons.timer_outlined),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.endTime,
                            style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            )),
                        SelectTimeRequestComponent(
                          hintText:
                          BlocProvider.of<AddRequestCubit>(context).endTime,
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<AddRequestCubit>(context)
                                  .getEndTime(context);
                            },
                            icon: Icon(Icons.timer_outlined),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.reason,
                            style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            )),
                        LeaveTypeDropDownComponent(),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(AppStrings.note,
                          style:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        height: 44.h,
                        width: 230.w,
                        child: CustomTextFormField(
                          controller: BlocProvider.of<AddRequestCubit>(context)
                              .noteController,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 30.h,
                    ),
                    state is AddRequestLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                      width: 145.w,
                      onPressed: () {
                        BlocProvider.of<AddRequestCubit>(context).insertRequests();
                        navigate(
                          context: context,
                          route: Routes.requestComponentScreen,
                        );
                      },
                      text: AppStrings.save,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}