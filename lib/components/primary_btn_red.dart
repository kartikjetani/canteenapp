import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryBtn extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const PrimaryBtn({Key? key, required this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(232, 76, 79, 1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ))),
        child: Container(
          height: size.height * 0.04,
          width: size.width * 0.4,
          alignment: Alignment.center,
          child: child
        ));
  }
}
