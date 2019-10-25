import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoCupertinoPicker(),
    );
  }
}

class DemoCupertinoPicker extends StatefulWidget {
  @override
  _DemoCupertinoPickerState createState() => _DemoCupertinoPickerState();
}

class _DemoCupertinoPickerState extends State<DemoCupertinoPicker> {
  int _selectedTimeSlot = 0;
  String timeSlot = 'Chọn giờ';
  final List<String> items = [
    "08h00-09h00",
    "09h00-10h00",
    "10h00-11h00",
    "14h00-15h00",
    "15h00-16h00",
    "16h00-17h00",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Cupertino Picker'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('$timeSlot'),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: FlatButton(
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 500),
                        child: CupertinoPicker(
                          magnification: 1.0,
                          itemExtent: 50,
                          backgroundColor: CupertinoColors.white,
                          useMagnifier: true,
                          onSelectedItemChanged: (int index) {
                            if (mounted) {
                              setState(() {
                                _selectedTimeSlot = index;
                                timeSlot = items[_selectedTimeSlot];
                              });
                              print(items[_selectedTimeSlot]);
                            }
                          },
                          children:
                              List<Widget>.generate(items.length, (int index) {
                            return Center(
                              child: Text(items[index]),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
                child: Text('Chọn giờ'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
