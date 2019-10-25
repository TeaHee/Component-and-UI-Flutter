import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPickerDateMonthYear(),
    );
  }
}

class DemoPickerDateMonthYear extends StatefulWidget {
  @override
  _DemoPickerDateMonthYearState createState() =>
      _DemoPickerDateMonthYearState();
}

class _DemoPickerDateMonthYearState extends State<DemoPickerDateMonthYear> {
  String selectedDate = "Chọn ngày sinh";
  var datePicker = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var dateChange = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Picker Date-Month-Year'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('$selectedDate'),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: FlatButton(
                onPressed: () => showChangeBirthday(),
                child: Text('Chọn ngày'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showChangeBirthday() {
    DatePicker.showDatePicker(context,
        dateFormat: 'dd-MM-yyyy',
        minDateTime: DateTime(1950, 1, 1),
        maxDateTime: DateTime(2020, 12, 31),
        onConfirm: (DateTime dateTime, List<int> selectedIndex) {
      setState(() {
        // print(new DateFormat('dd-MM-yyyy').format(dateTime));
        datePicker = DateFormat('dd-MM-yyyy').format(dateTime);
        // print(datePicker.split('-'));
        selectedDate = datePicker;
      });
    }, onChange: (DateTime dateTime, List<int> selectedIndex) {
      dateChange = DateFormat('dd-MM-yyyy').format(dateTime);
    });
  }
}
