import 'package:clean_architecture_todo_app/config/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  const DateTextField(
      {Key? key,
      required this.onChanged,
      required this.labelText,
      this.errorText,
      this.firstDate,
      this.lastDate,
      this.readOnly = false,
      this.textStyle,
      this.labelStyle,
      this.date})
      : super(key: key);

  final void Function(DateTime) onChanged;
  final String? labelText;
  final String? errorText;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? date;
  final bool readOnly;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  String _selectedDate = '';
  bool _isDateSelected = false;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _isDateSelected = widget.date != null;
    if (_isDateSelected) {
      _selectedDate = DateFormat.yMMMMd("en_US").format(widget.date!);
      textEditingController.text = _selectedDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      style: widget.textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
      onTap: () {
        focusNode.unfocus();
        FocusScope.of(context).unfocus();
        if (!widget.readOnly) {
          _selectDate(context);
        }
      },
      onTapOutside: (details) {
        focusNode.unfocus();
        FocusScope.of(context).unfocus();
      },
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ?? Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
        isDense: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
                Theme.of(context).extension<CustomColorsExtension>()!.darkGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
            Theme.of(context).extension<CustomColorsExtension>()!.darkGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
            Theme.of(context).extension<CustomColorsExtension>()!.darkGrey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
            Theme.of(context).extension<CustomColorsExtension>()!.darkGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:
            Theme.of(context).extension<CustomColorsExtension>()!.darkGrey,
          ),
        ),
        hintStyle: TextStyle(
            color: Theme.of(context)
                .extension<CustomColorsExtension>()
                ?.lightGrey),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = widget.date ?? DateTime.now();
    DateTime lastDate = widget.lastDate ?? DateTime(2500);

    final DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: widget.firstDate ?? DateTime(1950),
      lastDate: lastDate,
      initialDate: initialDate,
    );

    if (dateTime != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(dateTime);
        _isDateSelected = true;
        textEditingController.text = _selectedDate;
        widget.onChanged(dateTime);
      });
    }
  }
}
