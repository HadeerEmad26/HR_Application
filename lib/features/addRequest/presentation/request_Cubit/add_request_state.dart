sealed class AddRequestState {}

final class AddRequestInitial extends AddRequestState {}

final class ChangeItemState extends AddRequestState {}




final class OnDaySelectedState extends AddRequestState {}

final class OnDaySelectedSuccessState extends AddRequestState {}

final class OnDaySelectedErrorState extends AddRequestState {}

final class SaveRequestDataLoadingState extends AddRequestState {}

final class SaveRequestDataSuccessState extends AddRequestState {}

final class SaveRequestDataErrorState extends AddRequestState {
  final String message;

  SaveRequestDataErrorState(this.message);
}

final class SelectedRequestItemState extends AddRequestState {}



class GetDateLoadingState extends AddRequestState {}

class GetDateSuccessState extends AddRequestState {}

class GetDateErrorState extends AddRequestState {}

class GetStartTimeLoadingState extends AddRequestState {}

class GetStartTimeSuccessState extends AddRequestState {}

class GetStartTimeErrorState extends AddRequestState {}


class GetSelectedDateSuccessState extends AddRequestState {}

class GetSelectedDateLoadingState extends AddRequestState {}

class GetEndTimeLoadingState extends AddRequestState {}

class GetEndTimeSuccessState extends AddRequestState {}

class GetEndTimeErrorState extends AddRequestState {}


class InsertRequestsLoadingState extends AddRequestState {}

class InsertRequestsSuccessState extends AddRequestState {}

class InsertRequestsErrorState extends AddRequestState {}

class GetRequestsLoadingState extends AddRequestState {}

class GetRequestsSuccessState extends AddRequestState {}

class GetRequestsErrorState extends AddRequestState {}

class AddRequestLoadingState extends AddRequestState {}

class AddRequestSuccessState extends AddRequestState {}

class AddRequestErrorState extends AddRequestState {}

