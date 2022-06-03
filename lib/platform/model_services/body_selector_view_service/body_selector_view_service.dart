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
    { "id": "discprolapse","label": "Bandscheibenvorfall" },
    { "id": "tension","label": "Verspannungen" },
    { "id": "muscular_imbalance","label": "Muskuläres\nUngleichgewicht /\nDysbalance" },
    { "id": "movement_restrictions","label": "Bewegungs-\neinschränkungen" },
    { "id": "radiation_arm","label": "Ausstrahlung oder \nkribbeln in den\nArmen" },
    { "id": "pain_chest","label": "Schmerzen zwischen\nden Schulterblättern" },
    { "id": "pain_thorax","label": "Ringförmige ausstrahlende \nSchmerzen in den \nBrustkorb und \nRippenregionen (Thorax)" },
    { "id": "blockade","label": "Blockaden HWS" },
    { "id": "impingmentsyndrom","label": "impingment Syndrom" },
    { "id": "frozenshoulder","label": "Frozen shoulder" },
    { "id": "rotatorcuff","label": "Rotatoren Manschette" },
    { "id": "arthrose","label": "Arthrose" },
    { "id": "tendonitis","label": "Sehnenscheiden-\nentzündung" },
    { "id": "sprain","label": "Verstauchung /\nContusion" },
    { "id": "carpal_bones","label": "Handwurzelknochen /\nSchmerzen am \nDaumengelenk" },
    { "id": "tennisarm","label": "Tennisarm" },
    { "id": "golfarm","label": "Golfer Ellenbogen" },
    { "id": "rotatorcuff","label": "Rotatoren Manschette" },
    { "id": "terninopathie","label": "Terninopathie - \nÜberlastung der\nSehnen der Hand" },
    { "id": "ischialgia","label": "Ischialgie" },
    { "id": "periformissyndrom","label": "Periformis\nSyndrom" },
    { "id": "hip_stiffness","label": "Verkürzung und \nSteifheit der \nHüfte" },
    { "id": "igs_blockade","label": "ISG Blockade" },
    { "id": "meniskus","label": "Meniskus" },
    { "id": "arthrose","label": "Arthrose" },
    { "id": "patellatipsyndrom","label": "Patella spitzen\nSyndrom" },
    { "id": "femorispatelaris","label": "Schmerzen hinter \nder Kniescheibe\n(Femoris Patelaris)" },
    { "id": "shortening","label": "Verkürzung" },
    { "id": "achillesirritation","label": "Achilles \nSehnenreizung" },
    { "id": "achilles_irruption","label": "Achillessehnen \nRuptur" },
    { "id": "foot_root_blockade","label": "Fuß-Wurzel \nBlockade" },
    { "id": "haglund_foot","label": "Haglund-Ferse" },
    { "id": "fersensporn","label": "Fersensporn" },
    { "id": "achillesirritation","label": "Achilis \nSehnenreizung" },
    { "id": "ruption","label": "Bänderriss /\nStabilisierung nach\nBänderriss" },
    { "id": "jaw_dislocations","label": "Kiefergelenk\nVerrenkungen" },
    { "id": "trigeminus_neuralgie","label": "Trigeminus-\nNeuralgie" },
    { "id": "migraine","label": "Migräne" },
    { "id": "head_neck_tension","label": "Spannungs \nKopfschmerzen /\ndurch Nacken\nVerspannungen," },
    { "id": "austrahlung_beine_gesaes","label": "Ausstrahlung und\nKribbeln in den\nBeinen oder\nund ins Gesäß" },
    { "id": "piriformis","label": "Piriformis" },
    { "id": "wirbelgleiten","label": "Wirbelgleiten" },
    { "id": "ischias_syndrom","label": "Ischias Syndrom" },

    { "id": "muscle_tearing","label": "Muskelfaserriss /\nZerrung" },
    { "id": "adductors_imbalance","label": "Adductoren\nDysbalance" },
    { "id": "abductor_dysbalance","label": "Abduktoren\nDysbalance" },
    { "id": "straining","label": "Zerrung" },

    { "id": "tibialis_anterior_syndrom","label": "Tibialis\nAnterior Syndrom" },
    { "id": "calf_cramps","label": "Waden Krämpfe\n(oft Nachts)" },
    { "id": "verkürzung_nackenmuskulatur","label": "Verkürzung Nacken-\nmuskulatur und\nTrapezius\n(Tastaturhaltung)" },

  ];

  static const List<Map<String, dynamic>> BodyPartsData = [
    {
      "id": "head",
      "label": "Kopf",
      "symptoms": ["migraine","head_neck_tension","headache"]
    },{
      "id": "jaw",
      "label": "Kiefer",
      "symptoms": ["jaw_dislocations","trigeminus_neuralgie"]
    }, {
      "id": "neck",
      "label": "Nacken",
      "symptoms": ["neck_stiffness","discprolapse","blockade_hws"]
    },{
      "id": "cervical_spine",
      "label": "Halswirbelsäule",
      "symptoms": ["discprolapse","tension","muscular_imbalance","movement_restrictions","radiation_arm","verkürzung_nackenmuskulatur"]
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
      "symptoms": ["tension"]
    },{
      "id": "lumbarSpine",
      "label": "Lendenwirbelsäule",
      "symptoms": ["movement_restrictions","austrahlung_beine_gesaes","piriformis","wirbelgleiten","ischias_syndrom",]
    },
    {
      "id": "thoracicSpine",
      "label": "Brustwirbelsäule",
      "symptoms": ["discprolapse","pain_chest","pain_thorax"]
    },{
      "id": "forearm_R",
      "label": "Rechter Unterarm",
      "symptoms": ["tension"]
    },{
      "id": "forearm_L",
      "label": "Linker Unterarm",
      "symptoms": ["tension"]
    },{
      "id": "hip",
      "label": "Hüfte",
      "symptoms":["arthrose","ischialgia","periformissyndrom","stiffness","muscular_imbalance","igs_blockade","impingmentsyndrom"]
    },{
      "id": "hand_R",
      "label": "Rechte Hand",
      "symptoms": ["arthrose","tendonitis","sprain","carpal_bones"]
    },{
      "id": "hand_L",
      "label": "Linke Hand",
      "symptoms": ["arthrose","tendonitis","sprain","carpal_bones"]
    },{
      "id": "upperLeg_R",
      "label": "Rechter Oberschenkel",
      "symptoms":["shortening","straining","abductor_dysbalance","adductors_imbalance","muscle_tearing"],
    },{
      "id": "upperLeg_L",
      "label": "Linker Oberschenkel",
      "symptoms":["shortening","straining","abductor_dysbalance","adductors_imbalance","muscle_tearing"],
    },{
      "id": "knee_L",
      "label": "Linkes Knie",
      "symptoms":["meniskus","arthrose","patellatipsyndrom","femorispatelaris","muscular_imbalance"],

    },{
      "id": "knee_R",
      "label": "Rechtes Knie",
      "symptoms":["meniskus","arthrose","patellatipsyndrom","femorispatelaris","muscular_imbalance"]
    },{
      "id": "lowerLeg_R",
      "label": "Rechter Unterschenkel",
      "symptoms": ["achillesirritation","muscle_tearing","shortening","muscular_imbalance","calf_cramps","tibialis_anterior_syndrom"]
    },
    {
      "id": "lowerLeg_L",
      "label": "Linker Unterschenkel",
      "symptoms": ["achillesirritation","muscle_tearing","shortening","muscular_imbalance","calf_cramps","tibialis_anterior_syndrom"]
    },{
      "id": "foot_L",
      "label": "Linker Fuß",
      "symptoms": ["ruption","achillesirritation","fersensporn","haglund_foot","foot_root_blockade","achilles_irruption","achillesirritation",]
    },{
      "id": "foot_R",
      "label": "Rechter Fuß",
      "symptoms": ["ruption","achillesirritation","fersensporn","haglund_foot","foot_root_blockade","achilles_irruption","achillesirritation",]
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

    List<BodyPart> frontParts = await getBodyPartsFromSvg("assets/img/body_map/body_front_svg.svg", availableBodyParts);
    List<BodyPart> backParts = await getBodyPartsFromSvg("assets/img/body_map/body_back_svg.svg", availableBodyParts);

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
          // print("Could not find sth for $key");
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
