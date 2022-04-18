import 'package:flutter/material.dart';
import 'package:skripsi_rania/menu/menu_utama.dart';

class TambahUser extends StatefulWidget {
  const TambahUser({Key? key}) : super(key: key);

  @override
  State<TambahUser> createState() => _TambahUserState();
}

class _TambahUserState extends State<TambahUser> {
  var _namaController = TextEditingController();
  var _userController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _telpController = TextEditingController();
  var _jabatanController = TextEditingController();

  String dropdownValue = 'Admin';
  final GlobalKey<FormState> _tambahKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah User",
        ),
        backgroundColor: Color(0xffA1616A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
                        "Jenis User",
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
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Admin',
                            'Manajer',
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
                        "Nama",
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _namaController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Nama USer",
                              hintStyle: TextStyle(fontSize: 14),
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
                        "Email User",
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Email User",
                              hintStyle: TextStyle(fontSize: 14),
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
                        "Password",
                        //style: ThemeFonts.tambah,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Password",
                              hintStyle: TextStyle(fontSize: 14),
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
                        "No.Telp",
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _telpController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan No. Telp",
                              hintStyle: TextStyle(fontSize: 14),
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
                        "Jabatan",
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: TextFormField(
                          controller: _jabatanController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Wajib diisi ';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Masukkan Jabatan",
                              hintStyle: TextStyle(fontSize: 14),
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
                          _validasi1(context);
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 24,
            title: const Text(
              "Tambah User",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "NunitoSans"),
            ),
            content: const Text(
              "Apakah data user yang anda tambahkan sudah sesuai? ",
              style: TextStyle(fontFamily: "NunitoSans"),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xffE5E5E5)),
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text("Batal",
                    style: TextStyle(
                        fontFamily: "NunitoSans", color: Colors.black)),
              ),
              TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xffDF9A9A)),
                  onPressed: () {
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 2;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                    final snackBar = SnackBar(
                      content: const Text('User berhasil ditambahkan!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('OK',
                      style: TextStyle(
                          fontFamily: "NunitoSans", color: Colors.white)))
            ],
          ));
}
