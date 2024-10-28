import 'package:dartz/dartz.dart';
import 'package:zippy_flutter/config/failures/failure.dart';
import 'package:zippy_flutter/domain/models/requests/log_in/log_in_request.dart';
import 'package:zippy_flutter/domain/models/responses/log_in_response/log_in_response.dart';

abstract class ILocalRepository {

  Future<String?> getAccessToken();

}
