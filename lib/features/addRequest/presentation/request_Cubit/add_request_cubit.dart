import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/features/addRequest/data/model/add_request_model.dart';
import 'package:hr/features/addRequest/data/repository/request_repo.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/sqf_helper/sqf_helper.dart';
import '../../../../core/services/service_locator.dart';
import 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit(this.requestsRepository) : super(AddRequestInitial());
  final RequestsRepository requestsRepository;

  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int currentIndex = 0;
  TextEditingController noteController = TextEditingController();

  GlobalKey<FormState> addToRequestKey = GlobalKey<FormState>();

//!___Date____
  DateTime todayDate = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusedDay) {
    emit(OnDaySelectedState());
    todayDate = day;
  }

  List<String> leaveTypeList = [
    "Annual",
    "Sick",
    "Maternity",
    "Mission",
    "Permission"
  ];
  String selectedItem = "Sick";

  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  //
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   //get Date From User

//___start time___
  late TimeOfDay schadualedTime;
  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());

    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      schadualedTime = pickedStartTime;
      emit(GetStartTimeSuccessState());
    } else {
      print('pickedStartTime ==null');
      schadualedTime =
          TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
      emit(GetStartTimeErrorState());
    }
  }

//___end time____
  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());

    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      print('pickedStartTime ==null');
      emit(GetEndTimeErrorState());
    }
  }

//___ get date___
  void getSelectedDate(date) {
    emit(GetSelectedDateLoadingState());
    selectedDate = date;

    emit(GetSelectedDateSuccessState());
  }


  void saveRequest() async {
    emit(AddRequestLoadingState());
    final result = await requestsRepository.addRequest(
      selectedDate: todayDate,
      startTime: startTime,
      endTime: endTime,
      reason: selectedItem,
      note: noteController.text,
    );
    result.fold((l) => emit(AddRequestErrorState()),
        (r) => emit(AddRequestSuccessState()));
  }


  void getAllRequests() async {
    emit(GetRequestsLoadingState());
    final result = await requestsRepository.getRequest();
    result.fold((l) => emit(GetRequestsErrorState()), (r) {
      requests = requests;
      emit(GetRequestsSuccessState());
    });
  }


  List<AddRequestModel> requests = [];

  void insertRequests() async {
    emit(InsertRequestsLoadingState());
    try {
      sl<SqfliteHelper>().insertToDB(
          model: AddRequestModel(
        date: selectedDate.toIso8601String(),
        reason: selectedItem,
        startTime: startTime,
        endTime: endTime,
        note: noteController.text,
      ));
      print(requests.length);
      noteController.clear();
      startTime = DateFormat("hh:mm:a").format(DateTime.now());

      getAllRequests();
      emit(InsertRequestsSuccessState());
    } catch (e) {
      log(e.toString());
      emit(InsertRequestsErrorState());
    }
  }
}
