import 'dart:async';
import 'dart:math';
import 'package:custom_clock/constants.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 300,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: Clockpainter(),
          ),
        ));
  }
}

class Clockpainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillbrush = Paint()..color = NotesColor.lightpurple;

    var outlinebrush = Paint()
      ..color = NotesColor.whites
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centrefillbrush = Paint()..color = NotesColor.whites;

    var Hourbrush = Paint()
      ..shader = RadialGradient(colors: [Colors.pinkAccent, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = NotesColor.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var Minbrush = Paint()
      ..shader = RadialGradient(colors: [Colors.blue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = NotesColor.blacks
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    var Secbrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = NotesColor.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(
      center,
      radius - 40,
      fillbrush,
    );
    canvas.drawCircle(center, radius - 40, outlinebrush);

    var MinHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var MinHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(MinHandX, MinHandY), Minbrush);

    var HourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var HourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(HourHandX, HourHandY), Hourbrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), Secbrush);

    canvas.drawCircle(center, 16, centrefillbrush);

    var OuterCircleRadius = radius;
    var InnerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + OuterCircleRadius * cos(i * pi / 2);
      var y1 = centerX + OuterCircleRadius * sin(i * pi / 2);

      var x2 = centerX + InnerCircleRadius * cos(i * pi / 2);
      var y2 = centerX + InnerCircleRadius * sin(i * pi / 2);
      var dashBrush = Paint();
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
