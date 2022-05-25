
import 'package:uuid/uuid.dart';

class IdService{
  static final _uuid = Uuid();

  static String getId(){
    return _uuid.v1();
  }
}