import 'package:dartz/dartz.dart';
import 'package:hr/features/addRequest/data/model/type_of_request_model.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/services/service_locator.dart';

class RequestsRepository {
  Future<Object>typeRequest({
    required String itemId,
    required String itemName,
  }) async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.leaveTypeRequests,
        data: {
          ApiKeys.itemId: itemId,
          ApiKeys.itemName: itemName,
        },
      );
      return Right(RequestItemModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}