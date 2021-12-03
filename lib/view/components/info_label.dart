import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  const InfoLabel({required this.title, required this.label, Key? key})
      : super(key: key);

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
