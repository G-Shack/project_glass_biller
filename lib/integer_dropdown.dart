import 'package:flutter/material.dart';

class IntegerDropdown extends StatefulWidget {
  final List<int> values;
  final int initialValue;
  final Function(int) onChanged;

  const IntegerDropdown({
    Key? key,
    required this.values,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _IntegerDropdownState createState() => _IntegerDropdownState();
}

class _IntegerDropdownState extends State<IntegerDropdown> {
  int _selectedValue = 0;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E2B46),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButton<int>(
          value: _selectedValue,
          items: widget.values.map((value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(
                ' ${value.toString()}mm',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
            widget.onChanged(value!);
          },
        ),
      ),
    );
  }
}
