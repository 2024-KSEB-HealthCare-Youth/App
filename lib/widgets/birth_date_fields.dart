import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class BirthDateFields extends StatelessWidget {
  final TextEditingController monthController;
  final TextEditingController dayController;
  final TextEditingController yearController;

  const BirthDateFields({
    required this.monthController,
    required this.dayController,
    required this.yearController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child:
                CustomTextField(labelText: 'MM', controller: monthController)),
        const SizedBox(width: 10),
        Flexible(
            child: CustomTextField(labelText: 'DD', controller: dayController)),
        const SizedBox(width: 10),
        Flexible(
            child:
                CustomTextField(labelText: 'YYYY', controller: yearController)),
      ],
    );
  }
}
