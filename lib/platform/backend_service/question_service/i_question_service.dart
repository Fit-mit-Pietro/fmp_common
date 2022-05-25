
part of question_service;

abstract class IQuestionService implements ICRUDTemplateService<Question>{
  factory IQuestionService(QuestionServiceType userServiceType,QuestionServiceConfig config){
    switch(userServiceType){

      case QuestionServiceType.mock:
        return _QuestionServiceMock(config);
      case QuestionServiceType.real:
        return _QuestionServiceReal(config);
    }
  }
}