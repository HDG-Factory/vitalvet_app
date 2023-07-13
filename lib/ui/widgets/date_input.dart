import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  DateInput({Key? key}) : super(key: key);

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _date,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_rounded),
          border: OutlineInputBorder(),
          labelText: 'Fecha'
        ),
        onTap: () async {
          DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
          if(pickeddate != null){
            setState(() {
              _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
            });
          }
        },
      ),
    );
  }
}