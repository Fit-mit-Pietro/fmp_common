part of questionnaire_service;

class _QuestionnaireServiceReal_Rework implements IQuestionnaireService {
  _QuestionnaireServiceReal_Rework(QuestionnaireServiceConfig config)
      : _api = swagger.QuestionnaireServiceApi.create(
          baseUrl: config.SERVICE_URL,
        );

  final swagger.QuestionnaireServiceApi _api;

  @override
  Future<Questionnaire> create(Questionnaire t) async {
    final questionnaire = swagger.Questionnaire(
      id: t.id,
      label: t.label,
      elements: t.elements.map((e) => e.toSwagger()).toList(),
    );
    _api.questionnairePost(body: )

    return t;
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Questionnaire> getById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<FilledQuestionnaire> getFilledQuestionnaireById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Questionnaire>> getList(
      {List<String>? ids, int? count, int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future<Questionnaire> update(String id, Questionnaire updatedModel) {
    throw UnimplementedError();
  }
}
