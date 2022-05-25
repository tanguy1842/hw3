import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController _money = TextEditingController();
  String _dropdownvalue1 = 'USD';
  String _dropdownvalue2 = 'THB';
  var items1 = [
    'USD',
    'THB',
    'JPY',
  ];
  var items2 = [
    'USD',
    'THB',
    'JPY',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('แปลง ค่าสกุลเงิน'), backgroundColor: Colors.greenAccent),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _money,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'จำนวนเงิน',
                    labelStyle: TextStyle(fontSize: 25)),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'สกุลเงิน',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: _dropdownvalue1,

                    // Down Arrow Icon

                    // Array list of items
                    items: items1.map((String items1) {
                      return DropdownMenuItem(
                        value: items1,
                        child: Text(items1, style: TextStyle(fontSize: 20)),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue1) {
                      setState(() {
                        _dropdownvalue1 = newValue1!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('สกุลเงินที่ต้องการเปลี่ยน',
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: _dropdownvalue2,

                    // Down Arrow Icon

                    // Array list of items
                    items: items2.map((String items2) {
                      return DropdownMenuItem(
                        value: items2,
                        child: Text(items2, style: TextStyle(fontSize: 20)),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue1) {
                      setState(() {
                        _dropdownvalue2 = newValue1!;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(
                        money: _money.text,
                        dropdownvalue1: _dropdownvalue1,
                        dropdownvalue2: _dropdownvalue2,
                      ),
                    ),
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                      'แปลงสกุลเงิน',
                      style: TextStyle(fontSize: 20),
                    )))
          ],
        ),
      ),
    );
  }
}
