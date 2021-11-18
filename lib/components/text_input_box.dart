import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String label, hintText;

  const MyInputBox({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            width: size.width * 0.8,
            child: Text(label,
                style: GoogleFonts.poppins(
                    color: Colors.black54, fontWeight: FontWeight.w500))),
        Container(
          width: size.width * 0.8,
          height: 40,
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              border: OutlineInputBorder(),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
