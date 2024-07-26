part of questionnaire_service;

// extension FilledQuestionnaireElementParser on FilledQuestionnaireElement {
//   static FilledQuestionnaireElement fromAPIQuestion(
//           api.FilledQuestionnaireElement element) =>
//       FilledQuestionnaireElement(
//           filledQuestion: element.question.toServiceQuestion(),
//           index: element.index,
//           dependency: element.dependsOn.toServiceFilter());

//   api.FilledQuestionnaireElement toAPIQuestion() =>
//       api.FilledQuestionnaireElement(
//           question: filledQuestion.toApiQuestion(),
//           index: index,
//           dependsOn: dependency!.toQuestionnaireAPIFilter());
// }

// extension APIFilledQuestionnaireElementParser
//     on api.FilledQuestionnaireElement {
//   static api.FilledQuestionnaireElement fromServiceQuestion(
//           FilledQuestionnaireElement element) =>
//       element.toAPIQuestion();

//   FilledQuestionnaireElement toServiceQuestion() =>
//       FilledQuestionnaireElementParser.fromAPIQuestion(this);
// }
