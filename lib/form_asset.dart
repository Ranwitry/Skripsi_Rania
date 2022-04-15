import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:skripsi_rania/menu_aset.dart';

class FormAsset extends StatefulWidget {
  const FormAsset({ Key? key }) : super(key: key);

  @override
  State<FormAsset> createState() => _FormAssetState();
}



class _FormAssetState extends State<FormAsset> {
 bool foto = false;
  bool foto2 = false;
  
  var _todoDateController = TextEditingController();
  var _namaAset = TextEditingController();
  var _masaAset = TextEditingController();
  var _hargaAset = TextEditingController();
  var _picAset = TextEditingController();
  var _emailAset = TextEditingController();
  var _telpAset = TextEditingController();
  var _jabatanAset = TextEditingController();
  var _jenisAset = TextEditingController();
  DateTime _dateTime = DateTime.now();
 
  _selectDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('dd-MM-yyyy').format(_pickedDate);
      });
    }
  }

  String dropdownValue = 'Property';

  File? _image;
  final imgPicker = ImagePicker();
  File? _image2;
  final imgPicker2 = ImagePicker();

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pilihan"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Ambil Gambar"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Ambil Gambar dari Galeri"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> showOptionsDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pilihan"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Ambil Gambar"),
                    onTap: () {
                      openCamera2();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Ambil Gambar dari Galeri"),
                    onTap: () {
                      openGallery2();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    Navigator.of(context).pop();
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera != null) {
        _image = File(imgCamera.path);
        foto = true;
      }
    });
  }

  void openGallery() async {
    Navigator.of(context).pop();
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery != null) {
        _image = File(imgGallery.path);
        foto = true;
      }
    });
  }

  void openCamera2() async {
    Navigator.of(context).pop();
    var imgCamera2 = await imgPicker2.pickImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera2 != null) {
        _image2 = File(imgCamera2.path);
        foto2 = true;
      }
    });
  }

  void openGallery2() async {
    Navigator.of(context).pop();
    var imgGallery2 = await imgPicker2.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery2 != null) {
        _image2 = File(imgGallery2.path);
        foto2 = true;
      }
    });
  }

  final GlobalKey<FormState> _tambahKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Tambah Aset", ),
        backgroundColor: Color(0xffA1616A),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white
          ),
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _tambahKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jenis Asset",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        height: 50,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 30,
                          elevation: 40,
                          //style: ThemeFonts.tambah,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Property',
                            'Elektronik',
                            'Kendaraan'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama Asset",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                           controller: _namaAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Nama Aset",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal Terima",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          readOnly: true,
                          controller: _todoDateController,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Pilih Tanggal",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.date_range,
                                  size: 30,
                                  color: Color(0xffA1616A),
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Masa Aset",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                             controller: _masaAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Masukkan masa aset",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Harga Beli",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                           controller: _hargaAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Masukkan Harga Beli",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User PIC",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _picAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan User PIC",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),

                 Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email PIC",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                           controller: _emailAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Email PIC",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                        
                      ),
                    ]),
              ),
                 Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "No.Telp PIC",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _telpAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Masukkan No.Telp PIC",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
                 Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jabatan PIC",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                           controller: _jabatanAset,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Jabatan PIC",
                               hintStyle: TextStyle(fontSize: 14),
                              //hintStyle: ThemeFonts.tambah,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Color(0xffA1616A),
                                  ))),
                          cursorColor: Color(0xffA1616A),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Gambar Depan: ", 
                    //style: ThemeFonts.tambah2
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: InkWell(
                    onTap: () {
                      showOptionsDialog(context);
                    },
                    child: _image == null
                        ? Center(
                            child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                          ))
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Gambar Belakang : ", 
                    //style: ThemeFonts.tambah2
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: InkWell(
                    onTap: () {
                      showOptionsDialog2(context);
                    },
                    child: _image2 == null
                        ? Center(
                            child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                          ))
                        : Image.file(
                            _image2!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 30),
                    width: 350,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xffDF9A9A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (_tambahKey.currentState!.validate()) {
                          if (foto == true && foto2 == true) {
                            _validasi1(context);
                          } else {
                            _validasi2(context);
                          }
                        }
                      },
                      child: Text(
                        "Tambah",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

  void _validasi1(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 24,
              title: const Text(
                "Tambah Aset",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "NunitoSans"),
              ),
              content: const Text(
                "Apakah data aset yang anda tambahkan sudah sesuai? ",
                style: TextStyle(fontFamily: "NunitoSans"),
              ),
              actions: <Widget>[
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xffE5E5E5)),
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text("Batal",
                      style: TextStyle(
                          fontFamily: "NunitoSans", color: Colors.black)),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffDF9A9A)),
                    onPressed: () {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AsetMenu()),
                      );
                    },
                    child: const Text('OK',
                        style: TextStyle(
                            fontFamily: "NunitoSans", color: Colors.white)))
              ],
            ));
  }

    void _validasi2(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 24,
              title: const Text(
                "Foto harus disi",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "NunitoSans"),
              ),
              content: const Text(
                "Mohon lengkapi data dengan mengisi foto yang diminta",
                style: TextStyle(fontFamily: "NunitoSans"),
              ),
              actions: <Widget>[
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffDF9A9A)),
                    onPressed: () {
                      //int count = 0;
                      Navigator.pop(context);
                    },
                    child: const Text('OK',
                        style: TextStyle(
                            fontFamily: "NunitoSans", color: Colors.white)))
              ],
            ));
  }
