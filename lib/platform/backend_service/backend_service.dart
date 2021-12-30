
import 'package:fmp_common/platform/backend_service/i_backend_connector.dart';
enum BackendType {mock,real}
class BackendService{

  static Future<void>? init(BackendType type) async{
    _instance = IBackendConnector(type);
    await _instance.init();
  }

  static late IBackendConnector _instance;
  static IBackendConnector get instance => _instance;
}
