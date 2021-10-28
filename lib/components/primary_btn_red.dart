import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final Widget child;

  const PrimaryBtn({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(232, 76, 79, 1)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ))),
        child: Container(
          height: size.height * 0.06,
          width: size.width * 0.6,
          alignment: Alignment.center,
          child: child,
        ));
  }
}
