import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skripsi_rania/laporan/view_laporan.dart';

class AsetHabis extends StatefulWidget {
  const AsetHabis({Key? key}) : super(key: key);

  @override
  State<AsetHabis> createState() => _AsetHabisState();
}

class _AsetHabisState extends State<AsetHabis> {
  var _todoDateController = TextEditingController();
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

  var _todoDateController2 = TextEditingController();
  DateTime _dateTime2 = DateTime.now();
  _selectDate2(BuildContext context) async {
    var _pickedDate2 = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: _dateTime2,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_pickedDate2 != null) {
      setState(() {
        _dateTime2 = _pickedDate2;
        _todoDateController2.text =
            DateFormat('dd-MM-yyyy').format(_pickedDate2);
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Laporan Aset"),
          backgroundColor: Color(0xffA1616A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
        ),
        body: SafeArea(
          bottom: true,
          top: true,
          child: SingleChildScrollView(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Text(
                    "Jangka Waktu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tanggal Awal"),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width ,
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
                                vertical: 2,
                                horizontal: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xffA1616A),
                                ),
                              ),
                            ),
                            cursorColor: Color(0xffA1616A),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text("Tanggal AKhir"),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width ,
                          child: TextFormField(
                            readOnly: true,
                            controller: _todoDateController2,
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
                                    _selectDate2(context);
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: 55,
                      width: 200,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Laporan();
                          }));
                        },
                        icon: Icon(Icons.search),
                        label: Text(
                          "Lihat Laporan",
                          style: TextStyle(fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffDF9A9A),
                            onPrimary: Colors.white),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 10),
                    child: Container(
                      height: 55,
                      width: 200,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.download),
                        label: Text(
                          "Unduh Laporan",
                          style: TextStyle(fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffDF9A9A),
                            onPrimary: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}