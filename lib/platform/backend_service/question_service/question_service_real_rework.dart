part of question_service;

class _QuestionServiceReal_Rework implements IQuestionService {
  static const String _kToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJraW5kIjoiaWRlbnRpdHl0b29sa2l0I1ZlcmlmeVBhc3N3b3JkUmVzcG9uc2UiLCJsb2NhbElkIjoiczhuU0RRQWFWVU84NWppVWpXQ2ZtZGc1VnBoMiIsImVtYWlsIjoicGF1bC5yaWVkbGluZ2VuQGdtYWlsLmNvbSIsImRpc3BsYXlOYW1lIjoiIiwiaWRUb2tlbiI6ImV5SmhiR2NpT2lKU1V6STFOaUlzSW10cFpDSTZJbU0yTnpOa00yTTVORGRoWldJeE9HSTJOR1UxT0dVelpXUmxNekkxTldaaVpqVTNOVEk0TldJaUxDSjBlWEFpT2lKS1YxUWlmUS5leUpwYzNNaU9pSm9kSFJ3Y3pvdkwzTmxZM1Z5WlhSdmEyVnVMbWR2YjJkc1pTNWpiMjB2WVhWMGFHVnVkR2xqWVhScGIyNHRkR1Z6ZEMxbFl6VTRNaUlzSW1GMVpDSTZJbUYxZEdobGJuUnBZMkYwYVc5dUxYUmxjM1F0WldNMU9ESWlMQ0poZFhSb1gzUnBiV1VpT2pFMk5URXdPVFl6TlRVc0luVnpaWEpmYVdRaU9pSnpPRzVUUkZGQllWWlZUemcxYW1sVmFsZERabTFrWnpWV2NHZ3lJaXdpYzNWaUlqb2ljemh1VTBSUlFXRldWVTg0TldwcFZXcFhRMlp0WkdjMVZuQm9NaUlzSW1saGRDSTZNVFkxTVRBNU5qTTFOU3dpWlhod0lqb3hOalV4TURrNU9UVTFMQ0psYldGcGJDSTZJbkJoZFd3dWNtbGxaR3hwYm1kbGJrQm5iV0ZwYkM1amIyMGlMQ0psYldGcGJGOTJaWEpwWm1sbFpDSTZabUZzYzJVc0ltWnBjbVZpWVhObElqcDdJbWxrWlc1MGFYUnBaWE1pT25zaVpXMWhhV3dpT2xzaWNHRjFiQzV5YVdWa2JHbHVaMlZ1UUdkdFlXbHNMbU52YlNKZGZTd2ljMmxuYmw5cGJsOXdjbTkyYVdSbGNpSTZJbkJoYzNOM2IzSmtJbjE5Lk40S0RxcXYyUllLeTIzckVXcG5tMmJUUUxxbXZFSU83Y2doODd6WXNud0VKMF9kdk9sNHNfUHpqOXYxSzRkelF5TXNkNkp1TGJpaGdDS3JQNnJwbGUxSzN6RTFyTThxVUtvTEZHOTFkekFaWEdpTW5oeXVIUnVtZWw2VWxZenpEOUV4aTN2YS01QkItOWRsdEs4TjJ4ckpyZXZaLWZ1Mk5TTml4bk53UXVzaEJxdllFQ25UVzFHb2NVUkNyZnY3b3YyQTdHTUtTNGZtaXdQOFBJVE9JWldPMTZiVWRyQ2ZvQTBUM000WWZrNW5JbWJpV2xDdUpmU0taOE5FM1lGSi1iamQ2RFJrMWxHMkR1a2QxNFJ4TU9LWXZFNlNSSzRvMnJUM0dhVjRUbjdCUFJ5NV9YMFR4eDFnMDNIOVpPbEQ4N0gycW94NU9uak5lMWxXMVNDbDFTdyIsInJlZ2lzdGVyZWQiOnRydWUsInJlZnJlc2hUb2tlbiI6IkFJd1VhT2tJNXpiVUw3S0h2dm80dWlJT2xjbThPSllqMWhKT1c0VnUyVVB1RG9xNnpZa3dsR19pclkyRzAzVThOVk5pTHc0bFN5TVB0V284MEQ5RmlLRTZ1czlmeEY4QXJFM25SRmJ2Z1FheVVrTk54OUF6T19qTE9BbGJOcDVEWXVwSnJ0ZF9ER1lpcDhKbFFxTXFjcHZpcmNpbmZycWJfQUoyLXkyN1F0cTBUbmtjN2NUaXh4M25nc2pvLURScldrYzktbjFRQmhZY0VqNXgtWGhJZnBlUl8yMmM1YWVBb1BRb3FMbDlyZGV5b3hRZnlwbGNSUXRkODc4Zm04MXN0ZGpCWUcxbTBVX2ciLCJleHBpcmVzSW4iOiIzNjAwIiwicGVybWlzc2lvbiI6MTB9.bgDdrpjDwZm9Kkh_5npdy7mPckjrK3kqNno50aYlNKWmRi7fOtI0ElwG-XybzjmUGKDDlRc52G5_BlN23jLWt8PVkRkKniYfPvPbZ6A4dyM_PwlCWFE81BWZuRzZlHuyO5eyEWEheEx_wD2PMNB7nMSN878SzqigRKP6ekRvoD4COMTXOlEkSCw0lW0IbzqVxlHO_6zh2pfQOc1oM7xmo9164TV1yv57aLWQ_JOMUl3xIZuVBPZrR4Ks_09etySfkkhapoL3A0VYWNhpfNPbxCuCb69nfvJ2ntfLIRpuNlNk4MfQeF_-XwzZlVGneKTeMRCEHMo_cVlsm1GDZyXAr2Ic5qxmzBcWSAyqlk8o5i9IFZaDHlEJIthlzQy2TxCHWn0obhWuc7La7C6jtM2-06-Exc3nG_9YaU6PqsJHba7gv0IwT_Kd2GGn8_ZbuTvlKVw7FRwJ3l3Mloa1_KsaaqJJVdPf38Q-_i_kqrKZZx0p1LrghRutqGfklQ7T2P3BUKPSPpC8BIbd_WjPoYhAdqHgxgZrcUChYLBs0vad3oIdDed2Bd2HU7hYKYNgcvR8VhJxntroqj2e9_-ZXKhN7Og1eyJ0T5Ya5hkiQQ5MLoMkv1EajIgKVSpdxXn8hDsJ4BzK7qqK8-O-hL2Qk63fKsZdR3TB4C3Gzw_PnotsnRU";

  _QuestionServiceReal_Rework(QuestionServiceConfig config)
      : _api = swagger.QuestionServiceApi.create(
          interceptors: [AuthInterceptor(token: _kToken)],
          baseUrl: Uri.parse(config.SERVICE_URL),
        );

  final swagger.QuestionServiceApi _api;

  @override
  Future<Question> create(Question question) async {
    final response = await _api.questionPost(
        body: swagger.Question.fromJson(question.toJson()));
    if (!response.isSuccessful) {
      throw UnimplementedError();
    }

    return Question.fromJson(response.body!.result! as Map<String, dynamic>);
    // return Question.fromJson(response.body!.toJson()['result']);
  }

  void _logApiReponse(Map<String, dynamic>? jsonResponse, String method) {
    if (kDebugMode) {
      final logMessage = jsonResponse != null
          ? JsonEncoder.withIndent(' ' * 4).convert(jsonResponse)
          : '<no response>';

      print(
          '[$_QuestionServiceReal_Rework] API Response to $method(...):\n$logMessage');
    }
  }

  @override
  Future<void> delete(String id) async {
    final response = await _api.questionQuestionIdDelete(questionId: id);

    _logApiReponse(response.body?.toJson(), 'delete');
  }

  @override
  Future<Question> getById(String id) async {
    // final response = await _api.questionsGet(ids: [id]);
    final response = await _api.questionQuestionIdGet(questionId: id);
    if (!response.isSuccessful) {
      throw UnimplementedError('Error when requesting question by ID.');
    }

    _logApiReponse(response.body?.toJson(), 'getById');

    return Question.fromJson(response.body!.result as Map<String, dynamic>);
  }

  @override
  Future<List<Question>> getList({
    List<String>? ids,
    int? count,
    int? offset,
  }) async {
    final response =
        await _api.questionsGet(ids: ids, count: count, offset: offset);

    if (!response.isSuccessful) {
      return [];
    }

    // hello from admin

    return (response.body!.result as List)
        .map((e) => Question.fromJson(e))
        .toList();
  }

  @override
  Future<Question> update(String id, Question updatedModel) async {
    final response = await _api.questionPut(
        body: swagger.Question(
      id: id,
      text: updatedModel.label,
      userPropertyId: updatedModel.userPropertyId,
    ));

    _logApiReponse(response.body?.toJson(), 'update');

    return Question.fromJson(response.body!.result as Map<String, dynamic>);
  }
}
