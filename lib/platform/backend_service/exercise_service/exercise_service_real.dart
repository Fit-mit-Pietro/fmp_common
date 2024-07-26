part of exercise_service;

const String kToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJraW5kIjoiaWRlbnRpdHl0b29sa2l0I1ZlcmlmeVBhc3N3b3JkUmVzcG9uc2UiLCJsb2NhbElkIjoiczhuU0RRQWFWVU84NWppVWpXQ2ZtZGc1VnBoMiIsImVtYWlsIjoicGF1bC5yaWVkbGluZ2VuQGdtYWlsLmNvbSIsImRpc3BsYXlOYW1lIjoiIiwiaWRUb2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJbU0yTnpOa00yTTVORGRoWldJeE9HSTJOR1UxT0dVelpXUmxNekkxTldaaVpqVTNOVEk0TldJaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwzTmxZM1Z5WlhSdmEyVnVMbWR2YjJkc1pTNWpiMjB2WVhWMGFHVnVkR2xqWVhScGIyNHRkR1Z6ZEMxbFl6VTRNaUlzSW1GMVpDSTZJbUYxZEdobGJuUnBZMkYwYVc5dUxYUmxjM1F0WldNMU9ESWlMQ0poZFhSb1gzUnBiV1VpT2pFMk5URXdPVFl6TlRVc0luVnpaWEpmYVdRaU9pSnpPRzVUUkZGQllWWlZUemcxYW1sVmFsZERabTFrWnpWV2NHZ3lJaXdpYzNWaUlqb2ljemh1VTBSUlFXRldWVTg0TldwcFZXcFhRMlp0WkdjMVZuQm9NaUlzSW1saGRDSTZNVFkxTVRBNU5qTTFOU3dpWlhod0lqb3hOalV4TURrNU9UVTFMQ0psYldGcGJDSTZJbkJoZFd3dWNtbGxaR3hwYm1kbGJrQm5iV0ZwYkM1amIyMGlMQ0psYldGcGJGOTJaWEpwWm1sbFpDSTZabUZzYzJVc0ltWnBjbVZpWVhObElqcDdJbWxrWlc1MGFYUnBaWE1pT25zaVpXMWhhV3dpT2xzaWNHRjFiQzV5YVdWa2JHbHVaMlZ1UUdkdFlXbHNMbU52YlNKZGZTd2ljMmxuYmw5cGJsOXdjbTkyYVdSbGNpSTZJbkJoYzNOM2IzSmtJbjE5Lk40S0RxcXYyUllLeTIzckVXcG5tMmJUUUxxbXZFSU83Y2doODd6WXNud0VKMF9kdk9sNHNfUHpqOXYxSzRkelF5TXNkNkp1TGJpaGdDS3JQNnJwbGUxSzN6RTFyTThxVUtvTEZHOTFkekFaWEdpTW5oeXVIUnVtZWw2VWxZenpEOUV4aTN2YS01QkItOWRsdEs4TjJ4ckpyZXZaLWZ1Mk5TTml4bk53UXVzaEJxdllFQ25UVzFHb2NVUkNyZnY3b3YyQTdHTUtTNGZtaXdQOFBJVE9JWldPMTZiVWRyQ2ZvQTBUM000WWZrNW5JbWJpV2xDdUpmU0taOE5FM1lGSi1iamQ2RFJrMWxHMkR1a2QxNFJ4TU9LWXZFNlNSSzRvMnJUM0dhVjRUbjdCUFJ5NV9YMFR4eDFnMDNIOVpPbEQ4N0gycW94NU9uak5lMWxXMVNDbDFTdyIsInJlZ2lzdGVyZWQiOnRydWUsInJlZnJlc2hUb2tlbiI6IkFJd1VhT2tJNXpiVUw3S0h2dm80dWlJT2xjbThPSllqMWhKT1c0VnUyVVB1RG9xNnpZa3dsR19pclkyRzAzVThOVk5pTHc0bFN5TVB0V284MEQ5RmlLRTZ1czlmeEY4QXJFM25SRmJ2Z1FheVVrTk54OUF6T19qTE9BbGJOcDVEWXVwSnJ0ZF9ER1lpcDhKbFFxTXFjcHZpcmNpbmZycWJfQUoyLXkyN1F0cTBUbmtjN2NUaXh4M25nc2pvLURScldrYzktbjFRQmhZY0VqNXgtWGhJZnBlUl8yMmM1YWVBb1BRb3FMbDlyZGV5b3hRZnlwbGNSUXRkODc4Zm04MXN0ZGpCWUcxbTBVX2ciLCJleHBpcmVzSW4iOiIzNjAwIiwicGVybWlzc2lvbiI6MTB9.bgDdrpjDwZm9Kkh_5npdy7mPckjrK3kqNno50aYlNKWmRi7fOtI0ElwG-XybzjmUGKDDlRc52G5_BlN23jLWt8PVkRkKniYfPvPbZ6A4dyM_PwlCWFE81BWZuRzZlHuyO5eyEWEheEx_wD2PMNB7nMSN878SzqigRKP6ekRvoD4COMTXOlEkSCw0lW0IbzqVxlHO_6zh2pfQOc1oM7xmo9164TV1yv57aLWQ_JOMUl3xIZuVBPZrR4Ks_09etySfkkhapoL3A0VYWNhpfNPbxCuCb69nfvJ2ntfLIRpuNlNk4MfQeF_-XwzZlVGneKTeMRCEHMo_cVlsm1GDZyXAr2Ic5qxmzBcWSAyqlk8o5i9IFZaDHlEJIthlzQy2TxCHWn0obhWuc7La7C6jtM2-06-Exc3nG_9YaU6PqsJHba7gv0IwT_Kd2GGn8_ZbuTvlKVw7FRwJ3l3Mloa1_KsaaqJJVdPf38Q-_i_kqrKZZx0p1LrghRutqGfklQ7T2P3BUKPSPpC8BIbd_WjPoYhAdqHgxgZrcUChYLBs0vad3oIdDed2Bd2HU7hYKYNgcvR8VhJxntroqj2e9_-ZXKhN7Og1eyJ0T5Ya5hkiQQ5MLoMkv1EajIgKVSpdxXn8hDsJ4BzK7qqK8-O-hL2Qk63fKsZdR3TB4C3Gzw_PnotsnRU";

class _ExerciseServiceReal implements IExerciseService {
  _ExerciseServiceReal(ExerciseServiceConfig config)
      : _api = swagger.ExcerciseServiceApi.create(
          interceptors: [AuthInterceptor(token: kToken)],
          baseUrl: Uri.parse(config.SERVICE_URL),
        );

  final swagger.ExcerciseServiceApi _api;

  @override
  Future<ExercisePropertyLink> addLink(ExercisePropertyLink link) async {
    final response =
        await _api.linkPost(body: swagger.Link.fromJson(link.toJson()));
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return ExercisePropertyLink.fromJson(
        response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<Exercise> create(Exercise t) async {
    final response = await _api.exercisePost(body: t.toSwagger());
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return Exercise.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<void> delete(String id) async {
    final response = await _api.exerciseExerciseIdDelete(exerciseId: id);
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }
  }

  @override
  Future deleteLink(String linkId) async {
    final response = await _api.linkLinkIdDelete(linkId: linkId);
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Exercise> getById(String id) async {
    final response = await _api.exerciseExerciseIdGet(exerciseId: id);
    if (response.isSuccessful) {
      throw UnimplementedError('');
    }

    return Exercise.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<ExercisePropertyLink> getLink(String linkId) async {
    final response = await _api.linkLinkIdGet(linkId: linkId);
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return ExercisePropertyLink.fromJson(
        response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<List<ExercisePropertyLink>> getLinkList({
    List<String>? ids,
    int? count,
    int? offset,
  }) async {
    final response = await _api.linksGet(
      ids: ids,
      count: count,
      offset: offset,
    );
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    final list = response.body!.result as List?;
    if (list == null) {
      return [];
    }
    return list.map((e) => ExercisePropertyLink.fromJson(e)).toList();
  }

  @override
  Future<List<ExercisePropertyLink>> getLinksOfExercise(
      String exerciseId) async {
    final response =
        await _api.linksExerciseExerciseIdGet(exerciseId: exerciseId);
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    final list = response.body!.result as List?;
    if (list == null) {
      return [];
    }
    return list.map((e) => ExercisePropertyLink.fromJson(e)).toList();
  }

  @override
  Future<List<ExercisePropertyLink>> getLinksOfUserProperty(
      String userPropertyId) async {
    final response = await _api.linksUserpropertyUserpropertyIdGet(
        userpropertyId: userPropertyId);
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return (response.body!.result as List)
        .map((e) => ExercisePropertyLink.fromJson(e))
        .toList();
  }

  @override
  Future<List<Exercise>> getList(
      {List<String>? ids, int? count, int? offset}) async {
    final response =
        await _api.exercisesGet(ids: ids, count: count, offset: offset);

    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    final list = response.body!.result as List?;
    if (list == null) {
      return [];
    }

    return list.map((e) => Exercise.fromJson(e)).toList();
  }

  @override
  Future<Exercise> update(String id, Exercise updatedModel) async {
    final response = await _api.exercisePut(
        body:
            swagger.Exercise.fromJson(updatedModel.toJson()).copyWith(id: id));
    if (!response.isSuccessful) {
      throw UnimplementedError('');
    }

    return Exercise.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<ExercisePropertyLink> updateLink(
      String id, ExercisePropertyLink link) async {
    final response =
        await _api.linkPut(body: swagger.Link.fromJson(link.toJson()));
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return ExercisePropertyLink.fromJson(
        response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<String> uploadFile(String id, MultipartFile file) async {
    final response = await _api.exerciseUploadExerciseIdPost(
        exerciseId: id,
        body: swagger.UploadExerciseIdBody(file: file.filename));
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return (response.body!.result as Map<String, dynamic>)['video_url'];
  }
}
// class _ExerciseServiceReal implements IExerciseService {
//   final ExerciseServiceConfig _config;

//   late api.ExerciseApi _exerciseApiInstance;
//   late api.LinkerApi _linkerApiInstance;
//   String token =
//       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJraW5kIjoiaWRlbnRpdHl0b29sa2l0I1ZlcmlmeVBhc3N3b3JkUmVzcG9uc2UiLCJsb2NhbElkIjoiczhuU0RRQWFWVU84NWppVWpXQ2ZtZGc1VnBoMiIsImVtYWlsIjoicGF1bC5yaWVkbGluZ2VuQGdtYWlsLmNvbSIsImRpc3BsYXlOYW1lIjoiIiwiaWRUb2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJbU0yTnpOa00yTTVORGRoWldJeE9HSTJOR1UxT0dVelpXUmxNekkxTldaaVpqVTNOVEk0TldJaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwzTmxZM1Z5WlhSdmEyVnVMbWR2YjJkc1pTNWpiMjB2WVhWMGFHVnVkR2xqWVhScGIyNHRkR1Z6ZEMxbFl6VTRNaUlzSW1GMVpDSTZJbUYxZEdobGJuUnBZMkYwYVc5dUxYUmxjM1F0WldNMU9ESWlMQ0poZFhSb1gzUnBiV1VpT2pFMk5URXdPVFl6TlRVc0luVnpaWEpmYVdRaU9pSnpPRzVUUkZGQllWWlZUemcxYW1sVmFsZERabTFrWnpWV2NHZ3lJaXdpYzNWaUlqb2ljemh1VTBSUlFXRldWVTg0TldwcFZXcFhRMlp0WkdjMVZuQm9NaUlzSW1saGRDSTZNVFkxTVRBNU5qTTFOU3dpWlhod0lqb3hOalV4TURrNU9UVTFMQ0psYldGcGJDSTZJbkJoZFd3dWNtbGxaR3hwYm1kbGJrQm5iV0ZwYkM1amIyMGlMQ0psYldGcGJGOTJaWEpwWm1sbFpDSTZabUZzYzJVc0ltWnBjbVZpWVhObElqcDdJbWxrWlc1MGFYUnBaWE1pT25zaVpXMWhhV3dpT2xzaWNHRjFiQzV5YVdWa2JHbHVaMlZ1UUdkdFlXbHNMbU52YlNKZGZTd2ljMmxuYmw5cGJsOXdjbTkyYVdSbGNpSTZJbkJoYzNOM2IzSmtJbjE5Lk40S0RxcXYyUllLeTIzckVXcG5tMmJUUUxxbXZFSU83Y2doODd6WXNud0VKMF9kdk9sNHNfUHpqOXYxSzRkelF5TXNkNkp1TGJpaGdDS3JQNnJwbGUxSzN6RTFyTThxVUtvTEZHOTFkekFaWEdpTW5oeXVIUnVtZWw2VWxZenpEOUV4aTN2YS01QkItOWRsdEs4TjJ4ckpyZXZaLWZ1Mk5TTml4bk53UXVzaEJxdllFQ25UVzFHb2NVUkNyZnY3b3YyQTdHTUtTNGZtaXdQOFBJVE9JWldPMTZiVWRyQ2ZvQTBUM000WWZrNW5JbWJpV2xDdUpmU0taOE5FM1lGSi1iamQ2RFJrMWxHMkR1a2QxNFJ4TU9LWXZFNlNSSzRvMnJUM0dhVjRUbjdCUFJ5NV9YMFR4eDFnMDNIOVpPbEQ4N0gycW94NU9uak5lMWxXMVNDbDFTdyIsInJlZ2lzdGVyZWQiOnRydWUsInJlZnJlc2hUb2tlbiI6IkFJd1VhT2tJNXpiVUw3S0h2dm80dWlJT2xjbThPSllqMWhKT1c0VnUyVVB1RG9xNnpZa3dsR19pclkyRzAzVThOVk5pTHc0bFN5TVB0V284MEQ5RmlLRTZ1czlmeEY4QXJFM25SRmJ2Z1FheVVrTk54OUF6T19qTE9BbGJOcDVEWXVwSnJ0ZF9ER1lpcDhKbFFxTXFjcHZpcmNpbmZycWJfQUoyLXkyN1F0cTBUbmtjN2NUaXh4M25nc2pvLURScldrYzktbjFRQmhZY0VqNXgtWGhJZnBlUl8yMmM1YWVBb1BRb3FMbDlyZGV5b3hRZnlwbGNSUXRkODc4Zm04MXN0ZGpCWUcxbTBVX2ciLCJleHBpcmVzSW4iOiIzNjAwIiwicGVybWlzc2lvbiI6MTB9.bgDdrpjDwZm9Kkh_5npdy7mPckjrK3kqNno50aYlNKWmRi7fOtI0ElwG-XybzjmUGKDDlRc52G5_BlN23jLWt8PVkRkKniYfPvPbZ6A4dyM_PwlCWFE81BWZuRzZlHuyO5eyEWEheEx_wD2PMNB7nMSN878SzqigRKP6ekRvoD4COMTXOlEkSCw0lW0IbzqVxlHO_6zh2pfQOc1oM7xmo9164TV1yv57aLWQ_JOMUl3xIZuVBPZrR4Ks_09etySfkkhapoL3A0VYWNhpfNPbxCuCb69nfvJ2ntfLIRpuNlNk4MfQeF_-XwzZlVGneKTeMRCEHMo_cVlsm1GDZyXAr2Ic5qxmzBcWSAyqlk8o5i9IFZaDHlEJIthlzQy2TxCHWn0obhWuc7La7C6jtM2-06-Exc3nG_9YaU6PqsJHba7gv0IwT_Kd2GGn8_ZbuTvlKVw7FRwJ3l3Mloa1_KsaaqJJVdPf38Q-_i_kqrKZZx0p1LrghRutqGfklQ7T2P3BUKPSPpC8BIbd_WjPoYhAdqHgxgZrcUChYLBs0vad3oIdDed2Bd2HU7hYKYNgcvR8VhJxntroqj2e9_-ZXKhN7Og1eyJ0T5Ya5hkiQQ5MLoMkv1EajIgKVSpdxXn8hDsJ4BzK7qqK8-O-hL2Qk63fKsZdR3TB4C3Gzw_PnotsnRU";

//   _ExerciseServiceReal(this._config) {
//     api.ApiClient client = api.ApiClient(basePath: "${_config.SERVICE_URL}");
//     _exerciseApiInstance = api.ExerciseApi(client);
//     _exerciseApiInstance.apiClient
//         .addDefaultHeader("authorization", 'Bearer ' + token);

//     _linkerApiInstance = api.LinkerApi(client);
//     _linkerApiInstance.apiClient
//         .addDefaultHeader("authorization", 'Bearer ' + token);
//     _linkerApiInstance.apiClient
//         .addDefaultHeader("Content-Type", "application/json");
//   }

//   @override
//   Future<ExercisePropertyLink> addLink(ExercisePropertyLink link) async {
//     await _linkerApiInstance.addLink(link.toAPIExercisePropertyLink());
//     return link;
//   }

//   @override
//   Future<Exercise> create(Exercise t) async {
//     await _exerciseApiInstance.addExercise(t.toAPIExercise());
//     return t;
//   }

//   @override
//   Future<void> delete(String id) async {
//     await _exerciseApiInstance.deleteExercise(id);
//   }

//   @override
//   Future deleteLink(String linkId) async {
//     await _linkerApiInstance.deleteLink(linkId);
//   }

//   @override
//   Future<Exercise> getById(String id) async {
//     api.ExerciseApiResponse apiResponse =
//         await _exerciseApiInstance.getExerciseById(id);
//     return apiResponse.result.toServiceExercise();
//   }

//   @override
//   Future getLink(String linkId) async {
//     api.LinkApiResponse apiResponse =
//         await _linkerApiInstance.getLinkById(linkId);
//     return apiResponse.result.toServiceExercisePropertyLink();
//   }

//   @override
//   Future<List<ExercisePropertyLink>> getLinkList(
//       {List<String>? ids, int? count, int? offset}) async {
//     api.LinkListApiResponse apiResponse = await _linkerApiInstance.getLinks(
//       ids: ids!,
//       count: count!,
//       offset: offset!,
//     );
//     return apiResponse.result
//         .map((e) => e.toServiceExercisePropertyLink())
//         .toList();
//   }

//   @override
//   Future<List<ExercisePropertyLink>> getLinksOfExercise(
//       String exerciseId) async {
//     api.LinkListApiResponse apiResponse =
//         await _linkerApiInstance.getLinksOfExercise(exerciseId);
//     return apiResponse.result
//         .map((e) => e.toServiceExercisePropertyLink())
//         .toList();
//   }

//   @override
//   Future<List<ExercisePropertyLink>> getLinksOfUserProperty(
//       String userPropertyId) async {
//     api.LinkListApiResponse apiResponse =
//         await _linkerApiInstance.getLinksOfUserProperty(userPropertyId);
//     return apiResponse.result
//         .map((e) => e.toServiceExercisePropertyLink())
//         .toList();
//   }

//   @override
//   Future<List<Exercise>> getList(
//       {List<String>? ids, int? count, int? offset}) async {
//     api.ExerciseListApiResponse apiResponse = await _exerciseApiInstance
//         .getExercises(ids: ids!, count: count!, offset: offset!);
//     return apiResponse.result.map((e) => e.toServiceExercise()).toList();
//   }

//   @override
//   Future<Exercise> update(String id, Exercise updatedModel) async {
//     api.ApiResponse response =
//         await _exerciseApiInstance.updateExercise(updatedModel.toAPIExercise());
//     return updatedModel;
//   }

//   @override
//   Future updateLink(String id, ExercisePropertyLink link) async {
//     api.ApiResponse response =
//         await _linkerApiInstance.updateLink(link.toAPIExercisePropertyLink());
//     return link;
//   }

//   @override
//   Future<String> uploadFile(String id, MultipartFile file) async {
//     api.VideoUploadResponse response =
//         await _exerciseApiInstance.uploadFile(id, file: file);
//     return response.result.videoUrl;
//   }
// }
