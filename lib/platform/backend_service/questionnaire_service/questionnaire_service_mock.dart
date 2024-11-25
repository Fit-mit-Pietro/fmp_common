part of questionnaire_service;

class _QuestionnaireServiceMock extends CRUDTemplateServiceMock<Questionnaire>
    implements IQuestionnaireService {
  // ignore: unused_field
  final QuestionnaireServiceConfig _config;

  _QuestionnaireServiceMock(this._config) : super(_config) {
    create(Questionnaire.createNew(
      label: "Das ist der Fragebogen 1",
    ));
    create(Questionnaire.createNew(
      label: "Das ist der Fragebogen 2",
    ));
    create(Questionnaire.createNew(
      label: "Das ist der Fragebogen 3",
    ));
  }

  @override
  Future<FilledQuestionnaire> getFilledQuestionnaireById(String id) async {
    print("getFilledQuestionnaireById $id");

    Questionnaire questionnaire = await getById(id);

    print("Loaded Questionnaire: $questionnaire");

    List<FilledQuestion> filledQuestions = await getFilledQuestion(
        questionnaire.elements.map((e) => e.questionId).toList());

    List<FilledQuestionnaireElement> elements = [];

    for (QuestionnaireElement element in questionnaire.elements) {
      FilledQuestionnaireElement filledElement = FilledQuestionnaireElement(
          index: element.index,
          filledQuestion:
              filledQuestions.firstWhere((q) => q.id == element.questionId));

      elements.add(filledElement);
    }

    return FilledQuestionnaire(
        id: questionnaire.id, label: questionnaire.label, elements: elements);
  }

  Future<List<FilledQuestion>> getFilledQuestion(
      List<String> questionIds) async {
    if (questionIds.isEmpty) return [];

    // get questions
    List<Question> questions =
        await QuestionService.instance.getList(ids: questionIds);
    //print(questions.length);
    // get user symptoms
    List<String> userPropertyIds =
        questions.map((e) => e.userPropertyId).toList();
    //print(questions.length);

    List<UserProperty> userProperties =
        await UserPropertyService.instance.getList(ids: userPropertyIds);
    List<FilledQuestion> filledQuestions = [];

    // merge both lists to FilledQuestionnaireElement
    for (Question question in questions) {
      UserProperty? userProperty;

      for (UserProperty property in userProperties) {
        if (property.id == question.userPropertyId) {
          userProperty = property;
          break;
        }
      }

      if (userProperty == null) {
        print("Couldnt find a property for ${question.userPropertyId}");
        continue;
      }

      FilledQuestion filledQuestion = FilledQuestion(
          id: question.id, text: question.label, userProperty: userProperty);
      filledQuestions.add(filledQuestion);
    }
    return filledQuestions;
  }
}
