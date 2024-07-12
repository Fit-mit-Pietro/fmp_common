part of question_service;

class _QuestionServiceReal_Rework implements IQuestionService {
  _QuestionServiceReal_Rework(QuestionServiceConfig config)
      : _api = swagger.QuestionServiceApi.create(
            baseUrl: Uri.parse(config.SERVICE_URL));

  final swagger.QuestionServiceApi _api;

  @override
  Future<Question> create(Question t) async {
    final question = swagger.Question(
      id: t.id,
      text: t.label,
      userPropertyId: t.userPropertyId,
    );

    final response = await _api.questionPost(body: question);
    _logApiReponse(response.body?.toJson(), '$create');

    return t;
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
    _logApiReponse(response.body?.toJson(), '$delete');
  }

  @override
  Future<Question> getById(String id) async {
    final response = await _api.questionsGet(ids: [id]);
    _logApiReponse(response.body?.toJson(), '$getById');
    throw UnimplementedError(
        'response parsing not implemented yet when getting question by id');
  }

  @override
  Future<List<Question>> getList(
      {List<String>? ids, int? count, int? offset}) async {
    final response =
        await _api.questionsGet(ids: ids, count: count, offset: offset);
    _logApiReponse(response.body?.toJson(), '$getList');
    throw UnimplementedError(
        'response parsing not implemented yet when getting question by id list');
  }

  @override
  Future<Question> update(String id, Question updatedModel) async {
    final response = await _api.questionPut(
        body: swagger.Question(
      id: id,
      text: updatedModel.label,
      userPropertyId: updatedModel.userPropertyId,
    ));

    _logApiReponse(response.body?.toJson(), '$getList');
    return updatedModel;
  }
}
