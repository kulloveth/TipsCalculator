import 'package:flutter/material.dart';

class TipsCalculator extends StatefulWidget {
  TipsCalculator({this.title});

  final String title;

  @override
  _TipsCalculatorState createState() => _TipsCalculatorState();
}

class _TipsCalculatorState extends State<TipsCalculator> {
  final double tip = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 20.0,left: 40.0,right: 40.0),
                child: Column(
                  children: [Text('Total Per Person'), Text('\$ $tip')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
