import 'package:flutter/material.dart';

class TipsCalculator extends StatefulWidget {
  TipsCalculator({this.title});

  final String title;

  @override
  _TipsCalculatorState createState() => _TipsCalculatorState();
}

class _TipsCalculatorState extends State<TipsCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),

      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(

              ),
            )
          ],
        ),
      ),
    );
  }
}
