import 'package:dartz/dartz.dart';
import 'package:hr/features/addRequest/data/model/add_request_model.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';

class RequestsRepository {
  Future<Either<String,String>> addRequest(
      {
        required DateTime selectedDate,
        required String startTime,
        required String endTime,
        required String reason,
        required String note
      }
      ) async{
    try{
      final response = await sl<ApiConsumer>().post(EndPoint.saveLeaveData,
          isFormData: true,
          data: {
            //!! date
            ApiKeys.selectedDate: selectedDate,
            //!! note
            ApiKeys.note: note,
            //!! start time
            ApiKeys.startTime: startTime,
            //!! end time
            ApiKeys.endTime: endTime,
            //!! reason
            ApiKeys.reason: reason
          });
      return Right(response[ApiKeys.message]);
    }on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }





  Future<Either<String, AddRequestModel>> getRequest() async {
    try {
      final response = await sl<ApiConsumer>().post(
          EndPoint.leaveTypeRequests);
      return Right(AddRequestModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

}