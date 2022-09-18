import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomTextFieldWithSuggestions extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? labelText;
  final List<dynamic>? suggestions;
  final Widget Function(dynamic)? suggestionBuilder;
  final FutureOr<Iterable<dynamic>> Function(String)? suggestionCallback;
  final List<Widget>? actions;
  final bool? readOnly;
  final Color? fillColor;
  final Color? onSuggestionSelectedFillColor;
  final void Function()? onTap;
  final void Function(dynamic)? onSuggestionSelected;
  final void Function(String)? onTextFieldChanged;
  final bool? startShowingSuggestionFillColor;

  const CustomTextFieldWithSuggestions(
      {Key? key,
      this.fieldController,
      this.labelText,
      this.suggestions,
      this.suggestionBuilder,
      this.actions,
      this.readOnly,
      this.suggestionCallback,
      this.onTap,
      this.onSuggestionSelected,
      this.fillColor,
      this.onSuggestionSelectedFillColor,
      this.onTextFieldChanged,
      this.startShowingSuggestionFillColor})
      : super(key: key);

  @override
  State<CustomTextFieldWithSuggestions> createState() => CustomTextFieldWithSuggestionsState(
      fieldController,
      suggestions,
      suggestionBuilder,
      actions,
      readOnly,
      suggestionCallback,
      onTap,
      onSuggestionSelected,
      fillColor,
      onSuggestionSelectedFillColor,
      onTextFieldChanged,
      startShowingSuggestionFillColor);
}

class CustomTextFieldWithSuggestionsState extends State<CustomTextFieldWithSuggestions> {
  FocusNode fieldFocusNode = FocusNode();
  final TextEditingController? fieldController;
  final List<dynamic>? suggestions;
  final Widget Function(dynamic)? suggestionBuilder;
  final FutureOr<Iterable<dynamic>> Function(String)? suggestionCallback;
  final List<Widget>? actions;
  final bool? readOnly;
  final Color? fillColor;
  final Color? onSuggestionSelectedFillColor;
  final void Function()? onTap;
  final void Function(dynamic)? onSuggestionSelected;
  final void Function(String)? onTextFieldChanged;
  Color _borderColor = Colors.blue.withOpacity(0.7);
  BorderRadius _borderRadius = BorderRadius.circular(20.0);
  double _borderWidth = 1.5;
  double _borderPadding = 1.5;
  bool showSuggestionFillColor = false;
  final bool? startShowingSuggestionFillColor;

  CustomTextFieldWithSuggestionsState(
      this.fieldController,
      this.suggestions,
      this.suggestionBuilder,
      this.actions,
      this.readOnly,
      this.suggestionCallback,
      this.onTap,
      this.onSuggestionSelected,
      this.fillColor,
      this.onSuggestionSelectedFillColor,
      this.onTextFieldChanged,
      this.startShowingSuggestionFillColor);

  void toggleSuggestionFillColor() {
    setState(() {
      showSuggestionFillColor = !showSuggestionFillColor;
    });
  }

  @override
  void initState() {
    super.initState();

    if (startShowingSuggestionFillColor != null) {
      showSuggestionFillColor = startShowingSuggestionFillColor!;
    }

    fieldFocusNode.addListener(() {
      setState(() {
        _borderColor = fieldFocusNode.hasFocus ? Colors.blue : Colors.blue.withOpacity(0.7);
        _borderRadius = fieldFocusNode.hasFocus ? BorderRadius.circular(21.0) : BorderRadius.circular(20.0);
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
      child: TypeAheadField(
        suggestionsCallback: suggestionCallback != null
            ? (pattern) {
                List<dynamic> returnedList = [];
                returnedList.addAll(suggestionCallback!(pattern) as List);
                if (actions != null) {
                  returnedList.addAll(actions!);
                }
                return returnedList;
              }
            : (pattern) {
                List<dynamic> returnedList = [];
                if (suggestions != null) {
                  if (suggestions![0] is String) {
                    returnedList.addAll(suggestions!.where((suggestion) => suggestion.toLowerCase().contains(pattern.toLowerCase())));
                  }
                }
                if (actions != null) {
                  returnedList.addAll(actions!);
                }
                return returnedList;
              },
        itemBuilder: (_, item) {
          if (suggestions == null || suggestions!.isEmpty) {
            return const ListTile(
              title: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (suggestionBuilder != null && item is! Widget) {
            return suggestionBuilder!(item);
          } else if (item is Widget) {
            return item as Widget;
          } else if (item is String) {
            return ListTile(
              title: Text(item),
            );
          }
          return const ListTile(
            title: Text('Failed to load resource'),
          );
        },
        onSuggestionSelected: (onSuggestionSelected != null)
            ? (val) {
                onSuggestionSelected!(val);
                showSuggestionFillColor = true;
              }
            : (val) {
                if (fieldController != null && val is String) {
                  fieldController!.text = val;
                }
              },
        getImmediateSuggestions: true,
        hideOnEmpty: true,
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: fieldFocusNode,
          controller: fieldController,
          onChanged: (val) {
            if (showSuggestionFillColor) {
              setState(() {
                showSuggestionFillColor = false;
              });
            }
            if (onTextFieldChanged != null) {
              onTextFieldChanged!(val);
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: (onSuggestionSelectedFillColor != null && showSuggestionFillColor) ? onSuggestionSelectedFillColor : fillColor ?? Colors.white,
            labelText: widget.labelText,
            border: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: (onSuggestionSelectedFillColor != null && showSuggestionFillColor) ? const Icon(Icons.check, color: Colors.green) : null,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
