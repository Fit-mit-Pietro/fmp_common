import 'package:uuid/uuid.dart';

class IdService {
  static const _uuid = Uuid();

  static String getId() {
    return _uuid.v1();
  }
}
