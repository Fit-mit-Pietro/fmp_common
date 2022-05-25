
part of question_service;


class _QuestionServiceMock extends CRUDTemplateServiceMock<Question> implements IQuestionService{

  QuestionServiceConfig _config;

  _QuestionServiceMock(this._config):super(_config){
    create(Question.createNew(
      userPropertyId: "Symptom1",
      label: "Das ist die Frage 1",
    ));
    create(Question.createNew(
      userPropertyId: "Symptom2",
      label: "Das ist die Frage 2",
    ));
    create(Question.createNew(
      userPropertyId: "Symptom3",
      label: "Das ist die Frage 3",
    ));
  }
}