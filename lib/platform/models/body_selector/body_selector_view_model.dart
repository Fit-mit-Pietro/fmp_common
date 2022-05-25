import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fmp_common/fmp_common.dart';
import 'package:fmp_common/platform/models/body_selector/body_part.dart';
import 'package:fmp_common/platform/models/body_selector/body_part_symptom.dart';
import 'package:json_annotation/json_annotation.dart';

part 'body_selector_view_model.g.dart';

@JsonSerializable()
class BodySelectorViewModel{


  @JsonKey(name: Keys.BODY_SELECTOR_PARTS_FRONT)
  final List<BodyPart> front;

  @JsonKey(name: Keys.BODY_SELECTOR_PARTS_BACK)
  final List<BodyPart> back;

  @JsonKey(ignore: true)
  late Function(BodyPart,TapDownDetails)? onPartTapped;

  @JsonKey(ignore: true)
  Map<String,List<BodyPartSymptom>> selectedSymptoms = {};

  void setOnPartTapped(Function(BodyPart,TapDownDetails) callback){
    this.onPartTapped = callback;
  }

  BodySelectorViewModel({
    required this.front,
    required this.back,
  });

  factory BodySelectorViewModel.fromJson(Map<String, dynamic> json) => _$BodySelectorViewModelFromJson(json);
  Map<String, dynamic> toJson() => _$BodySelectorViewModelToJson(this);

  bool isPartSelected(BodyPart part) {
    if(selectedSymptoms.containsKey(part.id)){
      List<BodyPartSymptom> selectedSympts = selectedSymptoms[part.id] ?? [];
      if(!selectedSympts.isEmpty) return true;
    }
    return false;
  }

  void updateSelection(BodyPart part) {

  }

  void setPartPath(String key, String path) {
    front.forEach((element) {
      if(element.id == key){
        element.path = path;
        return;
      }
    });
  }


  bool isSymtomSelected(BodyPartSymptom symptom,BodyPart part){
    print(jsonEncode(selectedSymptoms));
    if(selectedSymptoms.containsKey(part.id)){
      List<BodyPartSymptom>? selectedSympts = selectedSymptoms[part.id];
      if(selectedSympts != null){
        for(BodyPartSymptom selected in selectedSympts){
          if(selected.id == symptom.id) return true;
        }
      }
    }
    return false;
  }

  void onSymptomSelected(BodyPartSymptom symptom,BodyPart part) {
    if(!selectedSymptoms.containsKey(part.id)){
      selectedSymptoms[part.id] = [];
    }

    for(BodyPartSymptom selected in selectedSymptoms[part.id] ?? [] ){
      if(selected.id == symptom.id){
        selectedSymptoms[part.id]?.remove(selected);
        return;
      }
    }

    selectedSymptoms[part.id]?.add(symptom);

  }
}

