import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipsCalculator extends StatefulWidget {
  TipsCalculator({this.title});

  final String title;

  @override
  _TipsCalculatorState createState() => _TipsCalculatorState();
}

class _TipsCalculatorState extends State<TipsCalculator> {
   int tipPerPerson = 0;
  int tip = 0;
  double billAmount = 500.0;
  int splitValue = 0;
  double _sliderValue = 15.0;
  final myController = TextEditingController();

  void _refreshSlider(double newValue) {
    setState(() {
      billAmount = double.parse(myController.text);
      _sliderValue = newValue;
      tip = (billAmount * (newValue / 100.0)).round();
      tipPerPerson = (tip/splitValue).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade300),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                  child: Column(
                    children: [
                      Text('Total Per Person'),
                      Text('\$ $tipPerPerson')
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Bill Amount'), Text('\$ $billAmount')],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text('Split'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 50.0,
                            ),
                            FlatButton(
                                color: Colors.blue,
                                minWidth: 0,
                                child: Text('+'),
                                onPressed: () {
                                  setState(() {
                                    splitValue++;
                                  });
                                }),
                          ],
                        ),
                        Text('$splitValue'),
                        FlatButton(
                            color: Colors.blue,
                            minWidth: 0,
                            child: Text('-'),
                            onPressed: () {
                              setState(() {
                                splitValue--;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(child: Text('Tip')),
                        Center(
                            child: Text(
                              '\$ $tip',
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.blue,
                        thumbColor: Colors.blue,
                        overlayColor: Color(0x29EB1555),
                        valueIndicatorColor: Colors.blue,
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Column(
                        children: [
                          Text(_sliderValue.toStringAsFixed(2)),
                          Slider(
                            value: _sliderValue,
                            onChanged: _refreshSlider,
                            min: 1.0,
                            max: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Bill to Pay'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
