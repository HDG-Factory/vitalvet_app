import 'package:flutter/material.dart';

class PetsList extends StatelessWidget {
  const PetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text('Pet $i'),
          );
        },
      ),
    );
  }
}
