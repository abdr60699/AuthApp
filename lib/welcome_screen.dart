import 'package:auth/Components/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3949ab),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              totalRepeatCount: 5,
              pause: Duration(seconds: 3),
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(' Temple Ray Tech',
                    textStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ReusableButton(
            btnTitle: 'Logout',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
