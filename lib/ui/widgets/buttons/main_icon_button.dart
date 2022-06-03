

import 'package:flutter/material.dart';
import 'package:fmp_common/ui/widgets/buttons/tappable.dart';
import 'package:fmp_common/ui/widgets/widget_data.dart';


class MainIconButton extends StatelessWidget {

  final IconData iconData;
  final GestureTapCallback onTap;

  const MainIconButton({Key? key, required this.iconData, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetData.MAIN_ICON_BUTTON_SIZE,
      height: WidgetData.MAIN_ICON_BUTTON_SIZE,
      child: Tappable(
        onTap: onTap,
        radius: 8,
        child: Container(
          width: WidgetData.MAIN_ICON_BUTTON_SIZE,
          height: WidgetData.MAIN_ICON_BUTTON_SIZE,
          decoration: BoxDecoration(
            color: Color(0xFBFBFBFF),
            borderRadius: BorderRadius.all(Radius.circular(9)),
            border: Border.all(
              width: 1,
              color: Color(0xD9E8E8E8)
          )
          ),
          alignment: Alignment.center,
          child:  Icon(iconData,color: Colors.black,size: WidgetData.MAIN_ICON_BUTTON_SIZE* 0.5,),

        ),
      ),
    );
  }
}
