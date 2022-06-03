

import 'package:flutter/material.dart';
import 'package:fmp_common/platform/models/body_selector/body_selector_view_model.dart';
import 'dart:math' as math;

import 'package:fmp_common/ui/widgets/body_map_widget/body_canvas.dart';
import 'package:fmp_common/ui/widgets/buttons/tappable.dart';

class SwitchableBodyCanvas extends StatefulWidget {

  final BodySelectorViewModel model;
  final double width;
  final double height;

  const SwitchableBodyCanvas({Key? key,required this.model,this.width = 400,this.height = 450}) : super(key: key);

  @override
  _SwitchableBodyCanvasState createState() => _SwitchableBodyCanvasState();
}

class _SwitchableBodyCanvasState extends State<SwitchableBodyCanvas> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _showingFront = true;

  @override
  void initState() {
    super.initState();
    // 1 = back, 0 = front
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 700));
    _controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSwitchSideTapped(bool selected){
    if(!selected){
      setState(() {
        if(_showingFront){
          // rotate to back
          _controller.animateTo(1.0);
          _showingFront = false;
        }else{
          // rotate to front
          _controller.animateTo(0.0);
          _showingFront = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSideSwitch("Vorderseite", _showingFront),
              Container(width: 8,),
              _buildSideSwitch("Rückseite", !_showingFront),
            ],
          ),
          Container(height: 8,),
          Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3,2,0.001)
                ..rotateY(_controller.value < 0.5 ?
                    _controller.value * math.pi
                      :
                    // we want to end at zero, as we dont want to mirror
                    (1 - _controller.value) * math.pi
                ),
              child: Container(
                width: widget.width,
                height: widget.height,
                child: BodyCanvas(model: widget.model, front: _controller.value < 0.5)
              )
          )

        ],
      ),
    );
  }


  Widget _buildSideSwitch(String label,bool selected) {
    return Tappable(
      onTap: () => _onSwitchSideTapped(selected),
      radius: 8,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: selected? Color(0xFFEFEFEF) : Colors.transparent,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Text(label,style: TextStyle(
            color: selected? Colors.black87 : Colors.black54
        ),),
      ),
    );
  }
}
