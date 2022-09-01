import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {Key? key,
      this.labelText,
      this.obscureText,
      this.validator,
      this.fieldController})
      : super(key: key);

  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState(obscureText, validator, fieldController);
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController? fieldController;
  bool? obscureText;
  final String? Function(String?)? _validator;

  _CustomTextFieldState(
      this.obscureText, this._validator, this.fieldController);

  void _toggle() {
    setState(() {
      obscureText = !obscureText!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
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
