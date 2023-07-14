import 'package:flutter/material.dart';

class VitalvetInput extends StatelessWidget {
  final String? label;
  final double? iHeight;
  final double? iWidth;
  final IconData? icon;

  const VitalvetInput({
    super.key,
    this.label = 'Nombre', 
    this.iHeight = 60,
    this.iWidth = 280,
    this.icon = Icons.pets});

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minHeight: 60, minWidth: 280, maxHeight: 60),
      height: iHeight,
      width: iWidth,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(icon),              
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 2, 48, 66),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 2, 48, 66),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          labelText: label
        ),
      ),
    );
  }
}