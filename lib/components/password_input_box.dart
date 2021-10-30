import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInput extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordInput({Key? key, required this.onChanged}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isVisible = true;

  @override
  void initState() {
    _isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            width: size.width * 0.8,
            child: Text("Password",
                style: GoogleFonts.poppins(
                    color: Colors.black54, fontWeight: FontWeight.w500))),
        Container(
          width: size.width * 0.8,
          child: TextField(
            obscureText: _isVisible,
            onChanged: widget.onChanged,
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
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black26,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
