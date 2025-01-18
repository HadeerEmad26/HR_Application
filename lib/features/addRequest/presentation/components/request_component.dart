import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/core/utils/app_colors.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_state.dart';

import 'my_requests_components.dart';

class RequestComponent extends StatelessWidget {
  const RequestComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: BlocBuilder<AddRequestCubit, AddRequestState>(
          builder: (context, state) {
            return BlocProvider.of<AddRequestCubit>(context).requests.isEmpty
                ? Text("No Requests Yet")
                : ListView.builder(
              itemCount: BlocProvider.of<AddRequestCubit>(context).requests.length,
                itemBuilder:  (context, index) {
                  return  MyRequestsComponents(
                    addRequestModel: BlocProvider.of<AddRequestCubit>(context)
                    .requests[index],
                  );
                },
            );
          },
        ),
      ),
    );
  }
}

