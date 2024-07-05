
part of questionnaire_service;



extension FilledQuestionnaireParser on FilledQuestionnaire {

  static FilledQuestionnaire fromAPIQuestion(API.FilledQuestionnaire element) => FilledQuestionnaire(
    label: element.label,
    elements: element.elements.map((e)=> e.toServiceQuestion()).toList(),
    id: element.id,
  );

  API.FilledQuestionnaire toAPIQuestion() => API.FilledQuestionnaire(
    label: label,
    elements: elements.map((e)=> e.toAPIQuestion()).toList(),
    id: id,
  );

}

extension APIFilledQuestionnaireParser on API.FilledQuestionnaire {

  static API.FilledQuestionnaire fromServiceQuestion(FilledQuestionnaire element)
  => element.toAPIQuestion();

  FilledQuestionnaire toServiceQuestion()
  => FilledQuestionnaireParser.fromAPIQuestion(this);

}