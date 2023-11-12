import 'package:clean_architecture_todo_app/config/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';

class MultipleLinesTextField extends StatefulWidget {
  const MultipleLinesTextField({
    super.key,
    required this.onChanged,
    this.labelText,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.height,
    this.textStyle,
    this.labelStyle,
  });

  final void Function(String) onChanged;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool readOnly;
  final String? initialValue;
  final double? height;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  @override
  State<MultipleLinesTextField> createState() => _MultipleLinesTextFieldState();
}

class _MultipleLinesTextFieldState extends State<MultipleLinesTextField> {

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        expands: widget.height != null,
        minLines: widget.height != null ? null : 1,
        maxLines: widget.height != null ? null : 5,
        style: widget.textStyle ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
        focusNode: focusNode,
        onChanged: (value) {
          widget.onChanged(value);
        },
        onTapOutside: (pointerDown) {
          focusNode.unfocus();
          FocusScope.of(context).unfocus();
        },
        textAlignVertical:  widget.height == null ? null : TextAlignVertical.top,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
          floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
          isDense: true,
          filled: true,
          errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
          fillColor: Theme.of(context).colorScheme.background,
          errorText: widget.errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
                  ?.darkGrey),
        ),
      ),
    );
  }
}
