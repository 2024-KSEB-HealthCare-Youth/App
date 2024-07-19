import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: 0.6,
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontFamily: 'Nobile',
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
            color: Color(0xFF191C3D),
            fontSize: 18,
            fontFamily: 'Abhaya Libre',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
