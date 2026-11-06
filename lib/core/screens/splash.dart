import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 232, 232),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 270),
              SvgPicture.asset("assets/images/Logo.svg"),
              SizedBox(height: 35),
              Image.asset("assets/images/Tagline.png"),
              Image.asset("assets/images/Edition Pill Badge_margin.png"),
              SizedBox(height: 220),
              Image.asset('assets/images/Label_margin.png'),

              Image.asset('assets/images/Version.png'),
            ],
          ),
        ),
      ),
    );
  }
}
