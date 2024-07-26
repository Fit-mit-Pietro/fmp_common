import 'dart:async';

import 'package:chopper/chopper.dart' as chopper;

class AuthInterceptor implements chopper.RequestInterceptor {
  AuthInterceptor({required this.token});

  final String token;

  @override
  FutureOr<chopper.Request> onRequest(chopper.Request request) {
    final updatedRequest =
        chopper.applyHeader(request, 'authorization', 'Bearer $token');

    print(
      '[AuthInterceptor] accessToken: $token',
    );

    return updatedRequest;
  }
}
