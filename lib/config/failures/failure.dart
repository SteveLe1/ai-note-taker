import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  const Failure();

  static const String notApprovalForNft = 'not_approval_for_nft';
}

class FailureMessage extends Failure {
  final String msg;

  const FailureMessage(this.msg);

  factory FailureMessage.fromException(e) {
    try {
      if (e is DioError) {
        if (e.response?.statusCode != null && e.response!.statusCode! >= 500 && e.response!.statusCode! <= 599) {
          return const FailureMessage("Something went wrong");
        } else {
          final data = e.response?.data;

          if (data == null) {
            return const FailureMessage("Something went wrong");
          } else {
            return FailureMessage(data['message']);
          }
        }
      } else {
        return FailureMessage.fromRPC(e);
      }
    } catch (_) {
      if (kDebugMode) return FailureMessage('$_');
      return const FailureMessage("Something went wrong");
    }
    // if (kDebugMode) return FailureMessage('$e');
    // return const FailureMessage("Something went wrong");
  }

  factory FailureMessage.fromRPC(e) {
    if ('$e'.contains('execution reverted')) {
      return const FailureMessage("Something went wrong");
    }
    if (kDebugMode) return FailureMessage('$e');
    return const FailureMessage("Something went wrong");
  }

  @override
  List<Object?> get props => [msg];

  @override
  String toString() => msg;
}
