import 'package:flutter/material.dart';

class FilterColorChip extends StatefulWidget {
  final String text;
  final Function(String, bool) onSelected;
  final bool? initValue;

  const FilterColorChip({
    required this.text,
    required this.onSelected,
    this.initValue,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterColorChip> createState() => _FilterColorChipState();
}

class _FilterColorChipState extends State<FilterColorChip> {
  bool selected = false;

  @override
  void initState() {
    if (widget.initValue != null) selected = widget.initValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Text label = Text(
      widget.text,
      style: const TextStyle(
        fontSize: 12.0,
      ),
    );

    return FilterChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: label,
      selected: selected,
      onSelected: (bool value) {
        setState(() {
          selected = value;
        });
        widget.onSelected(widget.text, value);
      },
    );
  }
}
