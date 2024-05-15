import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/services/interior_service/bloc/interior_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_text.dart';

void showDropdownForInterior(BuildContext context) {
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
                  ValueItem(label: 'Interior Detailing', value: 1),
                  ValueItem(label: 'Upholstery Cleaning', value: 2),
                  ValueItem(label: 'Carpet Shampooing', value: 3),
                  ValueItem(label: 'Leather/Vinyl Repair', value: 4),
                  ValueItem(label: 'Odor Removal', value: 5),
                  ValueItem(label: 'Dashboard Restoration', value: 6),
                  ValueItem(label: 'Seat Repair/Replacement', value: 7),
                  ValueItem(label: 'Headliner Repair', value: 8),
                  ValueItem(label: 'Interior Panel Restoration', value: 9),
                  ValueItem(
                      label: 'Sound System Installation/Repair', value: 10),
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
              context.read<InteriorBloc>().add(
                  InteriorServiceAddingButtonPressed(
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
