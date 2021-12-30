import 'package:flutter/services.dart';
import 'package:fmp_common/platform/models/body_selector/body_part.dart';
import 'package:fmp_common/platform/models/body_selector/body_part_symptom.dart';
import 'package:fmp_common/platform/models/body_selector/body_selector_view_model.dart';
import 'package:xml/xml.dart';
import 'package:collection/collection.dart'; // <- required or firstWhereOrNull is not defined

class BodySelectorViewService {



  BodySelectorViewService._();
  static late BodySelectorViewService instance;
  static Future init() async{
    instance = BodySelectorViewService._();

    instance.availableSymptoms = [];
    SymptomsData.forEach((element) {
      BodyPartSymptom symptom = BodyPartSymptom.fromJson(element);
      instance.availableSymptoms.add(symptom);
    });

  }

  static const List<Map<String,dynamic>> SymptomsData = [
    { "id": "neck_stiffness","label": "Steifheit" },
    { "id": "discprolapse","label": "Bandscheibenvorfall HWS" },
    { "id": "blockade","label": "Blockaden HWS" },
    { "id": "impingmentsyndrom","label": "impingment Syndrom" },
    { "id": "frozenshoulder","label": "Frozen shoulder" },
    { "id": "rotatorcuff","label": "Rotatoren Manschette" },
    { "id": "arthrose","label": "Arthrose" },
    { "id": "tennisarm","label": "Tennisarm" },
    { "id": "golfarm","label": "Golfer Ellenbogen" },
    { "id": "rotatorcuff","label": "Rotatoren Manschette" },
    { "id": "terninopathie","label": "Terninopathie - Überlastung der Sehnen der Hand" },
    { "id": "ischialgia","label": "Ischialgie" },
    { "id": "periformissyndrom","label": "Periformis Syndrom" },
    { "id": "hip_stiffness","label": "Verkürzung und Steifheit der Hüfte" },
    { "id": "meniskus","label": "Meniskus" },
    { "id": "arthrose","label": "Arthrose" },
    { "id": "patellatipsyndrom","label": "Patella spitzen Syndrom" },
    { "id": "femorispatelaris","label": "schmerzen hinter der Kniescheibe (Femoris Patelaris)" },
    { "id": "achilodie","label": "Achilodie" },
    { "id": "shortening","label": "Verkürzung des Unterschenkels" },
    { "id": "achillesirritation","label": "Achilis Sehnenreizung" },
  ];

  static const List<Map<String, dynamic>> BodyPartsData = [
    {
      "id": "head",
      "label": "Kopf",
      "symptoms": []
    }, {
      "id": "neck",
      "label": "Nacken",
      "symptoms": ["neck_stiffness","discprolapse","blockade_hws"]
    },{
      "id": "shoulder_R",
      "label": "Rechte Schulter",
      "symptoms": ["impingmentsyndrom","frozenshoulder","rotatorcuff","arthrose"]
    },{
      "id": "shoulder_L",
      "label": "Linke Schulter",
      "symptoms": ["impingmentsyndrom","frozenshoulder","rotatorcuff","arthrose"]
    },{
      "id": "elbow_R",
      "label": "Rechter Ellenbogen",
      "symptoms": ["tennisarm","golfarm","terninopathie","arthrose"]
    },{
      "id": "elbow_L",
      "label": "Linker Ellenbogen",
      "symptoms": ["tennisarm","golfarm","terninopathie","arthrose"]
    },{
      "id": "body",
      "image_keys": ["body","body_L","body_R"],
      "label": "Oberkörper",
      "symptoms": []
    },{
      "id": "lumbarSpine",
      "label": "Lendenwirbelsäule",
      "symptoms": []
    },{
      "id": "thoracicSpine",
      "label": "Brustwirbelsäule",
      "symptoms": []
    },{
      "id": "forearm_R",
      "label": "Rechter Unterarm",
      "symptoms": []
    },{
      "id": "forearm_L",
      "label": "Linker Unterarm",
      "symptoms": []
    },{
      "id": "hip",
      "label": "Hüfte",
      "symptoms":["arthrose","ischialgia","periformissyndrom","stiffness",]
    },{
      "id": "hand_R",
      "label": "Rechte Hand",
      "symptoms": []
    },{
      "id": "hand_L",
      "label": "Linke Hand",
      "symptoms": []
    },{
      "id": "upperLeg_R",
      "label": "Rechter Oberschenkel",
      "symptoms": []
    },{
      "id": "upperLeg_L",
      "label": "Linker Oberschenkel",
      "symptoms": []
    },{
      "id": "knee_L",
      "label": "Linkes Knie",
      "symptoms":["meniskus","arthrose","patellatipsyndrom","femorispatelaris",]
    },{
      "id": "knee_R",
      "label": "Rechter Knie",
      "symptoms":["meniskus","arthrose","patellatipsyndrom","femorispatelaris",]
    },{
      "id": "lowerLeg_R",
      "label": "Rechter Unterschenkel",
      "symptoms":["achilodie","shortening","achillesirritation"]
    },{
      "id": "lowerLeg_L",
      "label": "Linker Unterschenkel",
      "symptoms":["achilodie","shortening","achillesirritation"]
    },{
      "id": "foot_L",
      "label": "Linker Fuß",
      "symptoms": []
    },{
      "id": "foot_R",
      "label": "Rechter Fuß",
      "symptoms": []
    },
  ];


  List<BodyPartSymptom> availableSymptoms = [];

  List<BodyPartSymptom> getSymptomsByKeys(List<String> keys){
    List<BodyPartSymptom> symptoms = [];
    keys.forEach((key) {
      BodyPartSymptom? symptom = availableSymptoms.firstWhereOrNull((element) => element.id == key);
      if(symptom != null){
        symptoms.add(symptom);
      }
    });
    return symptoms;
  }

  Future<BodySelectorViewModel> loadModel() async{

    List<BodyPart> availableBodyParts = [];
    BodyPartsData.forEach((element) {
      BodyPart symptom = BodyPart.fromJson(element);
      availableBodyParts.add(symptom);
    });

    List<BodyPart> frontParts = await getBodyPartsFromSvg("assets/img/body_front_svg.svg", availableBodyParts);
    List<BodyPart> backParts = await getBodyPartsFromSvg("assets/img/body_back_svg.svg", availableBodyParts);

    return BodySelectorViewModel(front: frontParts, back: backParts);
  }


  Future<List<BodyPart>> getBodyPartsFromSvg(
      String path,
      List<BodyPart> availableBodyParts,
    ) async{
    List<BodyPart> parts = [];
    Map<String,String> frontPartsPaths = await loadBodyPartsFromSvg(svgImage:path);
    frontPartsPaths.keys.forEach((String key) {
      String? path = frontPartsPaths[key];
      if(path != null){
        BodyPart? part = availableBodyParts.firstWhereOrNull((element) => 
          element.id == key || (element.imageKeys ?? []).contains(key)
        );
        if(part != null) {

          BodyPart newPart = BodyPart.copy(part);
          newPart.path = path;
          parts.add(newPart);
        }else{
          print("Could not find sth for $key");
        }
      }
    });
    return parts
    ;
  }

  Future< Map<String,String>> loadBodyPartsFromSvg(
      {required String svgImage}) async {
    String generalString = await rootBundle.loadString(svgImage);
    XmlDocument document = XmlDocument.parse(generalString);
    final paths = document.findAllElements('path');

    Map<String,String> parts = {};

    paths.forEach((element) {
      String partName = element.getAttribute('id').toString();
      String partPath = element.getAttribute('d').toString();

      if (!partName.contains('path') != "w") {
        parts[partName] = partPath;
      }
    });

    return parts;
  }
}
