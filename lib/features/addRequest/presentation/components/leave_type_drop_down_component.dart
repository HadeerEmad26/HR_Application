import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../request_Cubit/add_request_cubit.dart';

class LeaveTypeDropDownComponent extends StatelessWidget {
  const LeaveTypeDropDownComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 230.w,
      child: DropdownButton(
        style: TextStyle(
            color: AppColors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
        borderRadius: BorderRadius.circular(16.r),
        isExpanded: true,
        value: BlocProvider.of<AddRequestCubit>(context).selectedItem,
        hint: Text(AppStrings.reason),
        items: BlocProvider.of<AddRequestCubit>(context).leaveTypeList
            .map(
              (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
            .toList(),
        onChanged: (data) {
          BlocProvider.of<AddRequestCubit>(context).changeItem(data);
        },
      ),

    );
  }
}
