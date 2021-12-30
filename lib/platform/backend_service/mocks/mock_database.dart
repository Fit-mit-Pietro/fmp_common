import 'package:fmp_common/platform/models/user_service/user.dart';

class MockDatabase{

  MockDatabaseTable<User> user = MockDatabaseTable<User>();

}

class MockDatabaseTable<T>{

  final Map<String,T> _data = <String,T>{};

  Future<T?> get(String id) async{
    await Future.delayed(const Duration(milliseconds: 1000));

    if(_data.containsKey(id)){
      return _data[id];
    }
    return null;
  }

  Future set(String id,T t) async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _data[id] = t;
  }

  Future update(String id,T t) async{
    await Future.delayed(const Duration(milliseconds: 1000));
    _data[id] = t;
  }

}