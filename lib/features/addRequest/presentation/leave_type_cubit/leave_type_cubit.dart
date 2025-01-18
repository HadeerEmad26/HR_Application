import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr/features/addRequest/presentation/leave_type_cubit/leave_type_state.dart';

import '../../data/repository/leave_type_repo.dart'; // Update with your repo import

class LeaveTypeCubit extends Cubit<LeaveTypeState> {
  LeaveTypeCubit(this.leaveTypeRepository) : super(LeaveTypeInitial());

  final LeaveTypeRepository leaveTypeRepository;


  Future<void> fetchLeaveTypes() async {
    try {
      emit(LeaveTypeLoadingState()); // Clear existing leave types or show loading state
      final leaveTypes = await leaveTypeRepository.getLeaveTypes(); // API call
      emit(LeaveTypeSuccessState()); // Emit the list of leave types
    } catch (e) {
      emit(LeaveTypeErrorState()); // Optionally handle error state, or you could emit a failure state
      // You can also emit an error state to show a custom error UI.
    }
  }
}
