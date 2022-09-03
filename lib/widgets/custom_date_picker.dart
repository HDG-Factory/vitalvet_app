import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? labelText;
  final String? Function(String?)? validator;

  const CustomDatePicker(
      {Key? key, this.labelText, this.validator, this.fieldController})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() =>
      _CustomDatePickerState(validator, fieldController);
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  FocusNode fieldFocusNode = FocusNode();
  final TextEditingController? fieldController;
  final String? Function(String?)? _validator;
  final date = '';
  late TextEditingController _textController;
  Color _borderColor = Colors.blue.withOpacity(0.7);
  BorderRadius _borderRadius = BorderRadius.circular(20.0);
  double _borderWidth = 1.5;
  double _borderPadding = 1.5;

  _CustomDatePickerState(this._validator, this.fieldController);

  @override
  void initState() {
    super.initState();
    _textController = fieldController ?? TextEditingController();

    fieldFocusNode.addListener(() {
      setState(() {
        _borderColor = fieldFocusNode.hasFocus
            ? Colors.blue
            : Colors.blue.withOpacity(0.7);
        _borderRadius = fieldFocusNode.hasFocus
            ? BorderRadius.circular(21.0)
            : BorderRadius.circular(20.0);
        _borderWidth = fieldFocusNode.hasFocus ? 3 : 1.5;
        _borderPadding = fieldFocusNode.hasFocus ? 0 : 1.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_borderPadding),
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
      child: TextFormField(
        focusNode: fieldFocusNode,
        controller: _textController,
        validator: _validator,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: widget.labelText,
          border: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.calendar_today),
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _textController.text = picked.toString();
      });
    }
  }
}
