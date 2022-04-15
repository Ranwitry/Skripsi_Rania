import 'package:flutter/material.dart';
import 'package:skripsi_rania/greetings_page.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool _isHidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      "images/lampion.png",
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      //fit: BoxFit.fitWidth
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 40),
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA1616A),
                        fontSize: 55),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //keyboardType: TextInputType.emailAddress,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "*Wajib diisi"),
                      EmailValidator(errorText: "Email tidak valid"),
                    ]),
                    decoration: InputDecoration(
                      hintText: 'Masukan Email',
                      //hintStyle: ThemeFonts.hintext,
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    "Kata Sandi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //keyboardType: TextInputType.emailAddress,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "*Wajib diisi"),
                      MinLengthValidator(
                        6,
                        errorText: "Kata sandi minimal 6 karakter",
                      ),
                      MaxLengthValidator(
                        15,
                        errorText:
                            "Kata sandi tidak boleh melebihi 15 karakter",
                      )
                    ]),
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      hintText: 'Masukan Kata Sandi',
                      suffixIcon: IconButton(
                        icon: Icon(_isHidden
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                      //hintStyle: ThemeFonts.hintext,
                      fillColor: Color(0xffF6F9FE),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    left: 30,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.2,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffDF9A9A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GreetingsPage()),
                        );
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
