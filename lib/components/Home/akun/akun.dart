import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

bool _boolImage = false;

List<String> listJurusan = <String>[
  'Mahasiswa',
  'Pelajar',
  'Wiraswasta',
  'Ga Punya Malu',
  'Pengangguran'
];

enum Gender { Male, Female }

List<String> listAngkatan = <String>['Belum Menikah', 'Sudah Menikah'];

class DropdownJurusan extends StatefulWidget {
  const DropdownJurusan({super.key});

  @override
  State<DropdownJurusan> createState() => _DropdownJurusanState();
}

class _DropdownJurusanState extends State<DropdownJurusan> {
  String dropdownValue = listJurusan.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listJurusan.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownAngkatan extends StatefulWidget {
  const DropdownAngkatan({super.key});

  @override
  State<DropdownAngkatan> createState() => _DropdownAngkatanState();
}

class _DropdownAngkatanState extends State<DropdownAngkatan> {
  String angkatanValue = listAngkatan.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: angkatanValue,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        items: listAngkatan.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            angkatanValue = value!;
          });
        });
  }
}

class Biodata extends StatefulWidget {
  const Biodata({super.key});

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  File? imageFile;
  Gender? _character = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          title: Text('Data Diri')),
      body: new ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  )
                  // child: Text(
                  //   'BIODATA',
                  //   style: TextStyle(
                  //     color: Colors.blue[900],
                  //     fontSize: 20,
                  //   ),
                  // ),
                  ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  // style: TextStyle(
                  //   color: Colors.red[900],
                  // ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    fillColor: Colors.grey[300],
                    // hintText: 'Nama Lengkap',
                    labelText: 'Nama Lengkap',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                      fillColor: Colors.grey[300],
                      labelText: 'No KTP'),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Container(
                        // alignment: Alignment.center,
                        child: DropdownJurusan(),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Container(
                        // alignment: Alignment.center,
                        child: DropdownAngkatan(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Pria',
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: Color.fromARGB(255, 58, 58, 58),
                          fontSize: 14,
                        ),
                      ),
                      leading: Radio<Gender>(
                        value: Gender.Male,
                        groupValue: _character,
                        onChanged: (Gender? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Wanita',
                        style: TextStyle(
                          fontFamily: 'Work Sans',
                          color: Color.fromARGB(255, 58, 58, 58),
                          fontSize: 14,
                        ),
                      ),
                      leading: Radio<Gender>(
                        value: Gender.Female,
                        groupValue: _character,
                        onChanged: (Gender? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: imageFile == null
                      ? MaterialButton(
                          color: Color.fromARGB(255, 58, 58, 58),
                          child: Text(
                            "Foto KTP",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _getFromCamera();
                          })
                      : Container(
                          height: 200,
                          width: 200,
                          child: Image.file(
                            imageFile!,
                            fit: BoxFit.contain,
                          ),
                        )),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 58, 58, 58)),
                  child: MaterialButton(
                      // color: Colors.Color(0xFF1DB9C3),
                      child: Text(
                        'Simpan Data',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        _showToast(context);
                      }),
                ),
              ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  _GetFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _boolImage = false;
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Success'),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
