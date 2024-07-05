

import 'package:flutter/material.dart';
import 'package:fmp_common/platform/backend_service/filter/filter_lib.dart';
import 'package:fmp_common/ui/widgets/filter/field_value_widget.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget_expandable_container.dart';
import 'package:fmp_common/ui/widgets/filter/filter_widget_functions.dart';

class FilterWidget extends StatefulWidget {

  Filter filter;

  bool showFieldsDropdown;

  Function? onFilterChanged;

  FilterWidget({Key? key,required this.filter,this.onFilterChanged, this.showFieldsDropdown = true}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> with FilterWidgetFunctions{

  void _onFilterOperationChanged(FilterOperation? newValue) {
    if(newValue != null) {
      setState(() {
        widget.filter.selectedFilterOperation = newValue;
      });

      widget.onFilterChanged?.call();
    }
  }

  void _onFieldChanged(Field? field){
    if(field != null){
      setState(() {
        widget.filter.setSelectedField(field);
      });
      widget.onFilterChanged?.call();

    }
  }

  void _onFieldValueChanged(dynamic value) {
    if(value != null){
      setState(() {
        widget.filter.value = value;
      });
      widget.onFilterChanged?.call();

    }
  }

  @override
  Widget build(BuildContext context) {
    List<Field> fields = widget.filter.getPossibleAndSelectedField();

    return Row(
      children: [
        if (widget.showFieldsDropdown)
          Expanded(
            flex: 1,
            child: FilterWidgetExpandableContainer(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Field>(
                  isExpanded: true,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 16),
                  value: fields.firstWhere((element) => element.id == widget.filter.getSelectedField().id),

                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  onChanged:fields.length > 1 ?
                      _onFieldChanged : null,
                  items: fields.map<
                      DropdownMenuItem<Field>>((Field value) {
                    return DropdownMenuItem<Field>(
                        value: value,
                        child: DropDownChild(
                          text: value.label
                        )
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        if(widget.showFieldsDropdown)const SizedBox(width: 8,),
        FilterWidgetExpandableContainer(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FilterOperation>(
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 16),
              value: widget.filter.selectedFilterOperation,
              icon: const Icon(Icons.keyboard_arrow_down),
              elevation: 16,

              onChanged: _onFilterOperationChanged,
              items: widget.filter.getAvailableOperations().map<
                  DropdownMenuItem<FilterOperation>>((FilterOperation value) {
                return DropdownMenuItem<FilterOperation>(
                    value: value,
                    child: DropDownChild(
                      text: getLabelOfOperation(value),
                    )
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(width: 8,),
        Expanded(
          flex: 1,
          child: FieldValueWidget(
            onValueChanged: _onFieldValueChanged,
            value: widget.filter.value,
            field: widget.filter.getSelectedField(),
          ),
        )
      ],
    );
  }
}


class DropDownChild extends StatelessWidget {

  String text;

  DropDownChild({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      waitDuration: const Duration(milliseconds: 1500),
      message: text,
      child: Text(text,overflow: TextOverflow.ellipsis,maxLines: 1),

    );
  }
}
