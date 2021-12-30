


import 'package:fmp_common/platform/backend_service/backend_service.dart';
import 'package:fmp_common/platform/backend_service/backend_service_mock.dart';
import 'package:fmp_common/platform/backend_service/backend_service_real.dart';
import 'package:fmp_common/platform/backend_service/user/i_user_service.dart';
import 'package:fmp_common/platform/exceptions/app_exception.dart';



abstract class IBackendConnector
{

  void handleError(Function(AppException exception) exception){

  }

  factory IBackendConnector(BackendType type){
    switch(type){
      case BackendType.mock: return BackendConnectorMock();
      case BackendType.real: return BackendConnectorReal();
    }
  }

  abstract IUserService user;


  Future<void> init();
}

