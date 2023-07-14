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
      height: 60,
      width: 280,
      child: TextField(
        controller: _date,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_today_rounded),
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