import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WelcomePage extends StatelessWidget {
  String money, dropdownvalue2, dropdownvalue1;
  WelcomePage({
    Key? key,
    required this.money,
    required this.dropdownvalue1,
    required this.dropdownvalue2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แปลงเงิน'), backgroundColor: Colors.pinkAccent),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ListView(
            children: [
              Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('จำนวนเงิน '),
                    subtitle: Text('$money'),
                  )),
              Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('สกุลเงิน'),
                    subtitle: Text('$dropdownvalue1'),
                  )),
              Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('สกุลเงินที่แปลง'),
                    subtitle: Text('$dropdownvalue2'),
                  )),
              Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                      title: Text('เงินที่ได้'),
                      subtitle: Text('' +
                          Numberadd(dropdownvalue1, dropdownvalue2,
                                  double.parse(money))
                              .toString()))),
            ],
          ),
        ),
      ),
    );
  }

  double Numberadd(dropdownvalue1, dropdownvalue2, double m) {
    double total = 0;
    if (dropdownvalue1 == 'USD' && dropdownvalue2 == 'THB') {
      total += m * 33.17;
    } else if (dropdownvalue1 == 'USD' && dropdownvalue2 == 'JPY') {
      total += m * 115.62;
    } else if (dropdownvalue1 == 'THB' && dropdownvalue2 == 'USD') {
      total += m * 0.030;
    } else if (dropdownvalue1 == 'THB' && dropdownvalue2 == 'JPY') {
      total += m * 3.49;
    } else if (dropdownvalue1 == 'JPY' && dropdownvalue2 == 'USD') {
      total += m * 0.0086;
    } else if (dropdownvalue1 == 'JPY' && dropdownvalue2 == 'THB') {
      total += m * 0.29;
    }
    return total;
  }
}
