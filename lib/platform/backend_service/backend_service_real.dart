
import 'package:fmp_common/platform/backend_service/i_backend_connector.dart';
import 'package:fmp_common/platform/backend_service/user/i_user_service.dart';
import 'package:fmp_common/platform/backend_service/user/user_service_real.dart';
import 'package:fmp_common/platform/exceptions/app_exception.dart';


import 'i_backend_connector.dart';

class BackendConnectorReal implements IBackendConnector {

  @override
  void handleError(Function(AppException exception) exception) {
  }


  @override
  Future<void> init() {
    user = UserServiceReal();
    return Future.value();
  }

  @override
  late IUserService user;
}