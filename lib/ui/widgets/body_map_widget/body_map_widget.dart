import 'package:flutter/material.dart';
import 'package:fmp_common/fmp_common.dart';


class BodyMapWidget extends StatefulWidget {

  final BodySelectorViewModel model;

  const BodyMapWidget({Key? key,required this.model}) : super(key: key);

  @override
  _BodyMapWidgetState createState() => _BodyMapWidgetState();
}

class _BodyMapWidgetState extends State<BodyMapWidget> {

  void _loadData() async{
    widget.model.setOnPartTapped(_onPartTapped);

    setState(() {
    });

  }
  var _tapPosition;

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  _onPartTapped(BodyPart part,TapDownDetails details) async{

    BodySelectorViewModel localModel = widget.model;

    localModel.updateSelection(part);

    _storePosition(details);

    await _showSymptomsMenu(part,(){
      setState(() {
      });
    });

    setState(() {

    });


  }

  Future _showSymptomsMenu(BodyPart bodyPart,Function update) async{

    final RenderBox? overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          _tapPosition & const Size(40, 40), // smaller rect, the touch area
          Offset.zero & (overlay?.size ??
              const Size(0, 0)) // Bigger rect, the entire screen
      ),

      items: [
        PopupMenuItem(
            enabled: false,
            child: Text(bodyPart.label, style: Theme.of(context).textTheme.displaySmall)
        ),

        if(bodyPart.possibleSymptomKeys.isNotEmpty )
          for ( var symptom in BodySelectorViewService.instance.getSymptomsByKeys(bodyPart.possibleSymptomKeys) ) _buildItem(symptom,bodyPart,update)
      ],
      elevation: 8.0,
    );

  }

  PopupMenuItem<dynamic> _buildItem(BodyPartSymptom symptom,BodyPart bodyPart,Function update) {
    return PopupMenuItem(
      enabled: false,

      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
        return Tappable(
          onTap: (){
            setState(() {
              widget.model.onSymptomSelected(symptom,bodyPart);
            });
            update();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value:  widget.model.isSymtomSelected(symptom, bodyPart),
                  onChanged: (bool? value) {
                    if(value != null){
                      setState(() {
                        widget.model.onSymptomSelected(symptom,bodyPart);
                      });
                      update();
                    }
                  },
                ),
              ),
              const SizedBox(width: 12,),
              Flexible(child: Text(symptom.label,style: Theme.of(context).textTheme.bodyLarge,),)
            ],
          ));
        }),

    );
  }

  @override
  void initState() {
    super.initState();
    widget.model.setOnPartTapped(_onPartTapped);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    BodySelectorViewModel localModel = widget.model;
    return SwitchableBodyCanvas(model: localModel);
  }

}
