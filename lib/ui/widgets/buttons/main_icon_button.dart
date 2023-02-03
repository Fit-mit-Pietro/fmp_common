

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
            color:Theme.of(context).textTheme.headline1!.color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(9)),
            border: Border.all(
              width: 1,
              color:Theme.of(context).textTheme.headline1!.color!.withOpacity(0.15),
          )
          ),
          alignment: Alignment.center,
          child:  Icon(iconData,color: Theme.of(context).textTheme.headline1!.color! ,size: WidgetData.MAIN_ICON_BUTTON_SIZE* 0.5,),

        ),
      ),
    );
  }
}
