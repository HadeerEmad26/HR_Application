sealed class LeaveTypeState {}

final class LeaveTypeInitial extends LeaveTypeState {}

final class LeaveTypeLoadingState extends LeaveTypeState {}

final class LeaveTypeSuccessState extends LeaveTypeState {}

final class LeaveTypeErrorState extends LeaveTypeState {}
