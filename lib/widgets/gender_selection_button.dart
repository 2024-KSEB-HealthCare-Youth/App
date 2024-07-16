import 'package:flutter/material.dart';

class GenderSelectionButton extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelectionButton({
    required this.gender,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onGenderSelected(gender);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedGender == gender ? Colors.blue : Colors.white,
        side: BorderSide(
          color: Colors.black.withOpacity(0.4),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        gender,
        style: TextStyle(
          color: selectedGender == gender
              ? Colors.white
              : Colors.black.withOpacity(0.7),
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
