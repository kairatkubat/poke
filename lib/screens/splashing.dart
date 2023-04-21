import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon/screens/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    
    super.initState();
  Future.delayed(Duration(seconds: 3)).then((value) {
    Navigator.pushReplacementNamed(context, HomePage.routName);
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("lib/images/poke.png"), width: 200,),
            SizedBox(height: 50,),
            SpinKitSquareCircle(
          color: Colors.yellow,
          size: 50.0,
            )

          ],
        ),
      ),
    );
  }
}