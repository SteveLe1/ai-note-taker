import 'package:dartz/dartz.dart';
import 'package:coconut_note/config/failures/failure.dart';
import 'package:coconut_note/domain/models/requests/log_in/log_in_request.dart';
import 'package:coconut_note/domain/models/responses/log_in_response/log_in_response.dart';

abstract class ILocalRepository {

  Future<String?> getAccessToken();

}
