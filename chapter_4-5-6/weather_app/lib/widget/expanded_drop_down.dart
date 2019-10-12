import 'package:flutter/material.dart';

/// This is an almost exact replica of the built-in
/// DropDownFormField. There's a bug in the original
/// Widget that causes the input value to expand furhter than the
/// input field, because it needs to be wrapped in an `Expanded`.
class DropDownExpanded<T> extends FormField<T> {
  final bool isExpanded;
  final initialValue;

  DropDownExpanded({
    this.isExpanded,
    this.initialValue,
    this.onChanged,
    Key key,
    T value,
    @required List<DropdownMenuItem<T>> items,
    InputDecoration decoration = const InputDecoration(),
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    Widget hint,
  })  : assert(decoration != null),
        super(
            key: key,
            onSaved: onSaved,
            initialValue: value,
            validator: validator,
            builder: (FormFieldState<T> field) {
              final InputDecoration effectiveDecoration =
                  decoration.applyDefaults(Theme.of(field.context).inputDecorationTheme);
              return InputDecorator(
                decoration: effectiveDecoration.copyWith(errorText: field.errorText),
                isEmpty: value == null,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    isDense: true,
                    value: value,
                    items: items,
                    hint: hint,
                    isExpanded: isExpanded,
                    onChanged: field.didChange,
                  ),
                ),
              );
            });

  /// Called when the user selects an item.
  final ValueChanged<T> onChanged;

  @override
  FormFieldState<T> createState() => _DropdownButtonFormFieldState<T>();
}

class _DropdownButtonFormFieldState<T> extends FormFieldState<T> {
  @override
  DropDownExpanded<T> get widget => super.widget;

  @override
  void didChange(T value) {
    super.didChange(value);
    if (widget.onChanged != null) widget.onChanged(value);
  }
}
