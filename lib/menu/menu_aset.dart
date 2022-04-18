import 'package:flutter/material.dart';
import 'package:skripsi_rania/kategori/aset_elektronik.dart';
import 'package:skripsi_rania/kategori/aset_kendaraan.dart';
import 'package:skripsi_rania/kategori/aset_property.dart';
import 'package:skripsi_rania/asset/form_asset.dart';

class AsetMenu extends StatefulWidget {
  const AsetMenu({ Key? key }) : super(key: key);

  @override
  State<AsetMenu> createState() => _AsetMenuState();
}

class _AsetMenuState extends State<AsetMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: 

      AppBar(
        title: Text("Asset Management", style: TextStyle(
          color: Colors.white
        ),),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
                    padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
                    child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PropertyAset();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.home_work_sharp,
                                    size: 70,
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Property",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Nunito",
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Klik untuk lebih lanjut!",
                                          style: TextStyle(fontFamily: "Nunito"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 45, right: 25, left: 25),
                    child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ElektronikAset();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.laptop_mac_outlined,
                                    size: 70,
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Elektronik",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Nunito",
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Klik untuk lebih lanjut!",
                                          style: TextStyle(fontFamily: "Nunito"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(top: 45, right: 25, left: 25, bottom: 10),
                    child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return KendaraanAset();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 70,
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Kendaraan",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Nunito",
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Klik untuk lebih lanjut!",
                                          style: TextStyle(fontFamily: "Nunito"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),

                  
                
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffA1616A),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormAsset();
            }));
          },
          child: Icon(Icons.add_outlined))
      );
  }
}