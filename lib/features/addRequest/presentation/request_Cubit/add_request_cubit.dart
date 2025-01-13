import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/features/addRequest/data/model/type_of_request_model.dart';
import 'package:hr/features/addRequest/data/repository/request_repo.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/sqf_helper/sqf_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/model/add_request_model.dart';
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

  TextEditingController reasonController = TextEditingController();


//!___Date____
  DateTime todayDate = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusedDay){
    emit(OnDaySelectedState());
    todayDate = day;
  }

  Future<Object>requestItems = RequestsRepository().typeRequest(
      itemId: itemId,
      itemName: itemName,
  );


  // void changeItem(item) {
  //   selectedRequestItem = item;
  //   emit(SelectedRequestItemState());
  // }




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
    //getTasks();
  }



List<AddRequestModel> requestsList = [];
  void insertRequests(context) async {
    emit(InsertRequestsLoadingState());

    try {
      await sl<SqfliteHelper>().insertToDB(
        model: AddRequestModel(
          date: BlocProvider.of<AddRequestCubit>(context).todayDate.toString().split(" ")[0],
          reason: reasonController.text,
          startTime: startTime,
          endTime: endTime,
        ),
      );
      reasonController.clear();
      emit(InsertRequestsSuccessState());
      getAllRequests();
    } catch (e) {
      emit(InsertRequestsErrorState());
    }
  }





//!get requests
  void getAllRequests() async {
    emit(GetDateLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value) {
      requestsList = value
          .map((e) => AddRequestModel.fromJson(e))
          .toList()
          .where(
            (element) => element.date == DateFormat.yMd().format(selectedDate),
      )
          .toList();
      emit(GetDateSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetDateErrorState());
    });
  }

}
