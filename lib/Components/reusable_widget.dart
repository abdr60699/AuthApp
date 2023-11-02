import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.btnTitle, this.onPress});

  final String? btnTitle;
  final Function()? onPress;

  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        hover = value;
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: const Color(0xfffbfbfb)),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            btnTitle.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
