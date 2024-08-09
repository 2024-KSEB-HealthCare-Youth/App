import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign; // Add a textAlign parameter

  const ProfileDetail({
    Key? key,
    required this.label,
    required this.value,
    this.textAlign = TextAlign.start, // Default to start alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: textAlign, // Apply text alignment
            overflow: TextOverflow.ellipsis, // Handle overflow
          ),
        ),
      ],
    );
  }
}
