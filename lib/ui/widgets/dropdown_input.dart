import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  DropdownInput({Key? key}) : super(key: key);

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  List<String> species = ['Perro', 'Gato', 'Loro', 'Conejo', 'Pez'];
  String? selectedItem = 'Perro';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButton<String>(
        value: selectedItem,
        items: species.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item)
            ))
          .toList(),
          onChanged: (item) => setState(() => selectedItem = item),
      ),
    );
  }
}