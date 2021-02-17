import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = "";
  String _decimal = "0";
  // _decimal = int.parse(_binary, radix: 2).toRadixString(10);

  void _onPressed(int option) {
    if (option == 1) {
      setState(() {
        _binary = _binary + "1";
        _decimal = _binaryToDecimal(_binary).toString();
      });
    } else {
      if (option == 0) {
        setState(() {
          _binary = _binary + "0";
          _decimal = _binaryToDecimal(_binary).toString();
        });
      } else {
        setState(() {
          _binary = "";
          _decimal = "0";
        });
      }
    }
  }

  int _binaryToDecimal(String binary) {
    int decvalue = 0;

    int base = 1;
    int temp = binary.length - 1;

    while (temp >= 0) {
      int lastdigit = int.parse(binary[temp]);
      temp = temp - 1;
      decvalue += lastdigit * base;
      base = base * 2;
    }

    return decvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: Text("Binary -> Decimal")),
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_binary',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                      fontSize: 35),
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_decimal',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#29FF22".replaceAll('#', '0xff'))),
                      fontSize: 35),
                )),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          child: Text("1"),
                          onPressed: () {
                            _onPressed(1);
                          },
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          child: Text("0"),
                          onPressed: () {
                            _onPressed(0);
                          },
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Color(int.parse("#0069C0".replaceAll('#', '0xff'))),
                    onPressed: () {
                      _onPressed(2);
                    },
                    child: Text("Reset",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ))),
              ),
            ),
          ]),
    );
  }
}
