import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

typedef void OnWFDropDownChangeCallback<T>(BuildContext context, T item);

class WFDropdownItem<T> {
  final T value;
  final String label;
  final Key key;
  final bool disabled;

  WFDropdownItem({
    required this.value,
    required this.label,
    required this.key,
    this.disabled = false,
  });
}

class WFDropdownField<T> extends StatelessWidget {
  final List<WFDropdownItem<T>> items;
  final T? selectedValue;
  final OnWFDropDownChangeCallback<T> onChanged;

  WFDropdownField({
    required this.items,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        buttonHeight: 30,
        icon: Icon(Icons.expand_more_outlined),
        buttonPadding: EdgeInsets.only(right: 10),
        buttonWidth: double.infinity,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 0),
          color: Theme.of(context).colorScheme.primary,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.1,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<T>(
                  value: item.value,
                  key: item.key,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/languages/${item.label}',
                          width: 15,
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          this.onChanged(context, value!);
        },
      ),
    );
  }
}
