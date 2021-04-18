import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String title;
  final double height;
  final Color color;
  final Function() onTap;
  final String fontName;
  final TextStyle style;
  RedButton({
    @required this.title,
    @required this.onTap,
    this.height = 50,
    this.color = Colors.purple,
    this.fontName = 'Poppins',
    this.style = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 2),
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            height: height,
            decoration: BoxDecoration(
              color: Colors.purple[300],
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
                // style: GoogleFonts.getFont(fontName, textStyle: style),
              ),
              elevation: 10,
              onPressed: onTap,
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
