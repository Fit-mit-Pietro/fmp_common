part of questionnaire_service;

// extension FilledQuestionnaireParser on FilledQuestionnaire {
//   static FilledQuestionnaire fromAPIQuestion(api.FilledQuestionnaire element) =>
//       FilledQuestionnaire(
//         label: element.label,
//         elements: element.elements.map((e) => e.toServiceQuestion()).toList(),
//         id: element.id,
//       );

//   api.FilledQuestionnaire toAPIQuestion() => api.FilledQuestionnaire(
//         label: label,
//         elements: elements.map((e) => e.toAPIQuestion()).toList(),
//         id: id,
//       );
// }

// extension APIFilledQuestionnaireParser on api.FilledQuestionnaire {
//   static api.FilledQuestionnaire fromServiceQuestion(
//           FilledQuestionnaire element) =>
//       element.toAPIQuestion();

//   FilledQuestionnaire toServiceQuestion() =>
//       FilledQuestionnaireParser.fromAPIQuestion(this);
// }
