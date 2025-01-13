import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_cubit.dart';
import 'package:hr/features/addRequest/presentation/request_Cubit/add_request_state.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/app_colors.dart';


class DateCalendar extends StatelessWidget {
  const DateCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestCubit, AddRequestState>(
  builder: (context, state) {
    return TableCalendar(
      locale: "en_US",
      rowHeight: 40,
      headerStyle: HeaderStyle(
        formatButtonDecoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.green
        ),
      ),
      focusedDay: BlocProvider.of<AddRequestCubit>(context).todayDate,
      firstDay: DateTime.utc(2025, 1, 9),
      lastDay: DateTime.utc(2050, 1, 9),
      onDaySelected:
      BlocProvider.of<AddRequestCubit>(context).onDaySelected,
      selectedDayPredicate: (day) => isSameDay(
          day, BlocProvider.of<AddRequestCubit>(context).todayDate),
    );
  },
);
  }
}
