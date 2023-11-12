import 'package:clean_architecture_todo_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    required this.onChanged,
    required this.labelText,
    this.hintText = '',
    super.key,
    this.errorText,
    this.prefixWidget,
    this.suffixWidget,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.textStyle,
    this.labelStyle,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.initialValue,
    this.autofillHints,
  });

  final void Function(String) onChanged;
  final String hintText;
  final String labelText;
  final String? errorText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String? initialValue;
  final List<String>? autofillHints;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onChanged: (value) {
        widget.onChanged(value);
      },
      focusNode: focusNode,
      onTapOutside: (details) {
        focusNode.unfocus();
        FocusScope.of(context).unfocus();
      },
      autofillHints: widget.autofillHints,
      readOnly: widget.readOnly,
      cursorColor: Theme.of(context)
          .colorScheme.primary.withOpacity(0.5),
      cursorWidth: 1,
      style: widget.textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
        isDense: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        errorText: widget.errorText,
        errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()!
                .darkGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()!
                .darkGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context)
                .colorScheme.primary.withOpacity(0.5),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()!
                .darkGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()!
                .darkGrey,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()
                ?.lightGrey),
        prefixIcon: widget.prefixWidget != null
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: widget.prefixWidget,
              )
            : null,
        suffixIcon: widget.suffixWidget != null ? Padding(
          padding: const EdgeInsets.all(8),
          child: widget.suffixWidget,
        ) : null,
      ),
    );
  }
}
