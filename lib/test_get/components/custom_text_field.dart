import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText(
      {super.key,
      required this.icon,
      required this.label,
      required this.isPassword});

  final IconData icon;
  final String label;
  final bool isPassword;

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        child: Theme(
          data: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.black87,
                ),
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            // initialValue: 'Jhone williams',
            obscureText: widget.isPassword ? isShow : false,
            style: TextStyle(
                fontSize: 16,
                fontFamily: GoogleFonts.wendyOne().fontFamily,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0),
              prefixIcon: Icon(widget.icon),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      child: const Icon(Icons.remove_red_eye_outlined),
                      onTap: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                    )
                  : null,
              border: InputBorder.none,
              label: Text(
                widget.label,
                style: TextStyle(
                  fontFamily: GoogleFonts.wendyOne().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
