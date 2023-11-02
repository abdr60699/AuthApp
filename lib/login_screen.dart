import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'Components/reusable_widget.dart';
import 'package:local_auth/local_auth.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocalAuthentication authentication = LocalAuthentication();

  Future<void> loginWithBio(context, int method) async {
    try {
      final bool _hasBio = await authentication.canCheckBiometrics ||
          await authentication.isDeviceSupported();

      if (_hasBio) {
        final bool auth = await authentication.authenticate(
            localizedReason: 'Authenticate Yourself',
            options: AuthenticationOptions(
                useErrorDialogs: true,
                biometricOnly: method == 1 ? true : false));

        if (auth) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        }
      }
    } catch (e) {
      print('Error ===>> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3949ab),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableButton(
                  btnTitle: 'Login 1',
                  onPress: () {
                    loginWithBio(context, 1);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableButton(
                  btnTitle: 'Login 2',
                  onPress: () {
                    loginWithBio(context, 2);
                  }),
            ),
          ],
        ));
  }
}
