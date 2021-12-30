import 'package:fmp_common/platform/backend_service/mocks/mock_database.dart';
import 'mock_authentication.dart';

class MockBackend {
  MockDatabase db = MockDatabase();
  MockAuth auth = MockAuth();

}