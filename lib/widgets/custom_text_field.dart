import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {Key? key, this.labelText, this.obscureText, this.validator})
      : super(key: key);

  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState(obscureText, validator);
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? obscureText;
  final String? Function(String?)? _validator;

  _CustomTextFieldState(this.obscureText, this._validator);

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      enableSuggestions: obscureText != null ? !obscureText! : true,
      autocorrect: obscureText != null ? !obscureText! : true,
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
    );
  }
}
