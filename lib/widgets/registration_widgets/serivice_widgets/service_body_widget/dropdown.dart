import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/body_service/service_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_text.dart';

void showDropdown(BuildContext context) {
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
                  ValueItem(label: 'Dent Repair', value: 1),
                  ValueItem(label: 'Scratch Removal', value: 2),
                  ValueItem(label: 'Paint Touch-Up', value: 3),
                  ValueItem(label: 'Body Panel Replacement', value: 4),
                  ValueItem(label: 'Rust Treatment', value: 5),
                  ValueItem(label: 'Body Polishing', value: 6),
                  ValueItem(label: 'Body Alignment', value: 7),
                  ValueItem(label: 'Windshield Repair/Replacement', value: 8),
                  ValueItem(label: 'Bumper Repair/Replacement', value: 9),
                  ValueItem(label: 'Frame Straightening', value: 10),
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
              context.read<BodyBloc>().add(BodyServiceAddingButtonPressed(
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
