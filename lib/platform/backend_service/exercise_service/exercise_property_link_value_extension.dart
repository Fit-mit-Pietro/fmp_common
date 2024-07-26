part of exercise_service;

// // extension ServiceExercisePropertyLinkValueParser on ExercisePropertyLinkValue {
// //   static ExercisePropertyLinkValue fromAPIExercisePropertyLinkValue(
// //           api.ExercisePropertyLinkValue element) =>
// //       ExercisePropertyLinkValue(
// //           value: element.value as double,
// //           filter: element.filter.toServiceFilter());

// //   api.ExercisePropertyLinkValue toAPIExercisePropertyLinkValue() =>
// //       api.ExercisePropertyLinkValue(
// //         filter: filter.toExerciseAPIFilter(),
// //         value: value,
// //       );
// // }

// extension APIExercisePropertyLinkValueParser on api.ExercisePropertyLinkValue {
//   static api.ExercisePropertyLinkValue fromServiceExercisePropertyLinkValue(
//           ExercisePropertyLinkValue element) =>
//       element.toAPIExercisePropertyLinkValue();

//   ExercisePropertyLinkValue toServiceExercisePropertyLinkValue() =>
//       ServiceExercisePropertyLinkValueParser.fromAPIExercisePropertyLinkValue(
//           this);
// }
