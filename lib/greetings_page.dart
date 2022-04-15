import 'package:flutter/material.dart';
import 'package:skripsi_rania/menu_utama.dart';

class GreetingsPage extends StatefulWidget {
  const GreetingsPage({Key? key}) : super(key: key);

  @override
  State<GreetingsPage> createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset("images/iconn.png")),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Text("HALO, KISEL!", style: TextStyle(fontSize: 18)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "Selamat datang di aplikasi Asset Management",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return MenuPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffDF9A9A),
                    onPrimary: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Ketuk untuk lanjut'), // <-- Text
                      SizedBox(width: 10),
                      Icon(
                        // <-- Icon
                        Icons.arrow_right_outlined,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
