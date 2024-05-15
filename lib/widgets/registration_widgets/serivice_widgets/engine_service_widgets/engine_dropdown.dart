import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/engine_bloc/bloc/engine_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_text.dart';

void showDropdownForEngine(BuildContext context) {
  List<String> selectedLabels = [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        title: const AppText(
            text: 'Select Services', size: 0.06, fontFamily: 'Noto Serif'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MultiSelectDropDown(
                fieldBackgroundColor: Appallcolor().textcolor,
                onOptionSelected: (options) {
                  selectedLabels =
                      options.map((option) => option.label).toList();
                },
                options: const [
                  ValueItem(label: 'Oil Change', value: 1),
                  ValueItem(label: 'Engine Tune-Up', value: 2),
                  ValueItem(
                      label: 'Filter Replacement (Air, Oil, Fuel)', value: 3),
                  ValueItem(label: 'Cooling System Flush', value: 4),
                  ValueItem(label: 'Engine Diagnostic', value: 5),
                  ValueItem(label: 'Timing Belt Replacement', value: 6),
                  ValueItem(label: 'Spark Plug Replacement', value: 7),
                  ValueItem(label: 'Ignition System Repair', value: 8),
                  ValueItem(label: 'Fuel System Cleaning', value: 9),
                  ValueItem(label: 'Engine Rebuild/Replacement', value: 10),
                ],
                borderColor: Appallcolor().buttonforgroundcolor,
                maxItems: 10,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: Icon(
                  Icons.check_circle,
                  color: Appallcolor().appbarbackgroundcolor,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<EngineBloc>().add(EngineServiceAddingButtonPressed(
                  Selectedservices: selectedLabels));
              print(selectedLabels);
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}
