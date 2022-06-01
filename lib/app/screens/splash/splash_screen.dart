import 'package:flutter/material.dart';
import 'package:projects/app/screens/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ElevatedButton(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/splashIcon.png',
              width: 100,
              height: 100,
            ),
            const Text(
              'Ma\nCalculatrice',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, homeScreen);
      },
      style: ElevatedButton.styleFrom(primary: Colors.white),
    ));
  }
}
