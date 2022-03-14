import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties: AdditionalProperties(
        pubName: 'questionnaire_service', pubAuthor: 'Paul Groß'),
    inputSpecFile: 'lib/platform/backend_service/questionnaire_service/questionnaire-service-api.yaml',
    generatorName: Generator.dio,
    outputDirectory: 'lib/platform/backend_service/questionnaire_service')
class QuestionnaireService extends OpenapiGeneratorConfig {}