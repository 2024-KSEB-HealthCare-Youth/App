import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: 0.6,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontFamily: 'Nobile',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
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
