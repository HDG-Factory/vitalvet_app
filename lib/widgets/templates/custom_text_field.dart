import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vitalvet_app/utils/screen_size.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? labelText;
  final bool? obscureText;
  final bool? multiLine;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? onlyText;
  final bool? onlyNumbers;

  const CustomTextField(
      {Key? key,
      this.labelText,
      this.obscureText,
      this.validator,
      this.fieldController,
      this.multiLine,
      this.readOnly,
      this.onlyNumbers,
      this.onlyText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState(obscureText,
      validator, fieldController, multiLine, readOnly, onlyNumbers, onlyText);
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode fieldFocusNode = FocusNode();
  final TextEditingController? fieldController;
  bool? obscureText;
  final bool? multiLine;
  final String? Function(String?)? _validator;
  final bool? readOnly;
  final bool? onlyText;
  final bool? onlyNumbers;
  Color _borderColor = Colors.blue.withOpacity(0.7);
  BorderRadius _borderRadius = BorderRadius.circular(20.0);
  double _borderWidth = 1.5;
  double _borderPadding = 1.5;

  _CustomTextFieldState(this.obscureText, this._validator, this.fieldController,
      this.multiLine, this.readOnly, this.onlyNumbers, this.onlyText);

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }

  @override
  void initState() {
    super.initState();

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
        minLines: 1,
        maxLines: multiLine == true ? 10 : 1,
        keyboardType: multiLine == true
            ? TextInputType.multiline
            : onlyNumbers == true
                ? TextInputType.number
                : null,
        focusNode: fieldFocusNode,
        controller: fieldController,
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        enableSuggestions: obscureText != null ? !obscureText! : true,
        autocorrect: obscureText != null ? !obscureText! : true,
        inputFormatters: (onlyText == true)
            ? [FilteringTextInputFormatter.deny(RegExp("[0-9]"))]
            : (onlyNumbers == true)
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
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
          suffixIcon: obscureText != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(
                      obscureText! ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,
                    ),
                    onPressed: _toggle,
                  ),
                )
              : null,
        ),
        validator: _validator,
      ),
    );
  }
}
