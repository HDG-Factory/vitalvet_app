import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final List<String>? items;
  final String? label;
  final double? iHeight;
  final double? iWidth;

  DropdownInput({
    Key? key,
    this.items,
    this.label = 'Nombre', 
    this.iHeight = 60,
    this.iWidth = 280,
    }) : super(key: key);

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  String? selectedItem = '';

  @override
  Widget build(BuildContext context) {
    selectedItem = widget.items?[0];

    return SizedBox(
      height: widget.iHeight,
      width: widget.iWidth,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
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
          labelText: widget.label
        ),
        value: selectedItem,
        focusColor: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        items: widget.items?.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item)
            ))
          .toList(),
          onChanged: (item) => setState(() => selectedItem = item),
      ),
    );
  }
}