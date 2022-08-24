import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final String? labelText;
  final String? Function(String?)? validator;

  const CustomDatePicker({Key? key, this.labelText, this.validator})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState(validator);
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final String? Function(String?)? _validator;
  TextEditingController _textController = new TextEditingController();
  final date = '';

  _CustomDatePickerState(this._validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      validator: _validator,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: widget.labelText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.calendar_today),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2028),
    );

    if (picked != null) {
      setState(() {
        _textController.text = picked.toString();
      });
    }
  }
}
