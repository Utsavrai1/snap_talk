import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final ValueNotifier<int> genderSelected;

  const GenderSelector({super.key, required this.genderSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Gender',
        ),
        ValueListenableBuilder(
          valueListenable: genderSelected,
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              addRadioButton(0, 'Male', genderSelected),
              addRadioButton(1, 'Female', genderSelected),
            ],
          ),
        ),
      ],
    );
  }

  Row addRadioButton(
      int btnValue, String title, ValueNotifier<int> genderSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.green,
          value: btnValue,
          groupValue: genderSelected.value,
          onChanged: (val) {
            genderSelected.value = val ?? 0;
          },
        ),
        Text(title)
      ],
    );
  }
}
