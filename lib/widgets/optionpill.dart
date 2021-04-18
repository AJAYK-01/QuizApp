import 'package:flutter/material.dart';

class OptionPill extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Function(int index) onTap;
  final int index;
  final String option;

  const OptionPill(
      {Key key,
      this.color = Colors.grey,
      this.icon = const Icon(Icons.check),
      this.onTap,
      this.index,
      this.option})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 14, left: 30, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: color, width: 2)),
        child: Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: Text(option ?? "OptionText"),
              flex: 16,
            ),
            Expanded(
              child: icon,
              flex: 2,
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
