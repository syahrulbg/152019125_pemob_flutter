import 'package:flutter/material.dart';

class MathPage extends StatefulWidget {
  const MathPage({Key? key}) : super(key: key);

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  List<String> shapes = ['Keliling', 'Luas'];
  List<String> shapes2 = ['Keliling', 'Luas'];
  List<String> shapes3 = ['Keliling', 'Luas'];
  String currentShape = '';
  String currentShape2 = '';
  String currentShape3 = '';
  String result = '0';
  String result2 = '0';
  String result3 = '0';
  double width = 0;
  double height = 0;
  double r = 0;
  double sisi = 0;

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController rController = TextEditingController();
  final TextEditingController sisiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    result = '0';
    currentShape = 'Keliling';
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
    result2 = '0';
    currentShape2 = 'Keliling';
    rController.addListener(updateR);
    result3 = '0';
    currentShape3 = 'Keliling';
    sisiController.addListener(updateSisi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        title: Row(
          children: [SizedBox(width: 10), Text('Math Area')],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  //dropdown
                  DropdownButton<String>(
                      value: currentShape,
                      items: shapes.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 24.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (shape) {
                        setState(() {
                          currentShape = shape ?? 'Keliling';
                        });
                      }),
                  //width
                  AreaTextField(widthController, 'Width'),
                  //height
                  AreaTextField(heightController, 'Height'),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      child: Text(
                        'Hitung Persegi Panjang',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: calculateArea,
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  DropdownButton<String>(
                      value: currentShape2,
                      items: shapes2.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 24.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (shape2) {
                        setState(() {
                          currentShape2 = shape2 ?? 'Keliling';
                        });
                      }),
                  //width
                  AreaTextField(rController, 'Jari - Jari'),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      child: Text(
                        'Hitung Lingkaran',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: calculateArea2,
                    ),
                  ),
                  Text(
                    result2,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  DropdownButton<String>(
                      value: currentShape3,
                      items: shapes3.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 24.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (shape3) {
                        setState(() {
                          currentShape3 = shape3 ?? 'Keliling';
                        });
                      }),
                  //width
                  AreaTextField(sisiController, 'Sisi'),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      child: Text(
                        'Hitung Persegi',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: calculateArea3,
                    ),
                  ),
                  Text(
                    result3,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ))),
    );
  }

  void calculateArea() {
    double area;

    if (currentShape == 'Luas') {
      area = width * height;
    } else if (currentShape == 'Triangle') {
      area = width * height / 2;
    } else if (currentShape == 'Keliling') {
      area = (2 * width) + (2 * height);
    } else {
      area = 0;
    }
    setState(() {
      result = 'The area is ' + area.toString();
    });
  }

  void calculateArea2() {
    double area2;

    if (currentShape2 == 'Keliling') {
      area2 = 2 * 3.14 * r;
    } else if (currentShape2 == 'Luas') {
      area2 = 3.14 * r * r;
    } else {
      area2 = 0;
    }
    setState(() {
      result2 = 'The area is ' + area2.toString();
    });
  }

  void calculateArea3() {
    double area3;

    if (currentShape3 == 'Keliling') {
      area3 = sisi + sisi + sisi + sisi;
    } else if (currentShape3 == 'Luas') {
      area3 = sisi * sisi;
    } else {
      area3 = 0;
    }
    setState(() {
      result3 = 'The area is ' + area3.toString();
    });
  }

  void updateWidth() {
    setState(() {
      if (widthController.text != '') {
        width = double.parse(widthController.text);
      } else {
        width = 0;
      }
    });
  }

  void updateR() {
    setState(() {
      if (rController.text != '') {
        r = double.parse(rController.text);
      } else {
        r = 0;
      }
    });
  }

  void updateHeight() {
    setState(() {
      if (heightController.text != '') {
        height = double.parse(heightController.text);
      } else {
        height = 0;
      }
    });
  }

  void updateSisi() {
    setState(() {
      if (sisiController.text != '') {
        sisi = double.parse(sisiController.text);
      } else {
        sisi = 0;
      }
    });
  }
}

class AreaTextField extends StatelessWidget {
  AreaTextField(this.controller, this.hint);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w300,
              fontSize: 24.0),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.border_all),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hint,
          ),
        ));
  }
}
