import 'package:flutter/material.dart';
import 'package:skripsi_rania/menu/drawerbar.dart';
import 'package:skripsi_rania/menu/menu_aset.dart';
import 'package:skripsi_rania/menu/menu_laporan.dart';
import 'package:skripsi_rania/menu/menu_reminder.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffA1616A),
        title: Text("Asset Management", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
          bottom: true,
          top: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Color(0xffA1616A)),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 25,
                        left: 25,
                      ),
                      child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        //padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AsetMenu();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Icons.bar_chart, size: 70),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Assets ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 24),
                                  maxLines: 4,),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, size: 35)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, right: 25, left: 25),
                      child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        //padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ReminderMenu();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Icons.warning_rounded, size: 70),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Reminder Aset",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Nunito",
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          "Jumlah: 10",
                                          style: TextStyle(fontFamily: "Nunito"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, right: 25, left: 25, bottom: 10),
                      child: Container(
                        height: 120,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        //padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LaporanMenu();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xffA1616A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Icons.file_copy_rounded, size: 70),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Laporan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios, size: 35)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
      drawer: DrawerBar(),
    );
  }
}
