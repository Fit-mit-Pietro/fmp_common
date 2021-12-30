
import 'package:fmp_common/platform/backend_service/i_backend_connector.dart';
import 'package:fmp_common/platform/backend_service/mocks/mock_backend.dart';
import 'package:fmp_common/platform/backend_service/user/i_user_service.dart';
import 'package:fmp_common/platform/backend_service/user/user_service_mock.dart';
import 'package:fmp_common/platform/exceptions/app_exception.dart';


class BackendConnectorMock implements IBackendConnector {

  final MockBackend _backend = MockBackend();

  BackendConnectorMock();

  @override
  void handleError(Function(AppException exception) exception) {
  }

  @override
  Future<void> init() {
    user = UserServiceMock(_backend);
    return Future.value();
  }

  @override
  late IUserService user;
}