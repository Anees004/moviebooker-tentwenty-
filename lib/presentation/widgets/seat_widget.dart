import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const SeatWidget({Key? key, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}