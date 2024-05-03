

import 'package:custom_clock/clock/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeClock extends StatefulWidget {
  const HomeClock({super.key});

  @override
  State<HomeClock> createState() => _HomeClockState();
}

class _HomeClockState extends State<HomeClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
       body: Container(
         alignment: Alignment.center,
         color: Colors.white70,
         child: ClockView(),

       )
    );
  }
}
