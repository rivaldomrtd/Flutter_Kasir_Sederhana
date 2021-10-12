import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "1461900135", home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController totalt = TextEditingController();
  TextEditingController jumlaht = TextEditingController();
  TextEditingController kembaliant = TextEditingController();
  String _chosenValue = "Print";
  final longString = '''

  Foto Copy 
  Hitam Putih: 100/lbr

  Print
  Hitam Putih: 100/lbr
  Bewarna: 250/lbr
''';
  String total = " ", jumlah = "";
  int a = 0, b = 0, c = 0, d = 0, e = 0;
  final TextEditingController hitam = TextEditingController(
    text: '',
  );
  final TextEditingController bewarna = TextEditingController(
    text: '',
  );
  final TextEditingController uang = TextEditingController(
    text: '',
  );
  void totalbayar() {
    if (_chosenValue == "Print") {
      a = int.parse(hitam.text);
      b = int.parse(bewarna.text);
      c = (a * 100) + (b * 250);
      totalt.text = c.toString();
    } else if (_chosenValue == "Fotocopy") {
      a = int.parse(hitam.text);
      c = a * 100;
      totalt.text = c.toString();
    }
  }

  void kembalian() {
    d = int.parse(uang.text);
    e = d - c;
    kembaliant.text = e.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Val00s')),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "Jenis",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Container(
                      width: 100,
                      child: DropdownButton<String>(
                        value: _chosenValue,
                        style: TextStyle(color: Colors.black),
                        items: <String>[
                          'Print',
                          'Fotocopy',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Pilih",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 5,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _chosenValue = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Text(
                            "Hitam Putih",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          child: TextField(
                            decoration: new InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: ""),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]'))
                            ],
                            controller: hitam,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Container(
                      width: 50,
                      child: Text(
                        "lembar",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Text(
                            "Bewarna",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          child: TextField(
                            decoration: new InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: ""),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]'))
                            ],
                            controller: bewarna,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Container(
                      width: 50,
                      child: Text(
                        "lembar",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                      left: 20,
                    )),
                    RaisedButton(
                      child: Text('Hitung Total Bayar'),
                      onPressed: () {
                        totalbayar();
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            "Total Bayar",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: TextField(
                            showCursor: true,
                            textAlign: TextAlign.center,
                            controller: totalt,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                )),
                            readOnly: true,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            "Jumlah Uang",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "",
                                hintText: "Rp."),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.]'))
                            ],
                            controller: uang,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            "Jumlah",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: TextField(
                            showCursor: true,
                            textAlign: TextAlign.center,
                            controller: kembaliant,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                )),
                            readOnly: true,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    RaisedButton(
                      child: Text('Hitung Kembalian'),
                      onPressed: () {
                        kembalian();
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                      left: 20,
                    )),
                    Column(
                      children: <Widget>[
                        Text(
                          "Keterangan Harga",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14),
                        ),
                        Container(
                            width: 200,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.black12,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  longString,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
