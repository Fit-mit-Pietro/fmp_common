part of user_property_service;

const String _kToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJraW5kIjoiaWRlbnRpdHl0b29sa2l0I1ZlcmlmeVBhc3N3b3JkUmVzcG9uc2UiLCJsb2NhbElkIjoiczhuU0RRQWFWVU84NWppVWpXQ2ZtZGc1VnBoMiIsImVtYWlsIjoicGF1bC5yaWVkbGluZ2VuQGdtYWlsLmNvbSIsImRpc3BsYXlOYW1lIjoiIiwiaWRUb2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJbU0yTnpOa00yTTVORGRoWldJeE9HSTJOR1UxT0dVelpXUmxNekkxTldaaVpqVTNOVEk0TldJaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwzTmxZM1Z5WlhSdmEyVnVMbWR2YjJkc1pTNWpiMjB2WVhWMGFHVnVkR2xqWVhScGIyNHRkR1Z6ZEMxbFl6VTRNaUlzSW1GMVpDSTZJbUYxZEdobGJuUnBZMkYwYVc5dUxYUmxjM1F0WldNMU9ESWlMQ0poZFhSb1gzUnBiV1VpT2pFMk5URXdPVFl6TlRVc0luVnpaWEpmYVdRaU9pSnpPRzVUUkZGQllWWlZUemcxYW1sVmFsZERabTFrWnpWV2NHZ3lJaXdpYzNWaUlqb2ljemh1VTBSUlFXRldWVTg0TldwcFZXcFhRMlp0WkdjMVZuQm9NaUlzSW1saGRDSTZNVFkxTVRBNU5qTTFOU3dpWlhod0lqb3hOalV4TURrNU9UVTFMQ0psYldGcGJDSTZJbkJoZFd3dWNtbGxaR3hwYm1kbGJrQm5iV0ZwYkM1amIyMGlMQ0psYldGcGJGOTJaWEpwWm1sbFpDSTZabUZzYzJVc0ltWnBjbVZpWVhObElqcDdJbWxrWlc1MGFYUnBaWE1pT25zaVpXMWhhV3dpT2xzaWNHRjFiQzV5YVdWa2JHbHVaMlZ1UUdkdFlXbHNMbU52YlNKZGZTd2ljMmxuYmw5cGJsOXdjbTkyYVdSbGNpSTZJbkJoYzNOM2IzSmtJbjE5Lk40S0RxcXYyUllLeTIzckVXcG5tMmJUUUxxbXZFSU83Y2doODd6WXNud0VKMF9kdk9sNHNfUHpqOXYxSzRkelF5TXNkNkp1TGJpaGdDS3JQNnJwbGUxSzN6RTFyTThxVUtvTEZHOTFkekFaWEdpTW5oeXVIUnVtZWw2VWxZenpEOUV4aTN2YS01QkItOWRsdEs4TjJ4ckpyZXZaLWZ1Mk5TTml4bk53UXVzaEJxdllFQ25UVzFHb2NVUkNyZnY3b3YyQTdHTUtTNGZtaXdQOFBJVE9JWldPMTZiVWRyQ2ZvQTBUM000WWZrNW5JbWJpV2xDdUpmU0taOE5FM1lGSi1iamQ2RFJrMWxHMkR1a2QxNFJ4TU9LWXZFNlNSSzRvMnJUM0dhVjRUbjdCUFJ5NV9YMFR4eDFnMDNIOVpPbEQ4N0gycW94NU9uak5lMWxXMVNDbDFTdyIsInJlZ2lzdGVyZWQiOnRydWUsInJlZnJlc2hUb2tlbiI6IkFJd1VhT2tJNXpiVUw3S0h2dm80dWlJT2xjbThPSllqMWhKT1c0VnUyVVB1RG9xNnpZa3dsR19pclkyRzAzVThOVk5pTHc0bFN5TVB0V284MEQ5RmlLRTZ1czlmeEY4QXJFM25SRmJ2Z1FheVVrTk54OUF6T19qTE9BbGJOcDVEWXVwSnJ0ZF9ER1lpcDhKbFFxTXFjcHZpcmNpbmZycWJfQUoyLXkyN1F0cTBUbmtjN2NUaXh4M25nc2pvLURScldrYzktbjFRQmhZY0VqNXgtWGhJZnBlUl8yMmM1YWVBb1BRb3FMbDlyZGV5b3hRZnlwbGNSUXRkODc4Zm04MXN0ZGpCWUcxbTBVX2ciLCJleHBpcmVzSW4iOiIzNjAwIiwicGVybWlzc2lvbiI6MTB9.bgDdrpjDwZm9Kkh_5npdy7mPckjrK3kqNno50aYlNKWmRi7fOtI0ElwG-XybzjmUGKDDlRc52G5_BlN23jLWt8PVkRkKniYfPvPbZ6A4dyM_PwlCWFE81BWZuRzZlHuyO5eyEWEheEx_wD2PMNB7nMSN878SzqigRKP6ekRvoD4COMTXOlEkSCw0lW0IbzqVxlHO_6zh2pfQOc1oM7xmo9164TV1yv57aLWQ_JOMUl3xIZuVBPZrR4Ks_09etySfkkhapoL3A0VYWNhpfNPbxCuCb69nfvJ2ntfLIRpuNlNk4MfQeF_-XwzZlVGneKTeMRCEHMo_cVlsm1GDZyXAr2Ic5qxmzBcWSAyqlk8o5i9IFZaDHlEJIthlzQy2TxCHWn0obhWuc7La7C6jtM2-06-Exc3nG_9YaU6PqsJHba7gv0IwT_Kd2GGn8_ZbuTvlKVw7FRwJ3l3Mloa1_KsaaqJJVdPf38Q-_i_kqrKZZx0p1LrghRutqGfklQ7T2P3BUKPSPpC8BIbd_WjPoYhAdqHgxgZrcUChYLBs0vad3oIdDed2Bd2HU7hYKYNgcvR8VhJxntroqj2e9_-ZXKhN7Og1eyJ0T5Ya5hkiQQ5MLoMkv1EajIgKVSpdxXn8hDsJ4BzK7qqK8-O-hL2Qk63fKsZdR3TB4C3Gzw_PnotsnRU";

class _UserPropertyServiceReal implements IUserPropertyService {
  _UserPropertyServiceReal(UserPropertyServiceConfig config)
      : _api = swagger.UserPropertyApi.create(
          interceptors: [AuthInterceptor(token: _kToken)],
          baseUrl: Uri.parse(config.serviceUrl),
        );

  final swagger.UserPropertyApi _api;

  @override
  Future<UserProperty> create(UserProperty t) async {
    final response = await _api.userpropertyPost(body: t.toSwagger());
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return UserProperty.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<void> delete(String id) async {
    final _ = await _api.userpropertyUserpropertyIdDelete(userpropertyId: id);
  }

  @override
  Future<UserProperty> getById(String id) async {
    final response =
        await _api.userpropertyUserpropertyIdGet(userpropertyId: id);
    if (!response.isSuccessful) {
      throw UnimplementedError(
          'Unsuccessful query reponse handling not implemented yet.');
    }

    return UserProperty.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<List<UserProperty>> getList({
    List<String>? ids,
    int? count,
    int? offset,
  }) async {
    final response = await _api.userpropertiesGet(
      ids: ids,
      count: count,
      offset: offset,
    );

    if (!response.isSuccessful) {
      throw UnimplementedError(
          'Unsuccessful query reponse handling not implemented yet.');
    }

    return (response.body!.result as List)
        .map((e) => UserProperty.fromJson(e))
        .toList();
  }

  @override
  Future<UserProperty> update(String id, UserProperty updatedModel) async {
    final response = await _api.userpropertyPut(
        body: updatedModel.toSwagger().copyWith(id: id));

    if (!response.isSuccessful) {
      throw UnimplementedError(
          'Unsuccessful query reponse handling not implemented yet.');
    }

    return UserProperty.fromJson(response.body!.result as Map<String, dynamic>);
  }
}


// class _UserPropertyServiceReal implements IUserPropertyService {
//   UserPropertyServiceConfig _config;
//   late API.UserPropertiesApi userPropertiesApi;
//   String token =
//       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJraW5kIjoiaWRlbnRpdHl0b29sa2l0I1ZlcmlmeVBhc3N3b3JkUmVzcG9uc2UiLCJsb2NhbElkIjoiczhuU0RRQWFWVU84NWppVWpXQ2ZtZGc1VnBoMiIsImVtYWlsIjoicGF1bC5yaWVkbGluZ2VuQGdtYWlsLmNvbSIsImRpc3BsYXlOYW1lIjoiIiwiaWRUb2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJbU0yTnpOa00yTTVORGRoWldJeE9HSTJOR1UxT0dVelpXUmxNekkxTldaaVpqVTNOVEk0TldJaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwzTmxZM1Z5WlhSdmEyVnVMbWR2YjJkc1pTNWpiMjB2WVhWMGFHVnVkR2xqWVhScGIyNHRkR1Z6ZEMxbFl6VTRNaUlzSW1GMVpDSTZJbUYxZEdobGJuUnBZMkYwYVc5dUxYUmxjM1F0WldNMU9ESWlMQ0poZFhSb1gzUnBiV1VpT2pFMk5URXdPVFl6TlRVc0luVnpaWEpmYVdRaU9pSnpPRzVUUkZGQllWWlZUemcxYW1sVmFsZERabTFrWnpWV2NHZ3lJaXdpYzNWaUlqb2ljemh1VTBSUlFXRldWVTg0TldwcFZXcFhRMlp0WkdjMVZuQm9NaUlzSW1saGRDSTZNVFkxTVRBNU5qTTFOU3dpWlhod0lqb3hOalV4TURrNU9UVTFMQ0psYldGcGJDSTZJbkJoZFd3dWNtbGxaR3hwYm1kbGJrQm5iV0ZwYkM1amIyMGlMQ0psYldGcGJGOTJaWEpwWm1sbFpDSTZabUZzYzJVc0ltWnBjbVZpWVhObElqcDdJbWxrWlc1MGFYUnBaWE1pT25zaVpXMWhhV3dpT2xzaWNHRjFiQzV5YVdWa2JHbHVaMlZ1UUdkdFlXbHNMbU52YlNKZGZTd2ljMmxuYmw5cGJsOXdjbTkyYVdSbGNpSTZJbkJoYzNOM2IzSmtJbjE5Lk40S0RxcXYyUllLeTIzckVXcG5tMmJUUUxxbXZFSU83Y2doODd6WXNud0VKMF9kdk9sNHNfUHpqOXYxSzRkelF5TXNkNkp1TGJpaGdDS3JQNnJwbGUxSzN6RTFyTThxVUtvTEZHOTFkekFaWEdpTW5oeXVIUnVtZWw2VWxZenpEOUV4aTN2YS01QkItOWRsdEs4TjJ4ckpyZXZaLWZ1Mk5TTml4bk53UXVzaEJxdllFQ25UVzFHb2NVUkNyZnY3b3YyQTdHTUtTNGZtaXdQOFBJVE9JWldPMTZiVWRyQ2ZvQTBUM000WWZrNW5JbWJpV2xDdUpmU0taOE5FM1lGSi1iamQ2RFJrMWxHMkR1a2QxNFJ4TU9LWXZFNlNSSzRvMnJUM0dhVjRUbjdCUFJ5NV9YMFR4eDFnMDNIOVpPbEQ4N0gycW94NU9uak5lMWxXMVNDbDFTdyIsInJlZ2lzdGVyZWQiOnRydWUsInJlZnJlc2hUb2tlbiI6IkFJd1VhT2tJNXpiVUw3S0h2dm80dWlJT2xjbThPSllqMWhKT1c0VnUyVVB1RG9xNnpZa3dsR19pclkyRzAzVThOVk5pTHc0bFN5TVB0V284MEQ5RmlLRTZ1czlmeEY4QXJFM25SRmJ2Z1FheVVrTk54OUF6T19qTE9BbGJOcDVEWXVwSnJ0ZF9ER1lpcDhKbFFxTXFjcHZpcmNpbmZycWJfQUoyLXkyN1F0cTBUbmtjN2NUaXh4M25nc2pvLURScldrYzktbjFRQmhZY0VqNXgtWGhJZnBlUl8yMmM1YWVBb1BRb3FMbDlyZGV5b3hRZnlwbGNSUXRkODc4Zm04MXN0ZGpCWUcxbTBVX2ciLCJleHBpcmVzSW4iOiIzNjAwIiwicGVybWlzc2lvbiI6MTB9.bgDdrpjDwZm9Kkh_5npdy7mPckjrK3kqNno50aYlNKWmRi7fOtI0ElwG-XybzjmUGKDDlRc52G5_BlN23jLWt8PVkRkKniYfPvPbZ6A4dyM_PwlCWFE81BWZuRzZlHuyO5eyEWEheEx_wD2PMNB7nMSN878SzqigRKP6ekRvoD4COMTXOlEkSCw0lW0IbzqVxlHO_6zh2pfQOc1oM7xmo9164TV1yv57aLWQ_JOMUl3xIZuVBPZrR4Ks_09etySfkkhapoL3A0VYWNhpfNPbxCuCb69nfvJ2ntfLIRpuNlNk4MfQeF_-XwzZlVGneKTeMRCEHMo_cVlsm1GDZyXAr2Ic5qxmzBcWSAyqlk8o5i9IFZaDHlEJIthlzQy2TxCHWn0obhWuc7La7C6jtM2-06-Exc3nG_9YaU6PqsJHba7gv0IwT_Kd2GGn8_ZbuTvlKVw7FRwJ3l3Mloa1_KsaaqJJVdPf38Q-_i_kqrKZZx0p1LrghRutqGfklQ7T2P3BUKPSPpC8BIbd_WjPoYhAdqHgxgZrcUChYLBs0vad3oIdDed2Bd2HU7hYKYNgcvR8VhJxntroqj2e9_-ZXKhN7Og1eyJ0T5Ya5hkiQQ5MLoMkv1EajIgKVSpdxXn8hDsJ4BzK7qqK8-O-hL2Qk63fKsZdR3TB4C3Gzw_PnotsnRU";

//   _UserPropertyServiceReal(this._config) {
//     API.ApiClient client = API.ApiClient(basePath: "${_config.SERVICE_URL}");
//     userPropertiesApi = API.UserPropertiesApi(client);
//     userPropertiesApi.apiClient
//         .addDefaultHeader("authorization", 'Bearer ' + token);
//   }

//   @override
//   Future<UserProperty> create(UserProperty t) async {
//     API.ApiResponse apiResponse =
//         await userPropertiesApi.addUserProperty(t.toAPIUserProperty());
//     return t;
//   }

//   @override
//   Future<void> delete(String id) async {
//     API.ApiResponse apiResponse =
//         await userPropertiesApi.deleteUserProperty(id);
//   }

//   @override
//   Future<UserProperty> getById(String id) async {
//     API.UserPropertyApiResponse apiResponse =
//         await userPropertiesApi.getUserpropertyById(id);
//     return apiResponse.result.toServiceUserProperty();
//   }

//   @override
//   Future<List<UserProperty>> getList(
//       {List<String>? ids, int? count, int? offset}) async {
//     API.UserPropertyListApiResponse response =
//         await userPropertiesApi.getUserProperties(
//       ids: ids!,
//       count: count!,
//       offset: offset!,
//     );
//     return response.result.map((e) => e.toServiceUserProperty()).toList();
//   }

//   @override
//   Future<UserProperty> update(String id, UserProperty updatedModel) async {
//     API.ApiResponse apiResponse = await userPropertiesApi
//         .updateUserProperty(updatedModel.toAPIUserProperty());
//     return updatedModel;
//   }
// }
